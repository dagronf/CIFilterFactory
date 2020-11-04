//
//  CIAttributedTextImageGenerator.swift  (AUTOMATICALLY GENERATED FILE)
//  CIFilterFactory
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
//  Automatically generated on 2020-07-09 00:57:49 +0000.  Do not edit.

import AVFoundation
import CoreImage
import CoreML
import Foundation

public extension CIFilter {
	@available(macOS 10.13, iOS 11, *)
	@inlinable @objc static func AttributedTextImageGenerator() -> CIFilterFactory.CIAttributedTextImageGenerator? {
		return CIFilterFactory.CIAttributedTextImageGenerator()
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Attributed Text Image Generator
	///
	/// Generate an image attributed string.
	///
	/// **Links**
	///
	/// [CIAttributedTextImageGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAttributedTextImageGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAttributedTextImageGenerator/)
	///
	@objc(CIFilterFactory_CIAttributedTextImageGenerator) class CIAttributedTextImageGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CIAttributedTextImageGenerator")
		}

		// MARK: - Inputs

		///
		/// No Description
		///
		///   Class:    NSAttributedString
		@objc public dynamic var inputText: NSAttributedString? {
			get {
				return self.filter.value(forKey: "inputText") as? NSAttributedString
			}
			set {
				self.filter.setValue(newValue, forKey: "inputText")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///
		static let inputScaleFactor_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputScaleFactor: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScaleFactor") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIAttributedTextImageGenerator.inputScaleFactor_Range), forKey: "inputScaleFactor")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputText: NSAttributedString,
			inputScaleFactor: NSNumber = 1
		) {
			self.init()

			self.inputText = inputText
			self.inputScaleFactor = inputScaleFactor
		}
	}
}
