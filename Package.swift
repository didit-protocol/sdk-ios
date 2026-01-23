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
            url: "https://github.com/didit-protocol/didit-sdk-ios/releases/download/0.0.3/DiditSDK.xcframework.zip",
            checksum: "2b99e52602ba7c32e2bdffe2b44655406bc9413e17cf760fe42913c28ff8affd"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/didit-sdk-ios/releases/download/0.0.3/OpenSSL.xcframework.zip",
            checksum: "4c1d37f862ff555de96974305f0e3308f3f5e83f93d8045045e21dac348d2119"
        )
    ]
)
