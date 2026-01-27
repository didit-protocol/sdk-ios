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
            url: "https://github.com/didit-protocol/didit-sdk-ios/releases/download/0.0.6/DiditSDK.xcframework.zip",
            checksum: "ba04a24bf74dae491063012a8f931ad680642a1388f8bc90038b316be840af65"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/didit-sdk-ios/releases/download/0.0.6/OpenSSL.xcframework.zip",
            checksum: "5832b2048e4aaab88e7837b0e7dc8b835a2903832c9bd88b0c6158ed13f9e2fa"
        )
    ]
)
