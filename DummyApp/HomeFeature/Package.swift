// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "HomeFeature",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "HomeFeature",
            targets: ["HomeFeature"]
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
        ),
        .package(
            name: "SharedUI",
            path: "DummyApp/SharedUI"
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-dependencies",
            from: "0.5.1"
        )
    ],
    targets: [
        .target(
            name: "HomeFeature",
            dependencies: [
                "DummyAPI",
                "SharedModels",
                "SharedUI",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .testTarget(
            name: "HomeFeatureTests",
            dependencies: ["HomeFeature"]
        )
    ]
)
