//
//  BokehBlur.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Bokeh Blur
	///
	/// Smooths an image using a disc-shaped convolution kernel.
	///
	/// **Links**
	///
	/// - [CIBokehBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBokehBlur)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cibokehblur?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBokehBlur/)
	///
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFBokehBlur) class BokehBlur: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIBokehBlur")
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
				let number = self.filter.value(forKey: "inputRadius") as? NSNumber
				return number?.doubleValue ?? Self.radiusDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: BokehBlur.radiusRange)
				self.filter.setValue(number, forKey: "inputRadius")
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
				let number = self.filter.value(forKey: "inputRingAmount") as? NSNumber
				return number?.doubleValue ?? Self.ringAmountDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: BokehBlur.ringAmountRange)
				self.filter.setValue(number, forKey: "inputRingAmount")
			}
		}

		/// `ringAmount` default value
		@objc public static let ringAmountDefault: Double = 0.0

		/// `ringAmount` range definition
		public static let ringAmountRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - ringSize (inputRingSize)

		/// The size of extra emphasis at the ring of the bokeh
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
				let number = self.filter.value(forKey: "inputRingSize") as? NSNumber
				return number?.doubleValue ?? Self.ringSizeDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: BokehBlur.ringSizeRange)
				self.filter.setValue(number, forKey: "inputRingSize")
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
				let number = self.filter.value(forKey: "inputSoftness") as? NSNumber
				return number?.doubleValue ?? Self.softnessDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: BokehBlur.softnessRange)
				self.filter.setValue(number, forKey: "inputSoftness")
			}
		}

		/// `softness` default value
		@objc public static let softnessDefault: Double = 1.0

		/// `softness` range definition
		public static let softnessRange: ClosedRange<Double> = 0.0 ... 10.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			radius: Double = BokehBlur.radiusDefault,
			ringAmount: Double = BokehBlur.ringAmountDefault,
			ringSize: Double = BokehBlur.ringSizeDefault,
			softness: Double = BokehBlur.softnessDefault
		) {
			self.init()
			self.image = image
			self.radius = radius
			self.ringAmount = ringAmount
			self.ringSize = ringSize
			self.softness = softness
		}
	}
}
