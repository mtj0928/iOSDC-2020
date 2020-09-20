import SwiftSyntax
import Foundation

class Visitor: SyntaxVisitor {

    private(set) var chunks = [CodeChunk]()
    private let source: String
    private let url: URL

    init(source: String, at url: URL) {
        self.source = source
        self.url = url
    }

    override func visit(_ node: CodeBlockItemListSyntax) -> SyntaxVisitorContinueKind {
        let tokens: [String] = TokenNormalizer().normalize(node)
        print(tokens.joined(separator: ", "))
        let chunk = CodeChunk(tokens: tokens, syntax: node.parent!, source: source, url: url)
        chunks.append(chunk)
        return super.visit(node)
    }
}
