import Foundation
import SwiftSyntax

public class Detector {

    let minimumTokenNumber: Int

    public init(minimumTokenNumber: Int = 20) {
        self.minimumTokenNumber = minimumTokenNumber
    }

    public func detect(from swiftFiles: [URL]) -> [CodeClone] {
        let chunks: [CodeChunk] = swiftFiles.flatMap { url -> [CodeChunk] in
            guard let source = try? String(contentsOf: url),
                let syntax = try? SyntaxParser.parse(source: source) else {
                    return []
            }
            let visitor = Visitor(source: source, at: url)
            visitor.walk(syntax)
            return visitor.chunks
        }

        let clones = Dictionary(grouping: chunks, by: { $0.tokens })
            .filter { $0.key.count >= minimumTokenNumber } // 短すぎるコード片を取り除くため
            .filter { $0.value.count >= 2 }
            .map { CodeClone(chunks: $0.value) }
        return clones
    }
}
