//
//  BokehBlur.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Bokeh Blur
	///
	/// Smooths an image using a disc-shaped convolution kernel.
	///
	/// **CIFilter Name**
	/// - CIBokehBlur
	///
	/// **Availability**
	/// - macOS 10.13, iOS 11, tvOS 11
	///
	/// **Categories**
	/// - Blur (*CICategoryBlur*)
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIBokehBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBokehBlur)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBokehBlur/)
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFBokehBlur) class BokehBlur: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIBokehBlur")
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

		// MARK: - radius (inputRadius)

		/// The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `500.0`
		/// - Default Value: `20.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: BokehBlur.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 20.0

		/// `radius` range definition
		public static let radiusRange: ClosedRange<Double> = 0.0 ... 500.0

		// MARK: - ringAmount (inputRingAmount)

		/// The amount of extra emphasis at the ring of the bokeh.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRingAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.0`
		@objc public var ringAmount: Double {
			get {
				self.doubleValue(forKey: "inputRingAmount", defaultValue: Self.ringAmountDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: BokehBlur.ringAmountRange, forKey: "inputRingAmount")
			}
		}

		/// `ringAmount` default value
		@objc public static let ringAmountDefault: Double = 0.0

		/// `ringAmount` range definition
		public static let ringAmountRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - ringSize (inputRingSize)

		/// The size of extra emphasis at the ring of the bokeh.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRingSize`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `0.2`
		/// - Default Value: `0.1`
		@objc public var ringSize: Double {
			get {
				self.doubleValue(forKey: "inputRingSize", defaultValue: Self.ringSizeDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: BokehBlur.ringSizeRange, forKey: "inputRingSize")
			}
		}

		/// `ringSize` default value
		@objc public static let ringSizeDefault: Double = 0.1

		/// `ringSize` range definition
		public static let ringSizeRange: ClosedRange<Double> = 0.0 ... 0.2

		// MARK: - softness (inputSoftness)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSoftness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `10.0`
		/// - Default Value: `1.0`
		@objc public var softness: Double {
			get {
				self.doubleValue(forKey: "inputSoftness", defaultValue: Self.softnessDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: BokehBlur.softnessRange, forKey: "inputSoftness")
			}
		}

		/// `softness` default value
		@objc public static let softnessDefault: Double = 1.0

		/// `softness` range definition
		public static let softnessRange: ClosedRange<Double> = 0.0 ... 10.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - radius: The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
		///   - ringAmount: The amount of extra emphasis at the ring of the bokeh.
		///   - ringSize: The size of extra emphasis at the ring of the bokeh.
		///   - softness: No Description
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			radius: Double = BokehBlur.radiusDefault,
			ringAmount: Double = BokehBlur.ringAmountDefault,
			ringSize: Double = BokehBlur.ringSizeDefault,
			softness: Double = BokehBlur.softnessDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.radius = radius
			self.ringAmount = ringAmount
			self.ringSize = ringSize
			self.softness = softness
		}
	}
}

@available(macOS 10.13, iOS 11, tvOS 11, *)
public extension CIImage {
	/// Apply the 'Bokeh Blur' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - radius: The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result. (0.0...500.0)
	///   - ringAmount: The amount of extra emphasis at the ring of the bokeh. (0.0...1.0)
	///   - ringSize: The size of extra emphasis at the ring of the bokeh. (0.0...0.2)
	///   - softness: No Description (0.0...10.0)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Smooths an image using a disc-shaped convolution kernel.
	///
	/// **Categories**: Blur, BuiltIn, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIBokehBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBokehBlur)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBokehBlur/)
	@inlinable func applyingBokehBlur(
		radius: Double = CIFF.BokehBlur.radiusDefault,
		ringAmount: Double = CIFF.BokehBlur.ringAmountDefault,
		ringSize: Double = CIFF.BokehBlur.ringSizeDefault,
		softness: Double = CIFF.BokehBlur.softnessDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.BokehBlur(
			inputImage: self,
			radius: radius,
			ringAmount: ringAmount,
			ringSize: ringSize,
			softness: softness
		)?.outputImage ?? CIImage.empty()
	}
}
