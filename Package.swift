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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.3.2/DiditSDK.xcframework.zip",
            checksum: "7502470589013d22002b08c5625b5e924f5bf1d984d4f59d8852a0300a3a3030"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.3.2/OpenSSL.xcframework.zip",
            checksum: "a57a4e124eeb6b41311432ca297f6a96d5df6c1efad6e01ab38f3ce9945a7b23"
        )
    ]
)
