// swift-tools-version:5.9
// CI consumer smoke package: one target per SPM product, each containing a
// real `import DiditSDK`. Compiling that import forces the toolchain to read
// the shipped .swiftinterface - exactly the path that broke in 4.7.0, when a
// leaked `import TensorFlowLite` made every consumer build fail with
// "no such module 'TensorFlowLite'". SwiftPM also re-verifies the binary
// target checksums declared in ../../Package.swift while resolving, so a
// checksum/asset mismatch fails here too.
import PackageDescription

let package = Package(
    name: "ConsumerSmoke",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "ConsumerAll", targets: ["ConsumerAll"]),
        .library(name: "ConsumerCore", targets: ["ConsumerCore"]),
        .library(name: "ConsumerAutoDetection", targets: ["ConsumerAutoDetection"]),
        .library(name: "ConsumerNFC", targets: ["ConsumerNFC"])
    ],
    dependencies: [
        .package(name: "DiditSDK", path: "../..")
    ],
    targets: [
        .target(
            name: "ConsumerAll",
            dependencies: [.product(name: "DiditSDK", package: "DiditSDK")]
        ),
        .target(
            name: "ConsumerCore",
            dependencies: [.product(name: "DiditSDKCore", package: "DiditSDK")]
        ),
        .target(
            name: "ConsumerAutoDetection",
            dependencies: [.product(name: "DiditSDKAutoDetection", package: "DiditSDK")]
        ),
        .target(
            name: "ConsumerNFC",
            dependencies: [.product(name: "DiditSDKNFC", package: "DiditSDK")]
        )
    ]
)
