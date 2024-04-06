// swift-tools-version: 5.4

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
