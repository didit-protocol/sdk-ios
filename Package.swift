// swift-tools-version:5.9

import PackageDescription

let version = "4.15.6"
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
        .library(name: "DiditSDKNFC",            targets: ["DiditSDKNFCBinary", "OpenSSLBinary"]),
        // The variants above with the Location verification step (Core Location); each replaces its plain one.
        .library(name: "DiditSDKLocation",       targets: ["DiditSDKAllLocationBinary", "OpenSSLBinary"]),
        .library(name: "DiditSDKCoreLocation",   targets: ["DiditSDKCoreLocationBinary"]),
        .library(name: "DiditSDKNFCLocation",    targets: ["DiditSDKNFCLocationBinary", "OpenSSLBinary"]),
        // Device signals and event submission on their own (`import DiditSDK`); the products above include them.
        .library(name: "DiditSDKSignals",        targets: ["DiditSDKSignalsBinary"]),
        // Authentication on its own (`import DiditAuth`, iOS 15+); the products above include it.
        .library(name: "DiditAuth",              targets: ["DiditAuthBinary"])
    ],
    targets: [
        .binaryTarget(
            name: "DiditSDKAllBinary",
            url: "\(releaseURL)/DiditSDK.xcframework.zip",
            checksum: "4f2132b26043a00b374849f6faf231db35bdef2395ac0bc45aa3c7ada57c6b8a"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "\(releaseURL)/DiditSDK-Core.xcframework.zip",
            checksum: "e2ed09acdc579ead0e66989b83a19efc78282546facc59bdc58f521f48e63c94"
        ),
        .binaryTarget(
            name: "DiditSDKAutoDetectionBinary",
            url: "\(releaseURL)/DiditSDK-AutoDetection.xcframework.zip",
            checksum: "e2bcd7df29deef3f841229f85ded7d084e718118a3cea7108a3db5ca98078c4a"
        ),
        .binaryTarget(
            name: "DiditSDKNFCBinary",
            url: "\(releaseURL)/DiditSDK-NFC.xcframework.zip",
            checksum: "8ad15a3c194f87e396648a6421d4a584dc7c9547c9620d4e3ebb8ffe983c9be6"
        ),
        .binaryTarget(
            name: "DiditSDKAllLocationBinary",
            url: "\(releaseURL)/DiditSDK-Location.xcframework.zip",
            checksum: "dbd821dd1270d9e470793dfeb9a9e8abb173982acbfd4f11566e8daf61d357bb"
        ),
        .binaryTarget(
            name: "DiditSDKCoreLocationBinary",
            url: "\(releaseURL)/DiditSDK-Core-Location.xcframework.zip",
            checksum: "4ef8107bf09fdb7a37f533a8f09d87a71ef0e7b8c3fc7448a878a62844a70951"
        ),
        .binaryTarget(
            name: "DiditSDKNFCLocationBinary",
            url: "\(releaseURL)/DiditSDK-NFC-Location.xcframework.zip",
            checksum: "22e55c938eb537e6b438b717af482741a48d695cb8a9b887212698519651a9e0"
        ),
        .binaryTarget(
            name: "DiditSDKSignalsBinary",
            url: "\(releaseURL)/DiditSDK-Signals.xcframework.zip",
            checksum: "bc436a6a8c8a26d33a4f210ac050e16c7012e9e0b3bc838ac1a14453712dbe4e"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "\(releaseURL)/OpenSSL.xcframework.zip",
            checksum: "0b955b72bf0109f47b801025faa52fd04f5728fd5ba413acdc55dee78f1f44de"
        ),
        .binaryTarget(
            name: "DiditAuthBinary",
            url: "\(releaseURL)/DiditAuth.xcframework.zip",
            checksum: "6855313cbd8f55b6fc7581dba0df750a1bd428a36abcc38dffb28d97c14daca4"
        )
    ]
)
