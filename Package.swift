// swift-tools-version:5.9

import PackageDescription

let version = "4.2.0"
let releaseURL = "https://github.com/didit-protocol/sdk-ios/releases/download/\(version)"

let package = Package(
    name: "DiditSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "DiditSDK",               targets: ["DiditSDKAllBinary", "OpenSSLBinary"]),
        .library(name: "DiditSDKCore",           targets: ["DiditSDKCoreBinary"]),
        .library(name: "DiditSDKAutoDetection",  targets: ["DiditSDKAutoDetectionBinary"]),
        .library(name: "DiditSDKNFC",            targets: ["DiditSDKNFCBinary", "OpenSSLBinary"])
    ],
    targets: [
        .binaryTarget(
            name: "DiditSDKAllBinary",
            url: "\(releaseURL)/DiditSDK.xcframework.zip",
            checksum: "b1feb751afa940248f6306b0682a6fc5d74fcb3c435196fe861909494f9923ce"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "\(releaseURL)/DiditSDK-Core.xcframework.zip",
            checksum: "be557246bd6472d237bedde6c402dd1f0826a8ed38e1eb3fb2d846c92797128a"
        ),
        .binaryTarget(
            name: "DiditSDKAutoDetectionBinary",
            url: "\(releaseURL)/DiditSDK-AutoDetection.xcframework.zip",
            checksum: "794de001a206c1aa0dbe2d34b2728d5801aacb22b8e68fca3f93fcc3b04bc23f"
        ),
        .binaryTarget(
            name: "DiditSDKNFCBinary",
            url: "\(releaseURL)/DiditSDK-NFC.xcframework.zip",
            checksum: "73e40c91c24c02ffedf4bfba87f6593234dc1a5af8ee51aaee576a4ae16bdcf4"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "\(releaseURL)/OpenSSL.xcframework.zip",
            checksum: "ff59e820bc380db549900b772856e0f0918e35a909525753f33c2a434f493690"
        )
    ]
)
