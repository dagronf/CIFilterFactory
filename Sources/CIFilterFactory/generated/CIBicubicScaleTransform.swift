//
//  CIBicubicScaleTransform.swift  (AUTOMATICALLY GENERATED FILE)
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
//  Automatically generated on 2020-07-09 00:57:49 +0000.  Do not edit.

import AVFoundation
import CoreImage
import CoreML
import Foundation

@available(macOS 10.13, iOS 11, tvOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Bicubic Scale Transform
	///
	/// Produces a high-quality, scaled version of a source image. The parameters of B and C for this filter determine the sharpness or softness of the resampling. The most commonly used B and C values are 0.0 and 0.75, respectively.
	///
	/// **Links**
	///
	/// - [CIBicubicScaleTransform Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBicubicScaleTransform)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cibicubicscaletransform?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBicubicScaleTransform/)
	///
	@objc(CIFilterFactory_BicubicScaleTransform) class BicubicScaleTransform: FilterCore {
		@objc public init?() {
			super.init(name: "CIBicubicScaleTransform")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   - Attribute key: `inputImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - scale (inputScale)

		///
		/// The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image.
		///
		///   - Attribute key: `inputScale`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///
		public static let scale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var scale: NSNumber? {
			get {
				return self.keyedValue("inputScale")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: BicubicScaleTransform.scale_Range), forKey: "inputScale")
			}
		}

		// MARK: - aspectRatio (inputAspectRatio)

		///
		/// The additional horizontal scaling factor to use on the image.
		///
		///   - Attribute key: `inputAspectRatio`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///
		public static let aspectRatio_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var aspectRatio: NSNumber? {
			get {
				return self.keyedValue("inputAspectRatio")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: BicubicScaleTransform.aspectRatio_Range), forKey: "inputAspectRatio")
			}
		}

		// MARK: - b (inputB)

		///
		/// Specifies the value of B to use for the cubic resampling function.
		///
		///   - Attribute key: `inputB`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let b_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var b: NSNumber? {
			get {
				return self.keyedValue("inputB")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: BicubicScaleTransform.b_Range), forKey: "inputB")
			}
		}

		// MARK: - c (inputC)

		///
		/// Specifies the value of C to use for the cubic resampling function.
		///
		///   - Attribute key: `inputC`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.75`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let c_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var c: NSNumber? {
			get {
				return self.keyedValue("inputC")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: BicubicScaleTransform.c_Range), forKey: "inputC")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			scale: NSNumber = 1,
			aspectRatio: NSNumber = 1,
			b: NSNumber = 0,
			c: NSNumber = 0.75
		) {
			self.init()

			self.image = image
			self.scale = scale
			self.aspectRatio = aspectRatio
			self.b = b
			self.c = c
		}
	}
}
