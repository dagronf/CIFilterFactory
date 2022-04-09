//
//  MorphologyRectangleMinimum.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.15, iOS 13, tvOS 13, *)
@objc public extension CIFF {
	///
	/// Morphology Rectangle Minimum
	///
	/// Darkens areas of an image by applying a rectangular morphological maximum operation to the image.
	///
	/// **Categories**
	/// - CICategoryBlur
	/// - CICategoryBuiltIn
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Links**
	/// - [CIMorphologyRectangleMinimum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyRectangleMinimum)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cimorphologyrectangleminimum?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIMorphologyRectangleMinimum/)
	///
	@available(macOS 10.15, iOS 13, tvOS 13, *)
	@objc(CIFFMorphologyRectangleMinimum) class MorphologyRectangleMinimum: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIMorphologyRectangleMinimum")
		}

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - width (inputWidth)

		/// The width in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `1`
		/// - Default Value: `5`
		@objc public var width: Int {
			get {
				let number = self.filter.value(forKey: "inputWidth") as? NSNumber
				return number?.intValue ?? Self.widthDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: MorphologyRectangleMinimum.widthRange)
				self.filter.setValue(number, forKey: "inputWidth")
			}
		}

		/// `width` default value
		@objc public static let widthDefault: Int = 5

		/// `width` range definition
		public static let widthRange = PartialRangeFrom<Int>(1)

		// MARK: - height (inputHeight)

		/// The height in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputHeight`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `1`
		/// - Default Value: `5`
		@objc public var height: Int {
			get {
				let number = self.filter.value(forKey: "inputHeight") as? NSNumber
				return number?.intValue ?? Self.heightDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: MorphologyRectangleMinimum.heightRange)
				self.filter.setValue(number, forKey: "inputHeight")
			}
		}

		/// `height` default value
		@objc public static let heightDefault: Int = 5

		/// `height` range definition
		public static let heightRange = PartialRangeFrom<Int>(1)

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			width: Int = MorphologyRectangleMinimum.widthDefault,
			height: Int = MorphologyRectangleMinimum.heightDefault
		) {
			self.init()
			self.image = image
			self.width = width
			self.height = height
		}
	}
}
