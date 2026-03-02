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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.2/DiditSDK.xcframework.zip",
            checksum: "61120ee25b9a1f03753f5f2ea6068ccd3a913ac5413eb714953c773492861b7e"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.2/OpenSSL.xcframework.zip",
            checksum: "7b9e59dc5b0cc87b210181cc9b080c582f219fc74accfa3674b72563ffc56d1c"
        )
    ]
)
