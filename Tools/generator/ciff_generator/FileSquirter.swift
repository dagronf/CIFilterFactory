//
//  FileSquirter.swift
//  ciff_generator
//
//  Copyright © 2024 Darren Ford. All rights reserved.
//

import Foundation

class FileSquirter {
	let name: String
	var content: String = ""
	init(name: String) {
		self.name = name
	}

	func print(_ text: String) {
		content += text + "\n"
	}
	func blankLine() {
		content += "\n"
	}
}
