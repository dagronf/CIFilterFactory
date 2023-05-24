//
//  TextImageGenerator.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2023 Darren Ford. All rights reserved.
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

@objc public extension CIFF {
	/// Text Image Generator
	///
	/// Generate an image from a string and font information.
	///
	/// **CIFilter Name**
	/// - CITextImageGenerator
	///
	/// **Availability**
	/// - macOS 10.13, iOS 11, tvOS 11
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Generator (*CICategoryGenerator*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CITextImageGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITextImageGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CITextImageGenerator/)
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFTextImageGenerator) class TextImageGenerator: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CITextImageGenerator")
		}

		// MARK: - text (inputText)

		/// The text to render.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputText`
		/// - Internal class: `NSString`
		@objc public var text: String? {
			get {
				self.stringValue(forKey: "inputText")
			}
			set {
				self.setKeyedValue(newValue as? NSString, for: "inputText")
			}
		}

		// MARK: - fontName (inputFontName)

		/// The name of the font to use for the generated text.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFontName`
		/// - Internal class: `NSString`
		@objc public var fontName: String? {
			get {
				self.stringValue(forKey: "inputFontName")
			}
			set {
				self.setKeyedValue(newValue as? NSString, for: "inputFontName")
			}
		}

		// MARK: - fontSize (inputFontSize)

		/// The size of the font to use for the generated text.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFontSize`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `12.0`
		@objc public var fontSize: Double {
			get {
				self.doubleValue(forKey: "inputFontSize", defaultValue: Self.fontSizeDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: TextImageGenerator.fontSizeRange, forKey: "inputFontSize")
			}
		}

		/// `fontSize` default value
		@objc public static let fontSizeDefault: Double = 12.0

		/// `fontSize` range definition
		public static let fontSizeRange = PartialRangeFrom<Double>(0.0)

		// MARK: - scaleFactor (inputScaleFactor)

		/// The scale of the font to use for the generated text.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputScaleFactor`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.0`
		@objc public var scaleFactor: Double {
			get {
				self.doubleValue(forKey: "inputScaleFactor", defaultValue: Self.scaleFactorDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: TextImageGenerator.scaleFactorRange, forKey: "inputScaleFactor")
			}
		}

		/// `scaleFactor` default value
		@objc public static let scaleFactorDefault: Double = 1.0

		/// `scaleFactor` range definition
		public static let scaleFactorRange = PartialRangeFrom<Double>(0.0)

		// MARK: - padding (inputPadding)

		/// The number of additional pixels to pad around the text’s bounding box.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPadding`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `0`
		/// - Maximum Value: `200`
		/// - Default Value: `0`
		@objc public var padding: Int {
			get {
				self.intValue(forKey: "inputPadding", defaultValue: Self.paddingDefault)
			}
			set {
				self.setIntValue(newValue, bounds: TextImageGenerator.paddingRange, forKey: "inputPadding")
			}
		}

		/// `padding` default value
		@objc public static let paddingDefault: Int = 0

		/// `padding` range definition
		public static let paddingRange: ClosedRange<Int> = 0 ... 200

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - text: The text to render.
		///   - fontName: The name of the font to use for the generated text.
		///   - fontSize: The size of the font to use for the generated text.
		///   - scaleFactor: The scale of the font to use for the generated text.
		///   - padding: The number of additional pixels to pad around the text’s bounding box.
		@objc public convenience init?(
			text: String,
			fontName: String,
			fontSize: Double = TextImageGenerator.fontSizeDefault,
			scaleFactor: Double = TextImageGenerator.scaleFactorDefault,
			padding: Int = TextImageGenerator.paddingDefault
		) {
			self.init()
			self.text = text
			self.fontName = fontName
			self.fontSize = fontSize
			self.scaleFactor = scaleFactor
			self.padding = padding
		}
	}
}

@available(macOS 10.13, iOS 11, tvOS 11, *)
public extension CIImage {
	/// Create a new CIImage using the 'Text Image Generator' filter
	///
	/// - Parameters:
	///   - text: The text to render.
	///   - fontName: The name of the font to use for the generated text.
	///   - fontSize: The size of the font to use for the generated text. (0.0...)
	///   - scaleFactor: The scale of the font to use for the generated text. (0.0...)
	///   - padding: The number of additional pixels to pad around the text’s bounding box. (0...200)
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generate an image from a string and font information.
	///
	/// **Categories**: BuiltIn, Generator, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CITextImageGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITextImageGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CITextImageGenerator/)
	@inlinable static func createUsingTextImageGenerator(
		text: String,
		fontName: String,
		fontSize: Double = CIFF.TextImageGenerator.fontSizeDefault,
		scaleFactor: Double = CIFF.TextImageGenerator.scaleFactorDefault,
		padding: Int = CIFF.TextImageGenerator.paddingDefault
	) -> CIImage? {
		return CIFF.TextImageGenerator(
			text: text,
			fontName: fontName,
			fontSize: fontSize,
			scaleFactor: scaleFactor,
			padding: padding
		)?.outputImage
	}
}
