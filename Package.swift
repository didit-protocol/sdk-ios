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
        ),
        .library(
            name: "DiditSDKCore",
            targets: ["DiditSDKCoreBinary"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DiditSDKBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.5.1/DiditSDK.xcframework.zip",
            checksum: "ae8f932a4551a9a4d3b1345d269f7a4872c4780c7b19a07af00991e56fcc7d7f"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.5.1/OpenSSL.xcframework.zip",
            checksum: "30898b3767407ffbb7526cbf7a6c10df96f7af2f7c09eb2c00c71c154cdb5f8d"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.5.1/DiditSDK-Core.xcframework.zip",
            checksum: "7ced5142d0278ed1b17af2825b15f620f1346b2955e123e4d5fafc4e5e60604a"
        )
    ]
)
