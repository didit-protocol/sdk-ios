// swift-tools-version:5.9

import PackageDescription

let version = "4.3.0"
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
            checksum: "d9dc832b7eef551436bcfd77dfa2cb41cb47b54ce6cc14a21c6ca85b284a5f78"
        ),
        .binaryTarget(
            name: "DiditSDKCoreBinary",
            url: "\(releaseURL)/DiditSDK-Core.xcframework.zip",
            checksum: "19d03a878468992ce5abf9daf58620946111ca15940f8215cc023b927d43f56e"
        ),
        .binaryTarget(
            name: "DiditSDKAutoDetectionBinary",
            url: "\(releaseURL)/DiditSDK-AutoDetection.xcframework.zip",
            checksum: "1dfe3a8864481cb2bc267a4ac452fd00e354e8bc29e992a60670ccdfbcc56c55"
        ),
        .binaryTarget(
            name: "DiditSDKNFCBinary",
            url: "\(releaseURL)/DiditSDK-NFC.xcframework.zip",
            checksum: "97ea5032a89b9271a5ceb331defc12fa08e1da7ed4d99a77babcbaae734984da"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "\(releaseURL)/OpenSSL.xcframework.zip",
            checksum: "133942fb34731efdb486d43c50612c7e2ca1ad78ce909e7fc18cb602e5dfc812"
        )
    ]
)
