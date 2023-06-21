// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "DummyAPI",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "DummyAPI",
            targets: ["DummyAPI"]
        ),
    ],
    targets: [
        .target(
            name: "DummyAPI"),
        .testTarget(
            name: "DummyAPITests",
            dependencies: ["DummyAPI"]
        ),
    ]
)
