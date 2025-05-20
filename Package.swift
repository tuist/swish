// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swish",
    platforms: [.macOS("14.0")],
    products: [
        .executable(name: "swish", targets: ["swish"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMajor(from: "1.5.0")),
        .package(url: "https://github.com/tuist/FileSystem/", .upToNextMajor(from: "0.9.2")),
        .package(url: "https://github.com/tuist/command", .upToNextMajor(from: "0.13.0")),
        .package(url: "https://github.com/tuist/Noora/", .upToNextMajor(from: "0.36.2")),
        .package(url: "https://github.com/Kolos65/Mockable", revision: "68f3ed6c4b62afab27a84425494cb61421a61ac1"),
        .package(url: "https://github.com/apple/swift-service-context", .upToNextMajor(from: "1.2.0")),
    ],
    targets: [
        .executableTarget(
            name: "swish",
            dependencies: [.target(name: "SwishKit")]
        ),
        .target(name: "SwishKit",
                dependencies: [
                    .product(name: "ArgumentParser", package: "swift-argument-parser"),
                    .product(name: "FileSystem", package: "FileSystem"),
                    .product(name: "Command", package: "command"),
                    .product(name: "Noora", package: "Noora"),
                    .product(name: "Mockable", package: "Mockable"),
                    .product(name: "ServiceContextModule", package: "swift-service-context"),
                ],
                swiftSettings: [
                    .define("MOCKING", .when(configuration: .debug)),
                    .enableExperimentalFeature("StrictConcurrency"),
                ]),
    ]
)
