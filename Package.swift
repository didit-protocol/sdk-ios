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
            checksum: "920ba179b1a2bdbb1dcdfa7d7b2bd36ca583df47ba31322c4f9aa4fe57b767ed"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.5.1/OpenSSL.xcframework.zip",
            checksum: "18ed8b1047a3568a4163e4e73e7e102e183e30d0a52aa91488a5f21937f3f8bb"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.5.1/DiditSDK-Core.xcframework.zip",
            checksum: "f955044be833267ea1d8bfc6668e71b05e4ea5f8810b026e7c0328119fc8834e"
        )
    ]
)
