// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiditSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "DiditSDK",
            targets: ["DiditSDKBinary", "OpenSSLBinary"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DiditSDKBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.7/DiditSDK.xcframework.zip",
            checksum: "caeff26bad47f67bf6650a0b6932fde7fe11c1b9f0c71934b276ecef4af5ebca"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.7/OpenSSL.xcframework.zip",
            checksum: "d2c94c668de923c7d8afa729a64185b8e9a55127087f82ca08d97431a4ad785f"
        )
    ]
)
