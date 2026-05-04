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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.3.4/DiditSDK.xcframework.zip",
            checksum: "2a98e74ff3c2f62261376d3a5f88d84974892180e0446b988a5d95638d58d94a"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.3.4/OpenSSL.xcframework.zip",
            checksum: "cc47fe9cf117605f8ce3d49ebab5733977a4175f61b436251f68f3e4778419f6"
        )
    ]
)
