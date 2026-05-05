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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.4.0/DiditSDK.xcframework.zip",
            checksum: "743f5ede31585625f23306b18be9a1b9484ec32c232931e4bacf7ebb7117e9d4"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.4.0/OpenSSL.xcframework.zip",
            checksum: "ecc70a26f845e302a7d601a26b34d9a8c735b514e84f443cfb0dfde5cac1da3f"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.4.0/DiditSDK-Core.xcframework.zip",
            checksum: "e638a0528308e3c67a1d093b9a6a08d55d18915ec7a697f123b0fc1d90fbaf68"
        )
    ]
)
