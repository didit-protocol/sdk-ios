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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.6.2/DiditSDK.xcframework.zip",
            checksum: "eb1b9797c069ff354b61cdadaeaa11a5a918cf0b0aa8df278fa9d705920da7bf"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.6.2/OpenSSL.xcframework.zip",
            checksum: "ae662ce75ab480299ca2581bd6c481b4702e58eb8e06bc3568a7795b43fd3c6f"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.6.2/DiditSDK-Core.xcframework.zip",
            checksum: "3fddcbc6576e731958076198a6dbd6c4488e58452e8488550978bdbc5f423ba6"
        )
    ]
)
