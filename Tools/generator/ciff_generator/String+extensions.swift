//
//  String+extensions.swift
//  ciff_generator
//
//  Created by Darren Ford on 9/4/2022.
//

import Foundation

extension String {
	func index(at offset: Int) -> String.Index { self.index(self.startIndex, offsetBy: offset) }
	func substring(from startIndex: String.Index, length: Int) -> String {
		return String(self[startIndex ..< self.index(startIndex, offsetBy: length)])
	}
}
