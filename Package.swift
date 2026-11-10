// swift-tools-version:5.9

import PackageDescription

let version = "4.14.2"
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
            checksum: "4c57a322d88f51ab0f983f71bb4daf3c494533e00b90fb2feb8cd16b0ef6e93c"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "\(releaseURL)/DiditSDK-Core.xcframework.zip",
            checksum: "110a75a21879b0e42cb1fc8b271d5c318b9ff96f1e02004af690043b279e97d1"
        ),
        .binaryTarget(
            name: "DiditSDKAutoDetectionBinary",
            url: "\(releaseURL)/DiditSDK-AutoDetection.xcframework.zip",
            checksum: "13a0e14645bcc3a71266fe8619300e5f0be599472420b827d5a8809de64b80df"
        ),
        .binaryTarget(
            name: "DiditSDKNFCBinary",
            url: "\(releaseURL)/DiditSDK-NFC.xcframework.zip",
            checksum: "2eb4375d06c6be5285fb021cf4a51a62c947e8793e0553afa151ad16f9a66703"
        ),
        .binaryTarget(
            name: "DiditSDKAllLocationBinary",
            url: "\(releaseURL)/DiditSDK-Location.xcframework.zip",
            checksum: "08587b4952d5d020c40b63d6807e11abc354e597db83be19de061f2a4fda18a2"
        ),
        .binaryTarget(
            name: "DiditSDKCoreLocationBinary",
            url: "\(releaseURL)/DiditSDK-Core-Location.xcframework.zip",
            checksum: "6e4462adbdd71dbdbbf5b56ef9dbcc0595d5f1400c4128c78fcda14871b45376"
        ),
        .binaryTarget(
            name: "DiditSDKNFCLocationBinary",
            url: "\(releaseURL)/DiditSDK-NFC-Location.xcframework.zip",
            checksum: "f0140346a6ea726d206032740d1130ad27468b3826509047f3a05aa05722d724"
        ),
        .binaryTarget(
            name: "DiditSDKSignalsBinary",
            url: "\(releaseURL)/DiditSDK-Signals.xcframework.zip",
            checksum: "43c10b376122d0f92ea68a6c50e52fbf2766a122bbf3689cb5a19ebe41959547"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "\(releaseURL)/OpenSSL.xcframework.zip",
            checksum: "b258827d63bf1383f8774bd25eda8b02deccddfc115dfd437bd36caacbb0a5e5"
        ),
        .binaryTarget(
            name: "DiditAuthBinary",
            url: "\(releaseURL)/DiditAuth.xcframework.zip",
            checksum: "00acbf2953139463bf6b24e754daf43fe678a2381d82ab65ddd5f5c1f335b605"
        )
    ]
)
