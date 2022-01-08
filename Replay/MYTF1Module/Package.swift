// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MYTF1Module",
    defaultLocalization: "fr",
    platforms: [.tvOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MYTF1Module",
            targets: ["MYTF1Module"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "SharedModule", path: "../SharedModule"),
        .package(name: "ExtendedFoundation", path: "../Extensions/ExtendedFoundation"),
        .package(name: "RPCoreUI", path: "../RPCoreUI")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MYTF1Module",
            dependencies: [
                "SharedModule",
                "ExtendedFoundation",
                "RPCoreUI"
            ]),
        .testTarget(
            name: "MYTF1ModuleTests",
            dependencies: ["MYTF1Module"]),
    ]
)
