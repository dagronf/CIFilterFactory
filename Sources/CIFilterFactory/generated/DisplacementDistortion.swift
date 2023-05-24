//
//  DisplacementDistortion.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Displacement Distortion
	///
	/// Applies the grayscale values of the second image to the first image. The output image has a texture defined by the grayscale values.
	///
	/// **CIFilter Name**
	/// - CIDisplacementDistortion
	///
	/// **Availability**
	/// - macOS 10.4, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - DistortionEffect (*CICategoryDistortionEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIDisplacementDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisplacementDistortion)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDisplacementDistortion/)
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFDisplacementDistortion) class DisplacementDistortion: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIDisplacementDistortion")
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

		// MARK: - displacementImage (inputDisplacementImage)

		/// An image whose grayscale values will be applied to the source image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputDisplacementImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var displacementImage: CIImage? {
			get {
				self.keyedValue("inputDisplacementImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputDisplacementImage")
			}
		}

		// MARK: - scale (inputScale)

		/// The amount of texturing of the resulting image. The larger the value, the greater the texturing.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputScale`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `50.0`
		@objc public var scale: Double {
			get {
				self.doubleValue(forKey: "inputScale", defaultValue: Self.scaleDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DisplacementDistortion.scaleRange, forKey: "inputScale")
			}
		}

		/// `scale` default value
		@objc public static let scaleDefault: Double = 50.0

		/// `scale` range definition
		public static let scaleRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - displacementImage: An image whose grayscale values will be applied to the source image.
		///   - scale: The amount of texturing of the resulting image. The larger the value, the greater the texturing.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			displacementImage: CIImage? = nil,
			scale: Double = DisplacementDistortion.scaleDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let displacementImage = displacementImage {
				self.displacementImage = displacementImage
			}
			self.scale = scale
		}
	}
}

@available(macOS 10.4, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Displacement Distortion' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - displacementImage: An image whose grayscale values will be applied to the source image.
	///   - scale: The amount of texturing of the resulting image. The larger the value, the greater the texturing. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Applies the grayscale values of the second image to the first image. The output image has a texture defined by the grayscale values.
	///
	/// **Categories**: BuiltIn, DistortionEffect, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIDisplacementDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisplacementDistortion)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDisplacementDistortion/)
	@inlinable func applyingDisplacementDistortion(
		displacementImage: CIImage,
		scale: Double = CIFF.DisplacementDistortion.scaleDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.DisplacementDistortion(
			inputImage: self,
			displacementImage: displacementImage,
			scale: scale
		)?.outputImage ?? CIImage.empty()
	}
}
