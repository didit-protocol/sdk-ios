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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.5/DiditSDK.xcframework.zip",
            checksum: "335cf69c227ffa5de2c9c127f18f8a8fd5e2dbf2b6935349d5cb7329e04b1a5c"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.5/OpenSSL.xcframework.zip",
            checksum: "9a6abf7274ebb94cc55748271a2de88186bfc8b9b0f302af6aa00281e569ffde"
        )
    ]
)
