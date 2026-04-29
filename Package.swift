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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.3.0/DiditSDK.xcframework.zip",
            checksum: "505633cd5a905b5b52749f97e651a9005b4e27048a3866ae9cef6ce82d1f152f"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.3.0/OpenSSL.xcframework.zip",
            checksum: "e58e7ba32e098ba8f593c89e0a1426bb8e1992a6e0df712522f73d4de7d786b5"
        )
    ]
)
