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
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.4/DiditSDK.xcframework.zip",
            checksum: "68c142f1ab2236e0032074bf11584f80814c75ecbeb1dd43a6abcf55b9fc2015"
        ),
        .binaryTarget(
            name: "OpenSSLBinary",
            url: "https://github.com/didit-protocol/sdk-ios/releases/download/3.2.4/OpenSSL.xcframework.zip",
            checksum: "66bd9529b7e81f09b9eae0e94ebb75059dc10bca71ebfdf36d373c150bad1846"
        )
    ]
)
