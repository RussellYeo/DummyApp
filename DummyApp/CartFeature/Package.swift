// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CartFeature",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "CartFeature",
            targets: ["CartFeature"]
        ),
    ],
    dependencies: [
        .package(
            name: "CartPersistence",
            path: "DummyApp/CartPersistence"
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
            name: "CartFeature",
            dependencies: [
                "CartPersistence",
                "SharedModels",
                "SharedUI",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .testTarget(
            name: "CartFeatureTests",
            dependencies: ["CartFeature"]
        )
    ]
)
