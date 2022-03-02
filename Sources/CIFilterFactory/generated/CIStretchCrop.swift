//
//  CIStretchCrop.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.6, iOS 9, tvOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Stretch Crop
	///
	/// Distorts an image by stretching and or cropping to fit a target size.
	///
	/// **Links**
	///
	/// - [CIStretchCrop Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStretchCrop)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cistretchcrop?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIStretchCrop/)
	///
	@objc(CIFilterFactory_StretchCrop) class StretchCrop: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIStretchCrop")
		}

		// MARK: - Inputs

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

		// MARK: - size (inputSize)

		/// The size in pixels of the output image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSize`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[1280 720]`
		@objc public var size: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputSize", defaultValue: Self.sizeDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputSize")
			}
		}

		/// size default value
		@objc public static let sizeDefault = CGPoint(x: 1280.0, y: 720.0)

		// MARK: - cropAmount (inputCropAmount)

		/// Determines if and how much cropping should be used to achieve the target size. If value is 0 then only stretching is used. If 1 then only cropping is used.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCropAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.25`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var cropAmount: NSNumber? {
			get {
				return self.keyedValue("inputCropAmount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StretchCrop.cropAmountRange), forKey: "inputCropAmount")
			}
		}

		/// `cropAmount` range definition
		public static let cropAmountRange: ClosedRange<Float> = 0.0 ... 1.0

		// MARK: - centerStretchAmount (inputCenterStretchAmount)

		/// Determine how much the center of the image is stretched if stretching is used. If value is 0 then the center of the image maintains the original aspect ratio. If 1 then the image is stretched uniformly.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenterStretchAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.25`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var centerStretchAmount: NSNumber? {
			get {
				return self.keyedValue("inputCenterStretchAmount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StretchCrop.centerStretchAmountRange), forKey: "inputCenterStretchAmount")
			}
		}

		/// `centerStretchAmount` range definition
		public static let centerStretchAmountRange: ClosedRange<Float> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			size: CGPoint = StretchCrop.sizeDefault,
			cropAmount: NSNumber = 0.25,
			centerStretchAmount: NSNumber = 0.25
		) {
			self.init()

			self.image = image
			self.size = size
			self.cropAmount = cropAmount
			self.centerStretchAmount = centerStretchAmount
		}
	}
}
