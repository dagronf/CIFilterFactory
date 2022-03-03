//
//  TextImageGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Text Image Generator
	///
	/// Generate an image from a string and font information.
	///
	/// **Links**
	///
	/// - [CITextImageGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITextImageGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/citextimagegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CITextImageGenerator/)
	///
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFTextImageGenerator) class TextImageGenerator: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CITextImageGenerator")
		}

		// MARK: - Inputs

		// MARK: - text (inputText)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputText`
		/// - Internal class: `NSString`
		@objc public var text: String? {
			get {
				let tmp: NSString? = self.keyedValue("inputText")
				return tmp as String?
			}
			set {
				self.setKeyedValue(newValue as NSString?, for: "inputText")
			}
		}

		// MARK: - fontName (inputFontName)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFontName`
		/// - Internal class: `NSString`
		/// - Default value: `HelveticaNeue`
		@objc public var fontName: String? {
			get {
				let tmp: NSString? = self.keyedValue("inputFontName")
				return tmp as String?
			}
			set {
				self.setKeyedValue(newValue as NSString?, for: "inputFontName")
			}
		}

		// MARK: - fontSize (inputFontSize)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFontSize`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `12`
		/// - Minimum value: `0.0`
		@objc public var fontSize: Double {
			get {
				let number = self.filter.value(forKey: "inputFontSize") as? NSNumber
				return number?.doubleValue ?? 12
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: TextImageGenerator.fontSizeRange)
				self.filter.setValue(number, forKey: "inputFontSize")
			}
		}

		/// `fontSize` range definition
		public static let fontSizeRange: PartialRangeFrom<Double> = Double(0.0)...

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
				let number = NSNumber(value: newValue).clamped(bounds: TextImageGenerator.scaleFactorRange)
				self.filter.setValue(number, forKey: "inputScaleFactor")
			}
		}

		/// `scaleFactor` range definition
		public static let scaleFactorRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			text: String,
			fontName: String = "HelveticaNeue",
			fontSize: Double = 12,
			scaleFactor: Double = 1
		) {
			self.init()

			self.text = text
			self.fontName = fontName
			self.fontSize = fontSize
			self.scaleFactor = scaleFactor
		}
	}
}
