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
        ),
        .library(
            name: "DiditSDKCore",
            targets: ["DiditSDKCoreBinary"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DiditSDKBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.6.0/DiditSDK.xcframework.zip",
            checksum: "58bfac2aa06208bf8508b4c75b8917a46837577b01d13cee131b0226777460f3"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.6.0/OpenSSL.xcframework.zip",
            checksum: "9859428eb981a9481e63a70270b82dafb6f1a39ae2ed18fe289244b5dbece3da"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.6.0/DiditSDK-Core.xcframework.zip",
            checksum: "bb074941275f2793662d2a564fdccc242623fa818b24fc0a56cbdaac680a8991"
        )
    ]
)
