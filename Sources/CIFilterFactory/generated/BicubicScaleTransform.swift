//
//  BicubicScaleTransform.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.13, iOS 11, tvOS 11, *)
@objc public extension CIFF {
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
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFBicubicScaleTransform) class BicubicScaleTransform: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIBicubicScaleTransform")
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

		// MARK: - scale (inputScale)

		/// The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputScale`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		@objc public var scale: Double {
			get {
				let number = self.filter.value(forKey: "inputScale") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: BicubicScaleTransform.scaleRange)
				self.filter.setValue(number, forKey: "inputScale")
			}
		}

		/// `scale` range definition
		public static let scaleRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - aspectRatio (inputAspectRatio)

		/// The additional horizontal scaling factor to use on the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAspectRatio`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		@objc public var aspectRatio: Double {
			get {
				let number = self.filter.value(forKey: "inputAspectRatio") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: BicubicScaleTransform.aspectRatioRange)
				self.filter.setValue(number, forKey: "inputAspectRatio")
			}
		}

		/// `aspectRatio` range definition
		public static let aspectRatioRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - b (inputB)

		/// Specifies the value of B to use for the cubic resampling function.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputB`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var b: Double {
			get {
				let number = self.filter.value(forKey: "inputB") as? NSNumber
				return number?.doubleValue ?? 0
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: BicubicScaleTransform.bRange)
				self.filter.setValue(number, forKey: "inputB")
			}
		}

		/// `b` range definition
		public static let bRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - c (inputC)

		/// Specifies the value of C to use for the cubic resampling function.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputC`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.75`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var c: Double {
			get {
				let number = self.filter.value(forKey: "inputC") as? NSNumber
				return number?.doubleValue ?? 0.75
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: BicubicScaleTransform.cRange)
				self.filter.setValue(number, forKey: "inputC")
			}
		}

		/// `c` range definition
		public static let cRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			scale: Double = 1,
			aspectRatio: Double = 1,
			b: Double = 0,
			c: Double = 0.75
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
