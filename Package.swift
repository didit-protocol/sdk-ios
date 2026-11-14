// swift-tools-version:5.9

import PackageDescription

let version = "4.15.3"
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
            checksum: "c1e31983363508ed671ad702e2bf48d44673641dadb707c5ea60eeef360fefdc"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "\(releaseURL)/DiditSDK-Core.xcframework.zip",
            checksum: "7afab4f646109bdbca35ff07f428e45aa26390b5e7f279d4cb3bce71fa90c82e"
        ),
        .binaryTarget(
            name: "DiditSDKAutoDetectionBinary",
            url: "\(releaseURL)/DiditSDK-AutoDetection.xcframework.zip",
            checksum: "a568963a4bbe726345a23995a768f73bc810187f47ce877d01674135fdfabd2d"
        ),
        .binaryTarget(
            name: "DiditSDKNFCBinary",
            url: "\(releaseURL)/DiditSDK-NFC.xcframework.zip",
            checksum: "4796148defb8339f6a2d239287085c1ca2a2ea108db8992597b66bd379fda68d"
        ),
        .binaryTarget(
            name: "DiditSDKAllLocationBinary",
            url: "\(releaseURL)/DiditSDK-Location.xcframework.zip",
            checksum: "efc295d568efd75e39033685556af82639f1b80f3ba46bc3d709995ef9b70bd0"
        ),
        .binaryTarget(
            name: "DiditSDKCoreLocationBinary",
            url: "\(releaseURL)/DiditSDK-Core-Location.xcframework.zip",
            checksum: "72fed006f884ac2d67b17702f60d534ff59b641bb1944c9d1e610aaa42da8855"
        ),
        .binaryTarget(
            name: "DiditSDKNFCLocationBinary",
            url: "\(releaseURL)/DiditSDK-NFC-Location.xcframework.zip",
            checksum: "0220384dceb9f764866bb0ac4ac9eb24ae6e00a2662f4a014374953638337d50"
        ),
        .binaryTarget(
            name: "DiditSDKSignalsBinary",
            url: "\(releaseURL)/DiditSDK-Signals.xcframework.zip",
            checksum: "bb9dffd60ed2f9611a522c983c7c7ad384caf3b51d89cae2495413ce11524115"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "\(releaseURL)/OpenSSL.xcframework.zip",
            checksum: "a067502569e928e257354c38b8fba013c00e0079c684ff268d0bb9d2a6acf474"
        ),
        .binaryTarget(
            name: "DiditAuthBinary",
            url: "\(releaseURL)/DiditAuth.xcframework.zip",
            checksum: "d86e229d9de843fa22367a6086b012cb24b8d53c518dde37389002977f97dbc5"
        )
    ]
)
