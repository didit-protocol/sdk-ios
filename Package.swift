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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.3/DiditSDK.xcframework.zip",
            checksum: "f75f9772d0dfd59abde5431a3ff93a1d4323851a6c09f14e9812d5b5566945af"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.3/OpenSSL.xcframework.zip",
            checksum: "f1abec17d0d64a25cdd17b4076f4bddb69d9382025e8e5c88155b213ba8cc435"
        )
    ]
)
