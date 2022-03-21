//
//  AttributedTextImageGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

import AVFoundation
import CoreImage
import CoreML
import Foundation

@available(macOS 10.13, iOS 11, tvOS 11, *)
@objc public extension CIFF {
	///
	/// Attributed Text Image Generator
	///
	/// Generate an image attributed string.
	///
	/// **Links**
	///
	/// - [CIAttributedTextImageGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAttributedTextImageGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciattributedtextimagegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAttributedTextImageGenerator/)
	///
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFAttributedTextImageGenerator) class AttributedTextImageGenerator: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIAttributedTextImageGenerator")
		}

		// MARK: - Inputs

		// MARK: - text (inputText)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputText`
		/// - Internal class: `NSAttributedString`
		@objc public var text: NSAttributedString? {
			get {
				return self.keyedValue("inputText")
			}
			set {
				self.setKeyedValue(newValue, for: "inputText")
			}
		}

		// MARK: - scaleFactor (inputScaleFactor)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputScaleFactor`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		@objc public var scaleFactor: Double {
			get {
				let number = self.filter.value(forKey: "inputScaleFactor") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: AttributedTextImageGenerator.scaleFactorRange)
				self.filter.setValue(number, forKey: "inputScaleFactor")
			}
		}

		/// `scaleFactor` range definition
		public static let scaleFactorRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			text: NSAttributedString,
			scaleFactor: Double = 1
		) {
			self.init()

			self.text = text
			self.scaleFactor = scaleFactor
		}
	}
}
