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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.5.0/DiditSDK.xcframework.zip",
            checksum: "41d59f07ab0b2ea3669b44cc5f1140445552ac3d438378675d8f95f05860dc81"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.5.0/OpenSSL.xcframework.zip",
            checksum: "aaad5ebb8c281adf2b25a21a283cbbd4bfae5652e0f6021c9b12cda75c8b0bf1"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.5.0/DiditSDK-Core.xcframework.zip",
            checksum: "7c3b8727974201e51277b42871b272158ff8af881e4e2c09bc5027de2e9094a1"
        )
    ]
)
