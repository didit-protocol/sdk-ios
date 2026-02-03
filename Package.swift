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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.1.0/DiditSDK.xcframework.zip",
            checksum: "4cc6906f0a2fc64f2433ebd64e95fe4e3e1ce672987645b155e51e2f5928f787"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.1.0/OpenSSL.xcframework.zip",
            checksum: "572a817280536b517520b702896911da12c5f829a20b9753e40e3f2a21209dcf"
        )
    ]
)
