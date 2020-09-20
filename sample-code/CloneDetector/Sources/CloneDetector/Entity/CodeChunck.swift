import SwiftSyntax
import Foundation

public struct CodeChunk {
    public let tokens: [String]
    public let syntax: SyntaxProtocol
    public let source: String
    public let url: URL
}
