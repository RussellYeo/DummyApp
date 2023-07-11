// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PathMonitorClient",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "PathMonitorClient",
            targets: ["PathMonitorClient"]
        ),
        .library(
            name: "PathMonitorClientLive",
            targets: ["PathMonitorClientLive"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-dependencies",
            from: "0.5.1"
        )
    ],
    targets: [
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
        )
    ]
)
