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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.11/DiditSDK.xcframework.zip",
            checksum: "de4a767e6cb83962492fa4bfe85bdef84a402197cf82c6aa4b3579737b61f83a"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.11/OpenSSL.xcframework.zip",
            checksum: "106624c8232bddee97cd54f979a2f2c50d9ed5f82add545e3914807c9591e89d"
        )
    ]
)
