// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "CIFilterFactory",
	platforms: [
		.iOS(.v9),
		//.macCatalyst(.v13),   // uncomment for swift-tools 5.5 and above
		.macOS(.v10_10),
		.tvOS(.v11),
	],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(name: "CIFilterFactory-Library", type: .static, targets: ["CIFilterFactory"]),
		.library(name: "CIFilterFactory-Shared", type: .dynamic, targets: ["CIFilterFactory"]),
	],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
		// .package(url: /* package url */, from: "1.0.0"),
	],
	targets: [
		.target(name: "CIFilterFactory"),
		.testTarget(name: "CIFilterFactoryTests", dependencies: ["CIFilterFactory"])
	]
)
