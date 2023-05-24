//
//  LanczosScaleTransform.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Lanczos Scale Transform
	///
	/// Produces a high-quality, scaled version of a source image. You typically use this filter to scale down an image.
	///
	/// **CIFilter Name**
	/// - CILanczosScaleTransform
	///
	/// **Availability**
	/// - macOS 10.4, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - GeometryAdjustment (*CICategoryGeometryAdjustment*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CILanczosScaleTransform Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILanczosScaleTransform)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CILanczosScaleTransform/)
	/// **Additional output keys**
	/// - outputImageNewScaleX:scaleY:
	/// - outputImageOldScaleX:scaleY:
	///
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFLanczosScaleTransform) class LanczosScaleTransform: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CILanczosScaleTransform")
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

		// MARK: - scale (inputScale)

		/// The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputScale`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.0`
		@objc public var scale: Double {
			get {
				self.doubleValue(forKey: "inputScale", defaultValue: Self.scaleDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: LanczosScaleTransform.scaleRange, forKey: "inputScale")
			}
		}

		/// `scale` default value
		@objc public static let scaleDefault: Double = 1.0

		/// `scale` range definition
		public static let scaleRange = PartialRangeFrom<Double>(0.0)

		// MARK: - aspectRatio (inputAspectRatio)

		/// The additional horizontal scaling factor to use on the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAspectRatio`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.0`
		@objc public var aspectRatio: Double {
			get {
				self.doubleValue(forKey: "inputAspectRatio", defaultValue: Self.aspectRatioDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: LanczosScaleTransform.aspectRatioRange, forKey: "inputAspectRatio")
			}
		}

		/// `aspectRatio` default value
		@objc public static let aspectRatioDefault: Double = 1.0

		/// `aspectRatio` range definition
		public static let aspectRatioRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - scale: The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image.
		///   - aspectRatio: The additional horizontal scaling factor to use on the image.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			scale: Double = LanczosScaleTransform.scaleDefault,
			aspectRatio: Double = LanczosScaleTransform.aspectRatioDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.scale = scale
			self.aspectRatio = aspectRatio
		}
	}
}

@available(macOS 10.4, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Lanczos Scale Transform' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - scale: The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image. (0.0...)
	///   - aspectRatio: The additional horizontal scaling factor to use on the image. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Produces a high-quality, scaled version of a source image. You typically use this filter to scale down an image.
	///
	/// **Categories**: BuiltIn, GeometryAdjustment, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CILanczosScaleTransform Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILanczosScaleTransform)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CILanczosScaleTransform/)
	@inlinable func applyingLanczosScaleTransform(
		scale: Double = CIFF.LanczosScaleTransform.scaleDefault,
		aspectRatio: Double = CIFF.LanczosScaleTransform.aspectRatioDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.LanczosScaleTransform(
			inputImage: self,
			scale: scale,
			aspectRatio: aspectRatio
		)?.outputImage ?? CIImage.empty()
	}
}
