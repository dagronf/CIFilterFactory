//
//  AttributedTextImageGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Attributed Text Image Generator
	///
	/// Generate an image attributed string.
	///
	/// **CIFilter Name**
	/// - CIAttributedTextImageGenerator
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
	/// - [CIAttributedTextImageGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAttributedTextImageGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAttributedTextImageGenerator/)
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFAttributedTextImageGenerator) class AttributedTextImageGenerator: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIAttributedTextImageGenerator")
		}

		// MARK: - text (inputText)

		/// The attributed text to render.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputText`
		/// - Internal class: `NSAttributedString`
		@objc public var text: NSAttributedString? {
			get {
				self.keyedValue("inputText")
			}
			set {
				self.setKeyedValue(newValue, for: "inputText")
			}
		}

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
				self.setDoubleValue(newValue, bounds: AttributedTextImageGenerator.scaleFactorRange, forKey: "inputScaleFactor")
			}
		}

		/// `scaleFactor` default value
		@objc public static let scaleFactorDefault: Double = 1.0

		/// `scaleFactor` range definition
		public static let scaleFactorRange = PartialRangeFrom<Double>(0.0)

		// MARK: - padding (inputPadding)

		/// A value for an additional number of pixels to pad around the text’s bounding box.
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
				self.setIntValue(newValue, bounds: AttributedTextImageGenerator.paddingRange, forKey: "inputPadding")
			}
		}

		/// `padding` default value
		@objc public static let paddingDefault: Int = 0

		/// `padding` range definition
		public static let paddingRange: ClosedRange<Int> = 0 ... 200

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - text: The attributed text to render.
		///   - scaleFactor: The scale of the font to use for the generated text.
		///   - padding: A value for an additional number of pixels to pad around the text’s bounding box.
		@objc public convenience init?(
			text: NSAttributedString,
			scaleFactor: Double = AttributedTextImageGenerator.scaleFactorDefault,
			padding: Int = AttributedTextImageGenerator.paddingDefault
		) {
			self.init()
			self.text = text
			self.scaleFactor = scaleFactor
			self.padding = padding
		}
	}
}

@available(macOS 10.13, iOS 11, tvOS 11, *)
public extension CIImage {
	/// Create a new CIImage using the 'Attributed Text Image Generator' filter
	///
	/// - Parameters:
	///   - text: The attributed text to render.
	///   - scaleFactor: The scale of the font to use for the generated text. (0.0...)
	///   - padding: A value for an additional number of pixels to pad around the text’s bounding box. (0...200)
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generate an image attributed string.
	///
	/// **Categories**: BuiltIn, Generator, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIAttributedTextImageGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAttributedTextImageGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAttributedTextImageGenerator/)
	@inlinable static func createUsingAttributedTextImageGenerator(
		text: NSAttributedString,
		scaleFactor: Double = CIFF.AttributedTextImageGenerator.scaleFactorDefault,
		padding: Int = CIFF.AttributedTextImageGenerator.paddingDefault
	) -> CIImage? {
		return CIFF.AttributedTextImageGenerator(
			text: text,
			scaleFactor: scaleFactor,
			padding: padding
		)?.outputImage
	}
}
