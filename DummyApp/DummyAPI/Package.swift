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
        .library(
            name: "DummyAPILive",
            targets: ["DummyAPILive"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "DummyAPI"
        ),
        .target(
            name: "DummyAPILive",
            dependencies: ["DummyAPI"]
        ),
        .testTarget(
            name: "DummyAPILiveTests",
            dependencies: ["DummyAPILive"]
        ),
    ]
)
