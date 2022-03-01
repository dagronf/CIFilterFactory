//
//  CIBokehBlur.swift  (AUTOMATICALLY GENERATED FILE)
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
	@objc(CIFilterFactory_BokehBlur) class BokehBlur: FilterCore {
		@objc public init?() {
			super.init(name: "CIBokehBlur")
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

		// MARK: - radius (inputRadius)

		///
		/// The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `20`
		///   minValue: 0.0
		///   maxValue: 500.0
		///
		public static let radius_Range: ClosedRange<Float> = 0.0 ... 500.0
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: BokehBlur.radius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - ringAmount (inputRingAmount)

		///
		/// The amount of extra emphasis at the ring of the bokeh.
		///
		///   - Attribute key: `inputRingAmount`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let ringAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var ringAmount: NSNumber? {
			get {
				return self.keyedValue("inputRingAmount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: BokehBlur.ringAmount_Range), forKey: "inputRingAmount")
			}
		}

		// MARK: - ringSize (inputRingSize)

		///
		/// The size of extra emphasis at the ring of the bokeh
		///
		///   - Attribute key: `inputRingSize`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.1`
		///   minValue: 0.0
		///
		public static let ringSize_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var ringSize: NSNumber? {
			get {
				return self.keyedValue("inputRingSize")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: BokehBlur.ringSize_Range), forKey: "inputRingSize")
			}
		}

		// MARK: - softness (inputSoftness)

		///
		/// No Description
		///
		///   - Attribute key: `inputSoftness`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///   maxValue: 10.0
		///
		public static let softness_Range: ClosedRange<Float> = 0.0 ... 10.0
		@objc public var softness: NSNumber? {
			get {
				return self.keyedValue("inputSoftness")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: BokehBlur.softness_Range), forKey: "inputSoftness")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			radius: NSNumber = 20,
			ringAmount: NSNumber = 0,
			ringSize: NSNumber = 0.1,
			softness: NSNumber = 1
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
