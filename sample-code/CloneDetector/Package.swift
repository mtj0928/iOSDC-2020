// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CloneDetector",
    platforms: [.macOS(SupportedPlatform.MacOSVersion.v10_15)],
    dependencies: [
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50300.0")),
    ],
    targets: [
        .target(
            name: "CloneDetector",
            dependencies: ["SwiftSyntax"]),
        .testTarget(
            name: "CloneDetectorTests",
            dependencies: ["CloneDetector"],
            resources: [.process("Sample")]
        ),
    ]
)
