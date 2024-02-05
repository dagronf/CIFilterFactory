//
//  String+extensions.swift
//  ciff_generator
//
//  Copyright © 2024 Darren Ford. All rights reserved.
//

import Foundation

extension String {
	func index(at offset: Int) -> String.Index { self.index(self.startIndex, offsetBy: offset) }
	func substring(from startIndex: String.Index, length: Int) -> String {
		return String(self[startIndex ..< self.index(startIndex, offsetBy: length)])
	}
}
