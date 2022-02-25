// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "swiftui-photos-picker",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "PhotosPicker",
            targets: ["PhotosPicker"])
    ],
    targets: [
        .target(name: "PhotosPicker")
    ]
)
