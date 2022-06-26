//
//  QRCodeGenerator+extensions.swift
//
//  Created by Darren Ford on 16/7/20.
//
//  MIT license
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial
//  portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//  WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
//  OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//  OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import Foundation
import CoreImage

/// Extension to the QR code filter to have type-safe correction levels
@available(macOS 10.10, iOS 8, tvOS 8, *)
public extension CIFF.QRCodeGenerator {
	/// QR Code correction levels
	enum Level: String, CaseIterable {
		/// Low level correction (up to 7% error correction capability)
		case L
		/// Medium level correction (up to 15%  error correction capability)
		case M
		/// Quantize level correction (up to 25%  error correction capability)
		case Q
		/// High level correction (up to 30%  error correction capability)
		case H
		/// The default correction level
		public static var `default`: Level { .M }
	}

	/// The QR Code correction level.
	///
	/// A convenience property for the `correctionLevel` property providing type safety for the correction level types.
	@inlinable var correction: Level {
		get {
			guard let v = self.correctionLevel, let level = Level(rawValue: v) else {
				return .default
			}
			return level
		}
		set { self.correctionLevel = newValue.rawValue }
	}

	/// Create a QRCode with a specific utf8 text. Returns nil if the text cannot be converted to utf8
	/// - Parameters:
	///   - text: The UTF8 encodable message
	///   - correction: The correction level (default .high)
	@inlinable convenience init?(text: String, correction: Level = .H) {
		guard let data = text.data(using: .utf8) else { return nil }
		self.init(message: data, correctionLevel: correction.rawValue)
	}
}
