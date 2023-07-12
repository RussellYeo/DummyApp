// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CartPersistence",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "CartPersistence",
            targets: ["CartPersistence"]
        ),
        .library(
            name: "CartPersistenceLive",
            targets: ["CartPersistenceLive"]
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
            name: "CartPersistence",
            dependencies: [
                "SharedModels",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .target(
            name: "CartPersistenceLive",
            dependencies: [
                "CartPersistence",
                "SharedModels",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .testTarget(
            name: "CartPersistenceLiveTests",
            dependencies: [
                "CartPersistence",
                "CartPersistenceLive",
                "SharedModels"
            ]
        )
    ]
)
