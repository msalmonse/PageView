// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PageView",
    products: [
        .library(
            name: "PageView",
            targets: ["PageView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PageView",
            dependencies: []),
        .testTarget(
            name: "PageViewTests",
            dependencies: ["PageView"]),
    ]
)
