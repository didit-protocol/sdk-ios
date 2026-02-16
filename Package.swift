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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.1.1/DiditSDK.xcframework.zip",
            checksum: "e5d464cd952814fcdb77b9b8f28c201b32f2136ba8be4fa36807070193890c3f"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.1.1/OpenSSL.xcframework.zip",
            checksum: "4529994cc71c2c5c4b676c3508742a9712ed209e9a7b81ef3ffbf7097244166a"
        )
    ]
)
