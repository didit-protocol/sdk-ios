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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.6/DiditSDK.xcframework.zip",
            checksum: "8dcb27c7a5b10abf6fff992d087dc83be76af221e90fa9c11f0c6b47d5846e43"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.6/OpenSSL.xcframework.zip",
            checksum: "6492edea35fc15fa70cdc904a059b241b45eb2ab24f8e426815a59f6a52cf32e"
        )
    ]
)
