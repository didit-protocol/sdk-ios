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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.13/DiditSDK.xcframework.zip",
            checksum: "fdf4dbaf326ed72697efa59a0125fe017fdb784835ed7c11ecd70356af396969"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.13/OpenSSL.xcframework.zip",
            checksum: "35e8348b91940a3d1bb1c5c2f4b6dbec81e881e0d6e6973d969ec95d6e9fa8b1"
        )
    ]
)
