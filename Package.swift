// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "DummyApp",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "CartFeature", targets: ["CartFeature"]),
        .library(name: "CartPersistence", targets: ["CartPersistence"]),
        .library(name: "CartPersistenceLive", targets: ["CartPersistenceLive"]),
        .library(name: "DummyAPI", targets: ["DummyAPI"]),
        .library(name: "DummyAPILive", targets: ["DummyAPILive"]),
        .library(name: "HomeFeature", targets: ["HomeFeature"]),
        .library(name: "PathMonitorClient", targets: ["PathMonitorClient"]),
        .library(name: "PathMonitorClientLive", targets: ["PathMonitorClientLive"]),
        .library(name: "SharedModels", targets: ["SharedModels"]),
        .library(name: "SharedModelsMocks", targets: ["SharedModelsMocks"]),
        .library(name: "SharedModelsPreview", targets: ["SharedModelsPreview"]),
        .library(name: "SharedUI", targets: ["SharedUI"])
    ],
    dependencies: [
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
        ),
        .target(
            name: "CartPersistence",
            dependencies: [
                "SharedModels",
                "SharedModelsMocks",
                "SharedModelsPreview",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .target(
            name: "CartPersistenceLive",
            dependencies: [
                "CartPersistence",
                "SharedModels",
                "SharedModelsPreview",
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
        ),
        .target(
            name: "DummyAPI",
            dependencies: [
                "SharedModels",
                "SharedModelsPreview",
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
        .target(
            name: "HomeFeature",
            dependencies: [
                "CartPersistence",
                "DummyAPI",
                "PathMonitorClient",
                "SharedModels",
                "SharedUI",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .testTarget(
            name: "HomeFeatureTests",
            dependencies: ["HomeFeature"]
        ),
        .target(
            name: "PathMonitorClient",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .target(
            name: "PathMonitorClientLive",
            dependencies: [
                "PathMonitorClient",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .testTarget(
            name: "PathMonitorClientLiveTests",
            dependencies: ["PathMonitorClientLive"]
        ),
        .target(
            name: "SharedModels"
        ),
        .target(
            name: "SharedModelsMocks",
            dependencies: ["SharedModels"]
        ),
        .target(
            name: "SharedModelsPreview",
            dependencies: ["SharedModels"],
            resources: [
                .process("Assets.xcassets")
            ]
        ),
        .target(
            name: "SharedUI",
            dependencies: [
                "DummyAPI",
                "SharedModels"
            ]
        )
    ]
)
