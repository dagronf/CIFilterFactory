//
//  Crop.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 5, tvOS 5, *)
@objc public extension CIFF {
	///
	/// Crop
	///
	/// Applies a crop to an image. The size and shape of the cropped image depend on the rectangle you specify.
	///
	/// **Availability**
	/// - macOS 10.4, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryGeometryAdjustment
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Links**
	/// - [CICrop Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICrop)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicrop?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICrop/)
	///
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFCrop) class Crop: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CICrop")
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

		// MARK: - rectangle (inputRectangle)

		/// The rectangle that specifies the crop to apply to the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRectangle`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeRectangle`
		/// - Default Value: `CGRect(x: -8.988465674311579e+307, y: -8.988465674311579e+307, width: 1.7976931348623157e+308, height: 1.7976931348623157e+308)`
		@objc public var rectangle: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputRectangle", defaultValue: Self.rectangleDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputRectangle")
			}
		}

		/// `rectangle` default value
		@objc public static let rectangleDefault = CGRect(x: -8.988465674311579e+307, y: -8.988465674311579e+307, width: 1.7976931348623157e+308, height: 1.7976931348623157e+308)

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			rectangle: CGRect = Crop.rectangleDefault
		) {
			self.init()
			self.image = image
			self.rectangle = rectangle
		}
	}
}
