//
//  FileSquirter.swift
//  ciff_generator
//
//  Created by Darren Ford on 9/4/2022.
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
