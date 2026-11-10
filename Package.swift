// swift-tools-version:5.9

import PackageDescription

let version = "4.14.3"
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
            checksum: "40eb75dd9f4c98a2645e455cf74a0e927ae2b6a9586d1d6babba0987686e61ac"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "\(releaseURL)/DiditSDK-Core.xcframework.zip",
            checksum: "cd2bf39afd76977b3c04716e9f08b6223449afbeae7bcae72c98bc3c90563d38"
        ),
        .binaryTarget(
            name: "DiditSDKAutoDetectionBinary",
            url: "\(releaseURL)/DiditSDK-AutoDetection.xcframework.zip",
            checksum: "0e714c89272c819abaaf62e82d79042f3fd4a2391e8bde3292eabaefafd65aa6"
        ),
        .binaryTarget(
            name: "DiditSDKNFCBinary",
            url: "\(releaseURL)/DiditSDK-NFC.xcframework.zip",
            checksum: "c81c2c706b1b9ab5507d1162c3da3550ad654dee453366d417c4a0814e018cb8"
        ),
        .binaryTarget(
            name: "DiditSDKAllLocationBinary",
            url: "\(releaseURL)/DiditSDK-Location.xcframework.zip",
            checksum: "bfd02aa9ed8d3489eb4e319cb8641b098d779828858f23acc52c53c99a23e2ff"
        ),
        .binaryTarget(
            name: "DiditSDKCoreLocationBinary",
            url: "\(releaseURL)/DiditSDK-Core-Location.xcframework.zip",
            checksum: "428a14743d30db1d8b813e768ff75c912d3d987f6d61e3c813714bb7de26ebe7"
        ),
        .binaryTarget(
            name: "DiditSDKNFCLocationBinary",
            url: "\(releaseURL)/DiditSDK-NFC-Location.xcframework.zip",
            checksum: "3002a01d7f3a89a6f03973b1ae0ebd2a3efc5fc003c47889e21b3d21b93106d7"
        ),
        .binaryTarget(
            name: "DiditSDKSignalsBinary",
            url: "\(releaseURL)/DiditSDK-Signals.xcframework.zip",
            checksum: "8f0a2ee83a5166ac500df784035e9a8e5315235afb2d4798b64c08e495c7394e"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "\(releaseURL)/OpenSSL.xcframework.zip",
            checksum: "242c4c712d79654a84a91d37cd9c9928b8a794bb9ef3c01fcfd2d6d7ca84bc59"
        ),
        .binaryTarget(
            name: "DiditAuthBinary",
            url: "\(releaseURL)/DiditAuth.xcframework.zip",
            checksum: "f6704a99c9359d7eb25deaa7dd5f512a45d708bfa5f19ae4e2fdfe6f13f5daf9"
        )
    ]
)
