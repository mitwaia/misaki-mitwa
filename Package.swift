// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "misaki-mitwa",
  platforms: [
    .iOS(.v18), .macOS(.v15)
  ],
  products: [
    .library(
      name: "MisakiMitwa",
      type: .dynamic,
      targets: ["MisakiMitwa"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/ml-explore/mlx-swift", exact: "0.31.3"),
    .package(url: "https://github.com/mitwaia/Utils-Mitwa", exact: "0.0.6")
  ],
  targets: [
    .target(
      name: "MisakiMitwa",
      dependencies: [
        .product(name: "MLX", package: "mlx-swift"),
        .product(name: "MLXNN", package: "mlx-swift"),
        .product(name: "MLXUtilsMitwa", package: "Utils-Mitwa")
     ],
     resources: [
      .copy("../../Resources/")
     ]
    ),
    .testTarget(
      name: "MisakiMitwaTests",
      dependencies: ["MisakiMitwa"]
    ),
  ]
)
