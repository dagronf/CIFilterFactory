//
//  generator.swift
//  ciff_generator
//
//  Copyright © 2024 Darren Ford. All rights reserved.
//

import CoreImage
import Foundation

class Main {
	static func generateAll(outURL: URL) {
		Main(outURL: outURL).generate()
	}

	let outURL: URL
	init(outURL: URL) {
		self.outURL = outURL
	}
}

extension Main {
	func generate() {
		// Get a list of all the filter names
		for filterName in CIFilter.filterNames(inCategories: nil) {
			if let filter = CIFilter(name: filterName) {
				self.generateFilter(filter)
			}
		}

		// Some additional private apple filters
//		for filterName in CIFilter.filterNames(inCategory: "CICategoryApplePrivate") {
//			if let filter = CIFilter(name: filterName) {
//				self.generateFilter(filter)
//			}
//		}
	}

	// Generate the class definition for a specific filter
	func generateFilter(_ filter: CIFilter) {
		do {
			let filterGenerator = FilterGenerator(filter: filter)
			filterGenerator.generate()
			if filterGenerator.out.content.count > 0 {
				let outURL = outURL.appendingPathComponent("\(filterGenerator.staticName).swift")
				try filterGenerator.out.content.write(to: outURL, atomically: true, encoding: .utf8)
			}
		}
		catch {
			Swift.print("Cannot write file \(error)")
		}
	}
}
