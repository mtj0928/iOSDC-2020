import Foundation

class SwiftFileManager {

    static func find(at url: URL) -> [URL] {
        var isDir: ObjCBool = false
        if FileManager.default.fileExists(atPath: url.relativePath, isDirectory: &isDir) && !isDir.boolValue {
            return url.pathExtension == "swift" ? [url] : []
        }

        return FileManager.default
            .subpaths(atPath: url.relativePath)?
            .compactMap {
                url.appendingPathComponent($0)
        }.filter {$0.pathExtension == "swift" } ?? []
    }
}
