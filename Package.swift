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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.6.1/DiditSDK.xcframework.zip",
            checksum: "749f79bc461d92ddeff1db595cf0e1f948fd48d0a7f37086646c3ccbac6c93a9"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.6.1/OpenSSL.xcframework.zip",
            checksum: "a286b87967075177edac53ae564af235e8cd380e33284554ab893d03e74ae33e"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.6.1/DiditSDK-Core.xcframework.zip",
            checksum: "5ff51eb1fe3a67f070295902f15ffc4cf19243b37468900931a32290a1df1702"
        )
    ]
)
