// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SharedUI",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SharedUI",
            targets: ["SharedUI"]
        ),
    ],
    dependencies: [
        .package(
            name: "DummyAPI",
            path: "DummyApp/DummyAPI"
        ),
        .package(
            name: "SharedModels",
            path: "DummyApp/SharedModels"
        )
    ],
    targets: [
        .target(
            name: "SharedUI",
            dependencies: ["DummyAPI", "SharedModels"]
        )
    ]
)
