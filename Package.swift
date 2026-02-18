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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.0/DiditSDK.xcframework.zip",
            checksum: "03a1d0446e10978cc402d7f1a2c9bc756ebc54dd999f6b41f2ff4a3dd028c51d"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.0/OpenSSL.xcframework.zip",
            checksum: "925a997e4b8cdf0cf70f127b8111dcfa764541986a4f64d6465832dd0fd8b172"
        )
    ]
)
