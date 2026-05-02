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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.3.3/DiditSDK.xcframework.zip",
            checksum: "1052235f6c9a68102a4d78e7439612c5358b208270f1c4bef3fda7c3a492ea8a"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.3.3/OpenSSL.xcframework.zip",
            checksum: "74e2b4e2741dfe1a6976cbe423e4c7fd1aa1bad25bed5f0e318699ba549b42db"
        )
    ]
)
