// swift-tools-version:5.5
import PackageDescription

let package = Package(
  name: "Prelude",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "Prelude",
      targets: ["Prelude"]
    ),
    .library(
      name: "Prelude_UIKit",
      targets: ["Prelude-UIKit"]
    )
  ],
  targets: [
    .target(name: "Prelude"),
    .testTarget(
      name: "PreludeTests",
      dependencies: ["Prelude"],
      path: "Tests/PreludeTests"
    ),
    .target(name: "Prelude-UIKit",
            dependencies: ["Prelude"]),
    .testTarget(
      name: "Prelude-UIKitTests",
      dependencies: ["Prelude-UIKit"],
      path: "Tests/Prelude-UIKitTests"
    )
  ]
)
