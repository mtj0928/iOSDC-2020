import SwiftSyntax

class TokenNormalizer {
    private var identifierMap = [String: Int]()
    private var counter = 0

    func normalize(_ node: SyntaxProtocol) -> [String] {
        node.tokens.map { token -> String in
            guard case .identifier(let identifier)  = token.tokenKind,
                let parent = token.parent else {
                return token.text
            }

            if parent.is(IdentifierPatternSyntax.self) || parent.is(ClosureParamSyntax.self) {
                let id = getOrCreateId(identifier)
                return "_$\(id)"
            }

            if parent.is(IdentifierExprSyntax.self), let grandparent = parent.parent {
                if !grandparent.is(FunctionCallExprSyntax.self) {
                    let id = getOrCreateId(identifier)
                    return "_$\(id)"
                }

                if grandparent.is(FunctionCallExprSyntax.self), let id = getId(identifier) {
                    return "_$\(id)"
                }
            }

            return token.text
        }
    }

    private func getId(_ identifier: String) -> Int? {
        identifierMap[identifier]
    }

    private func createId(_ identifier: String) -> Int {
        let id = counter
        identifierMap[identifier] = id
        counter += 1
        return id
    }

    private func getOrCreateId(_ identifier: String) -> Int {
        getId(identifier) ?? createId(identifier)
    }
}
