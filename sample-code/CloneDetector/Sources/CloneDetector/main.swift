import Foundation
import SwiftSyntax

let urlString = CommandLine.arguments[1]
let url = URL(fileURLWithPath: urlString)
let swiftFiles: [URL] = SwiftFileManager.find(at: url)
let clones = Detector().detect(from: swiftFiles)

clones.forEach { clone in
    clone.chunks.forEach { chunk in
        let syntax = chunk.syntax
        let sourceFile = syntax.root.as(SourceFileSyntax.self)!
        let path = chunk.url.path
        let converter = SourceLocationConverter(file: path, tree: sourceFile)
        let location = syntax.startLocation(converter: converter)
        print("\(chunk.url.path):\(location.line ?? 0):\(location.column ?? 0): warning: コードクローンの可能性があります")
    }
}
