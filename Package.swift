// swift-tools-version:5.9

import PackageDescription

let version = "4.0.3"
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
            checksum: "94a2c312356bebf84acfa7ae528f66856554c2e4d06dcbe379521af02f45d35f"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "\(releaseURL)/DiditSDK-Core.xcframework.zip",
            checksum: "ccfb4ea03d0ea425bc4056986dbe74ab91d6eadf941d443215524cc535a56647"
        ),
        .binaryTarget(
            name: "DiditSDKAutoDetectionBinary",
            url: "\(releaseURL)/DiditSDK-AutoDetection.xcframework.zip",
            checksum: "ae8d4f515db127f24ff76505c43fe4911c3e36f813058e1aa8c69bd887b9a016"
        ),
        .binaryTarget(
            name: "DiditSDKNFCBinary",
            url: "\(releaseURL)/DiditSDK-NFC.xcframework.zip",
            checksum: "1303ea0f2d2344004ce7fc463b3c0608ad6541dbd01d47ebb17cde7a85957095"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "\(releaseURL)/OpenSSL.xcframework.zip",
            checksum: "aa17d7ddd048f49d0bcecd1696d1e01cbecbe8b9c328330292e68fec99a01bfb"
        )
    ]
)
