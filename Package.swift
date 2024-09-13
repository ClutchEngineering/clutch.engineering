// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "clutch.engineering",
  platforms: [
    .macOS("14"),
  ],
  dependencies: [
    .package(url: "https://github.com/jverkoey/slipstream.git", branch: "main"),
  ],
  targets: [
    .executableTarget(name: "site", dependencies: [
      .product(name: "Slipstream", package: "slipstream"),
    ]),
  ]
)

