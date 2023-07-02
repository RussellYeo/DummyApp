// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SharedModels",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SharedModels",
            targets: ["SharedModels", "SharedModelsMocks", "SharedModelsPreview"]
        )
    ],
    targets: [
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
            resources: [.process("Assets.xcassets")]
        )
    ]
)
