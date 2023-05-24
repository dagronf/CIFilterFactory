//
//  MorphologyRectangleMinimum.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Morphology Rectangle Minimum
	///
	/// Darkens areas of an image by applying a rectangular morphological maximum operation to the image.
	///
	/// **CIFilter Name**
	/// - CIMorphologyRectangleMinimum
	///
	/// **Availability**
	/// - macOS 10.15, iOS 13, tvOS 13
	///
	/// **Categories**
	/// - Blur (*CICategoryBlur*)
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIMorphologyRectangleMinimum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyRectangleMinimum)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIMorphologyRectangleMinimum/)
	@available(macOS 10.15, iOS 13, tvOS 13, *)
	@objc(CIFFMorphologyRectangleMinimum) class MorphologyRectangleMinimum: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIMorphologyRectangleMinimum")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input for the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
			get {
				self.keyedValue("inputImage")
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
				self.intValue(forKey: "inputWidth", defaultValue: Self.widthDefault)
			}
			set {
				self.setIntValue(newValue, bounds: MorphologyRectangleMinimum.widthRange, forKey: "inputWidth")
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
				self.intValue(forKey: "inputHeight", defaultValue: Self.heightDefault)
			}
			set {
				self.setIntValue(newValue, bounds: MorphologyRectangleMinimum.heightRange, forKey: "inputHeight")
			}
		}

		/// `height` default value
		@objc public static let heightDefault: Int = 5

		/// `height` range definition
		public static let heightRange = PartialRangeFrom<Int>(1)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - width: The width in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///   - height: The height in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			width: Int = MorphologyRectangleMinimum.widthDefault,
			height: Int = MorphologyRectangleMinimum.heightDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.width = width
			self.height = height
		}
	}
}

@available(macOS 10.15, iOS 13, tvOS 13, *)
public extension CIImage {
	/// Apply the 'Morphology Rectangle Minimum' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - width: The width in pixels of the morphological operation. The value will be rounded to the nearest odd integer. (1...)
	///   - height: The height in pixels of the morphological operation. The value will be rounded to the nearest odd integer. (1...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Darkens areas of an image by applying a rectangular morphological maximum operation to the image.
	///
	/// **Categories**: Blur, BuiltIn, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIMorphologyRectangleMinimum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyRectangleMinimum)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIMorphologyRectangleMinimum/)
	@inlinable func applyingMorphologyRectangleMinimum(
		width: Int = CIFF.MorphologyRectangleMinimum.widthDefault,
		height: Int = CIFF.MorphologyRectangleMinimum.heightDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.MorphologyRectangleMinimum(
			inputImage: self,
			width: width,
			height: height
		)?.outputImage ?? CIImage.empty()
	}
}
