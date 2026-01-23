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
            targets: ["DiditSDKBinary", "OpenSSLBinary"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DiditSDKBinary",
            url: "https://github.com/didit-protocol/didit-sdk-ios/releases/download/0.0.4/DiditSDK.xcframework.zip",
            checksum: "eecebed8618aaa8e48ef1102bce0a66aeb74b01f4ceb8dbd4a311b7b75611cac"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/didit-sdk-ios/releases/download/0.0.4/OpenSSL.xcframework.zip",
            checksum: "0acd5ebcf8a60f76175a7d4a2e410123dcdfc48098cfc3913db5640394f53794"
        )
    ]
)
