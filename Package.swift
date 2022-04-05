// swift-tools-version: 5.3
import PackageDescription

let package = Package(
  name: "Prelude",
  products: [
    .library(
      name: "Prelude",
      targets: ["Prelude"]
    ),
    .library(
      name: "Prelude_UIKit",
      targets: ["Prelude_UIKit"]
    )
  ]
  targets: [
    .target(name: "Prelude"),
    .testTarget(
      name: "PreludeTests",
      dependencies: ["Prelude"]
    ),
    .target(name: "Prelude-UIKit"),
    .testTarget(
      name: "Prelude-UIKitTests",
      dependencies: ["Prelude-UIKit"]
    )
  ])
