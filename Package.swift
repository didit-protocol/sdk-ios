// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiditSDK",
    platforms: [
        .iOS(.v15)
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
            url: "https://github.com/didit-protocol/didit-sdk-ios/releases/download/0.0.5/DiditSDK.xcframework.zip",
            checksum: "b528809b1e251b840195cdd2721004fad4739bf411829fe8dbdb18fb34bd1a51"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/didit-sdk-ios/releases/download/0.0.5/OpenSSL.xcframework.zip",
            checksum: "796998b2094046d09b6e0fac98ff564405270b02267cadeb26b663a2d08c1a41"
        )
    ]
)
