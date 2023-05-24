//
//  StretchCrop.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Stretch Crop
	///
	/// Distorts an image by stretching and or cropping to fit a target size.
	///
	/// **CIFilter Name**
	/// - CIStretchCrop
	///
	/// **Availability**
	/// - macOS 10.6, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - DistortionEffect (*CICategoryDistortionEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIStretchCrop Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStretchCrop)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIStretchCrop/)
	@available(macOS 10.6, iOS 9, tvOS 9, *)
	@objc(CIFFStretchCrop) class StretchCrop: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIStretchCrop")
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

		// MARK: - size (inputSize)

		/// The size in pixels of the output image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSize`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 1280.0, y: 1280.0)`
		@objc public var size: CGPoint {
			get {
				self.cgPointValue(forKey: "inputSize", defaultValue: Self.sizeDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputSize")
			}
		}

		/// `size` default value
		@objc public static let sizeDefault = CGPoint(x: 1280.0, y: 720.0)

		// MARK: - cropAmount (inputCropAmount)

		/// Determines if and how much cropping should be used to achieve the target size. If value is 0 then only stretching is used. If 1 then only cropping is used.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCropAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.25`
		@objc public var cropAmount: Double {
			get {
				self.doubleValue(forKey: "inputCropAmount", defaultValue: Self.cropAmountDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: StretchCrop.cropAmountRange, forKey: "inputCropAmount")
			}
		}

		/// `cropAmount` default value
		@objc public static let cropAmountDefault: Double = 0.25

		/// `cropAmount` range definition
		public static let cropAmountRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - centerStretchAmount (inputCenterStretchAmount)

		/// Determine how much the center of the image is stretched if stretching is used. If value is 0 then the center of the image maintains the original aspect ratio. If 1 then the image is stretched uniformly.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenterStretchAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.25`
		@objc public var centerStretchAmount: Double {
			get {
				self.doubleValue(forKey: "inputCenterStretchAmount", defaultValue: Self.centerStretchAmountDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: StretchCrop.centerStretchAmountRange, forKey: "inputCenterStretchAmount")
			}
		}

		/// `centerStretchAmount` default value
		@objc public static let centerStretchAmountDefault: Double = 0.25

		/// `centerStretchAmount` range definition
		public static let centerStretchAmountRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - size: The size in pixels of the output image.
		///   - cropAmount: Determines if and how much cropping should be used to achieve the target size. If value is 0 then only stretching is used. If 1 then only cropping is used.
		///   - centerStretchAmount: Determine how much the center of the image is stretched if stretching is used. If value is 0 then the center of the image maintains the original aspect ratio. If 1 then the image is stretched uniformly.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			size: CGPoint = StretchCrop.sizeDefault,
			cropAmount: Double = StretchCrop.cropAmountDefault,
			centerStretchAmount: Double = StretchCrop.centerStretchAmountDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.size = size
			self.cropAmount = cropAmount
			self.centerStretchAmount = centerStretchAmount
		}
	}
}

@available(macOS 10.6, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Stretch Crop' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - size: The size in pixels of the output image.
	///   - cropAmount: Determines if and how much cropping should be used to achieve the target size. If value is 0 then only stretching is used. If 1 then only cropping is used. (0.0...1.0)
	///   - centerStretchAmount: Determine how much the center of the image is stretched if stretching is used. If value is 0 then the center of the image maintains the original aspect ratio. If 1 then the image is stretched uniformly. (0.0...1.0)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Distorts an image by stretching and or cropping to fit a target size.
	///
	/// **Categories**: BuiltIn, DistortionEffect, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIStretchCrop Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStretchCrop)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIStretchCrop/)
	@inlinable func applyingStretchCrop(
		size: CGPoint = CIFF.StretchCrop.sizeDefault,
		cropAmount: Double = CIFF.StretchCrop.cropAmountDefault,
		centerStretchAmount: Double = CIFF.StretchCrop.centerStretchAmountDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.StretchCrop(
			inputImage: self,
			size: size,
			cropAmount: cropAmount,
			centerStretchAmount: centerStretchAmount
		)?.outputImage ?? CIImage.empty()
	}
}
