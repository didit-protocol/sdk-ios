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
        )
    ],
    targets: [
        .binaryTarget(
            name: "DiditSDKBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.12/DiditSDK.xcframework.zip",
            checksum: "8078df9856ab16431a3d76bb65cbd712dc6e343338e86620f97e0197cace31c0"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.12/OpenSSL.xcframework.zip",
            checksum: "07de718aa08f4a0e422fc1d8ef314b99ea5c4ccf3ad8c80423537f76dd4c20ae"
        )
    ]
)
