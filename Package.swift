// swift-tools-version:5.9

import PackageDescription

let version = "4.0.5"
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
            checksum: "85b230e310d542784b08d537da4f91dbe675b9066c381f67c536b212a4044d4b"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "\(releaseURL)/DiditSDK-Core.xcframework.zip",
            checksum: "214a6fd926e3204c7d02a98df4ac767bc7f4e67f28ce8594b6626f038a6e7492"
        ),
        .binaryTarget(
            name: "DiditSDKAutoDetectionBinary",
            url: "\(releaseURL)/DiditSDK-AutoDetection.xcframework.zip",
            checksum: "c604fd7d76c32a79402766b20651491e34dba57f700ab197bf7a0b4530b10e1d"
        ),
        .binaryTarget(
            name: "DiditSDKNFCBinary",
            url: "\(releaseURL)/DiditSDK-NFC.xcframework.zip",
            checksum: "d1d1546a07dbf46f7109738585098c67a89c6b797be8daa877409262f3caffc0"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "\(releaseURL)/OpenSSL.xcframework.zip",
            checksum: "179763e948b4663347dc32789343ec12a8139e3fad59bbe1b830c9bae81624ba"
        )
    ]
)
