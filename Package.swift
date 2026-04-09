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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.10/DiditSDK.xcframework.zip",
            checksum: "9670a5ba206f99a034c705b7d6e689e7dade48dc46889c82c71064fb8df6a05b"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.10/OpenSSL.xcframework.zip",
            checksum: "7dec2a7a2ea397a9bc853756a76ce24fe388e968a0491e5173d86dadcc29e254"
        )
    ]
)
