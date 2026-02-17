// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "CIFilterFactory",
	platforms: [
		.iOS(.v12),
		.macCatalyst(.v13),
		.macOS(.v10_13),
		.tvOS(.v12),
	],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(name: "CIFilterFactory", targets: ["CIFilterFactory"]),
		.library(name: "CIFilterFactory-static", type: .static, targets: ["CIFilterFactory"]),
		.library(name: "CIFilterFactory-shared", type: .dynamic, targets: ["CIFilterFactory"]),
	],
	targets: [
		.target(
			name: "CIFilterFactory",
			resources: [
				.copy("PrivacyInfo.xcprivacy"),
			]),
		.testTarget(
			name: "CIFilterFactoryTests",
			dependencies: ["CIFilterFactory"],
			resources: [
				.process("resources"),
			])
	]
)
