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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.3.1/DiditSDK.xcframework.zip",
            checksum: "60fbda41dc59b8960e6b7608e170157084fa2c4b1253e2c967b780e03bf93161"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.3.1/OpenSSL.xcframework.zip",
            checksum: "2543b5489709706fd0e9fc76851b2823f396c3d59fba9539e7c8bfcc4bbd37db"
        )
    ]
)
