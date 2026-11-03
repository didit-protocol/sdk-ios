// swift-tools-version:5.9

import PackageDescription

let version = "4.12.1"
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
            checksum: "aab0eb56674a2947aa8aa836b92d07abe1267ae60e887e6ef532bfc99ed7a568"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "\(releaseURL)/DiditSDK-Core.xcframework.zip",
            checksum: "09febb1d6d91bf9135d05d16124bb4cb0ada32bb1ff76891ed8139478cda8bef"
        ),
        .binaryTarget(
            name: "DiditSDKAutoDetectionBinary",
            url: "\(releaseURL)/DiditSDK-AutoDetection.xcframework.zip",
            checksum: "15e64be5ea31a947ed7031e1b54bf4ba14638702348c3a1b39e51e287cde9ae0"
        ),
        .binaryTarget(
            name: "DiditSDKNFCBinary",
            url: "\(releaseURL)/DiditSDK-NFC.xcframework.zip",
            checksum: "9a9f3f2ea0b4d8c5b5ed89919b926a2991513d66eebc6a75bdc9bc686cda649a"
        ),
        .binaryTarget(
            name: "DiditSDKAllLocationBinary",
            url: "\(releaseURL)/DiditSDK-Location.xcframework.zip",
            checksum: "7a3ae232fb24c4985da524acf009d7588cc1e41d2078720202b9a50d9fb5690c"
        ),
        .binaryTarget(
            name: "DiditSDKCoreLocationBinary",
            url: "\(releaseURL)/DiditSDK-Core-Location.xcframework.zip",
            checksum: "8f2363b35b8d93ec0d686044a5130d1977cc52c36378b4226925599f44ac71a7"
        ),
        .binaryTarget(
            name: "DiditSDKNFCLocationBinary",
            url: "\(releaseURL)/DiditSDK-NFC-Location.xcframework.zip",
            checksum: "eb8e8bebbf08209a3b6c52e36f872c34847203cdb5a4308895f9bfbbe4f68613"
        ),
        .binaryTarget(
            name: "DiditSDKSignalsBinary",
            url: "\(releaseURL)/DiditSDK-Signals.xcframework.zip",
            checksum: "647f1e8e5a719aea15104db9856e9b831905b2cbe4342ff5545ca9f2494ff824"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "\(releaseURL)/OpenSSL.xcframework.zip",
            checksum: "356c2646aaeb3fb3c1b33fbfcc425bc420799a4430781923ee55f0c8bcac0956"
        ),
        .binaryTarget(
            name: "DiditAuthBinary",
            url: "\(releaseURL)/DiditAuth.xcframework.zip",
            checksum: "8cc8ce8c2f3734f63336a86239d22b7e6d16e21e9bfb9f3a00898232b408297b"
        )
    ]
)
