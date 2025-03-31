// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swish",
    platforms: [.macOS("13.0")],
    products: [
        .executable(name: "swish", targets: ["swish"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMajor(from: "1.5.0")),
        .package(url: "https://github.com/tuist/FileSystem/", .upToNextMajor(from: "0.7.9")),
        .package(url: "https://github.com/tuist/command", .upToNextMajor(from: "0.13.0")),
        .package(url: "https://github.com/tuist/Noora/", .upToNextMajor(from: "0.35.6"))
    ],
    targets: [
        .executableTarget(
            name: "swish",
            dependencies: [.target(name: "SwishKit")]),
        .target(name: "SwishKit",
                dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "FileSystem", package: "FileSystem"),
            .product(name: "Command", package: "command"),
            .product(name: "Noora", package: "Noora")
                ])
    ]
)
