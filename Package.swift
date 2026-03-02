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
            checksum: "3a1babf73351a6693deba7f1ebeae48a72e09b381fbab8215d8173e9f04cb9f1"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.2/OpenSSL.xcframework.zip",
            checksum: "60fdb31be2e90c8d1d22720affe77b1be249c781a8a995981b0c60ab46db421a"
        )
    ]
)
