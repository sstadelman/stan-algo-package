// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StanAlgoPackage", 
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .executable(
            name: "Runner",
            targets: ["Runner", "PrimitiveStructures", "Algorithms"]),
        .library(
            name: "PrimitiveStructures",
            type: .dynamic,
            targets: ["PrimitiveStructures"]),
        .library(
            name: "Algorithms",
            type: .dynamic,
            targets: ["PrimitiveStructures", "Algorithms"]),
        .library(
            name: "Problems",
            type: .dynamic,
            targets: ["PrimitiveStructures", "Algorithms", "Problems"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Runner",
            dependencies: ["PrimitiveStructures", "Algorithms"]),
        .target(
            name: "PrimitiveStructures",
            dependencies: []),
        .target(
            name: "Algorithms",
            dependencies: ["PrimitiveStructures"]),
        .target(
            name: "Problems",
            dependencies: ["PrimitiveStructures", "Algorithms"]),
        .testTarget(
            name: "StanAlgoPackageTests",
            dependencies: ["PrimitiveStructures", "Algorithms", "Problems"]),
    ]
)
