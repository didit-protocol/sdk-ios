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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.8/DiditSDK.xcframework.zip",
            checksum: "0be5016d47c70b5278e565245ec58b4cc432cec9009234e511a4bcfa7466b67a"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.8/OpenSSL.xcframework.zip",
            checksum: "a4c5aa72aebc9a38c63d323ae0f93aa159a817a62c4ca4c96fa4154e1e00fb74"
        )
    ]
)
