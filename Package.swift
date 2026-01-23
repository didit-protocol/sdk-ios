// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiditSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DiditSDK",
            targets: ["DiditSDK", "DiditSDKBinary"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/AndyQ/NFCPassportReader.git", from: "2.3.0")
    ],
    targets: [
        .binaryTarget(
            name: "DiditSDKBinary",
            url: "https://github.com/didit-protocol/didit-sdk-ios/releases/download/0.0.2/DiditSDK.xcframework.zip",
            checksum: "68acf212007e66313a9623fda7e0c003e2499361136608de36208a703a9b4c1a"
        ),
        .target(
            name: "DiditSDK",
            dependencies: [
                "DiditSDKBinary",
                .product(name: "NFCPassportReader", package: "NFCPassportReader")
            ],
            path: "Sources/DiditSDK"
        )
    ]
)
