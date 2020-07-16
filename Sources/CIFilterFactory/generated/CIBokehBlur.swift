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

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Bokeh Blur
	///
	/// Smooths an image using a disc-shaped convolution kernel.
	///
	/// **Links**
	///
	/// [CIBokehBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBokehBlur)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBokehBlur/)
	///
	@objc(CIFilterFactory_CIBokehBlur) class CIBokehBlur: FilterCore {
		@objc public init?() {
			super.init(name: "CIBokehBlur")
		}

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  20
		///   minValue: 0.0
		///   maxValue: 500.0
		///
		static let inputRadius_Range: ClosedRange<Float> = 0.0 ... 500.0
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIBokehBlur.inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The amount of extra emphasis at the ring of the bokeh.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputRingAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputRingAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRingAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIBokehBlur.inputRingAmount_Range), forKey: "inputRingAmount")
			}
		}

		///
		/// The size of extra emphasis at the ring of the bokeh
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.1
		///   minValue: 0.0
		///
		static let inputRingSize_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputRingSize: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRingSize") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIBokehBlur.inputRingSize_Range), forKey: "inputRingSize")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///   maxValue: 10.0
		///
		static let inputSoftness_Range: ClosedRange<Float> = 0.0 ... 10.0
		@objc public dynamic var inputSoftness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSoftness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIBokehBlur.inputSoftness_Range), forKey: "inputSoftness")
			}
		}
	}
}
