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

@available(macOS 10.13, iOS 11, tvOS 11, *)
@objc public extension CIFilterFactory {
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
	@objc(CIFilterFactory_AttributedTextImageGenerator) class AttributedTextImageGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CIAttributedTextImageGenerator")
		}

		// MARK: - Inputs

		// MARK: - text (inputText)

		///
		/// No Description
		///
		///   - Attribute key: `inputText`
		///   - Internal class: `NSAttributedString`
		@objc public var text: NSAttributedString? {
			get {
				return self.keyedValue("inputText")
			}
			set {
				self.setKeyedValue(newValue, for: "inputText")
			}
		}

		// MARK: - scaleFactor (inputScaleFactor)

		///
		/// No Description
		///
		///   - Attribute key: `inputScaleFactor`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///
		public static let scaleFactor_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var scaleFactor: NSNumber? {
			get {
				return self.keyedValue("inputScaleFactor")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: AttributedTextImageGenerator.scaleFactor_Range), forKey: "inputScaleFactor")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			text: NSAttributedString,
			scaleFactor: NSNumber = 1
		) {
			self.init()

			self.text = text
			self.scaleFactor = scaleFactor
		}
	}
}
