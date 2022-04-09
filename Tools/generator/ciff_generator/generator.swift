//
//  generator.swift
//  ciff_generator
//
//  Created by Darren Ford on 9/4/2022.
//

import Foundation
import CoreImage

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
	}

//	func generate(filter: CIFilter) {
//		do {
//			let staticName: String = {
//				var nn = filter.name.replacingOccurrences(of: " ", with: "")
//				if nn.starts(with: "CI") {
//					let i1 = nn.index(nn.startIndex, offsetBy: 2)
//					nn = String(nn[ (i1 ..< nn.endIndex) ])
//				}
//				return nn
//			}()
//
//			let fs = FileSquirter(name: "\(staticName).swift")
//
//			self.generateFilter(filter: filter, staticName: staticName, out: fs)
//
//			//parseFilter(filter: filter, staticName: staticName, out: fs)
//			let outURL = outURL.appendingPathComponent("\(staticName).swift")
//			try fs.content.write(to: outURL, atomically: true, encoding: .utf8)
//
//		}
//		catch {
//			Swift.print("Cannot write file \(error)")
//		}
//
//	}
}
