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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.1/DiditSDK.xcframework.zip",
            checksum: "d843619e1025eaa0e4a3bd92972b84b42c9fcea5133b32b7e4b5bd2651c3ea4b"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.1/OpenSSL.xcframework.zip",
            checksum: "d6a4043e2fc0885553c93f95b07f3fac2fc1a193b8f7c977b763287e5d125224"
        )
    ]
)
