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
        )
    ],
    dependencies: [
        .package(
            name: "SharedModels",
            path: "DummyApp/SharedModels"
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-dependencies",
            from: "0.5.1"
        )
    ],
    targets: [
        .target(
            name: "DummyAPI",
            dependencies: [
                "SharedModels",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .target(
            name: "DummyAPILive",
            dependencies: [
                "DummyAPI",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .testTarget(
            name: "DummyAPILiveTests",
            dependencies: ["DummyAPILive"]
        ),
    ]
)
