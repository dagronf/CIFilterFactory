//
//  CIHistogramDisplayFilter.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Histogram Display
	///
	/// Generates a displayable histogram image from the output of the “Area Histogram” filter.
	///
	/// **Links**
	///
	/// [CIHistogramDisplayFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHistogramDisplayFilter)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHistogramDisplayFilter/)
	///
	@objc(CIFilterFactory_CIHistogramDisplayFilter) class CIHistogramDisplayFilter: FilterCommon {
		@objc public init?() {
			super.init(name: "CIHistogramDisplayFilter")
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
		/// The height of the displayable histogram image.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  100
		///   minValue: 1.0
		///   maxValue: 200.0
		///
		static let inputHeight_Range: ClosedRange<Float> = 1.0 ... 200.0
		@objc public dynamic var inputHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIHistogramDisplayFilter.inputHeight_Range), forKey: "inputHeight")
			}
		}

		///
		/// The fraction of the right portion of the histogram image to make lighter.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputHighLimit_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputHighLimit: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHighLimit") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIHistogramDisplayFilter.inputHighLimit_Range), forKey: "inputHighLimit")
			}
		}

		///
		/// The fraction of the left portion of the histogram image to make darker
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputLowLimit_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputLowLimit: NSNumber? {
			get {
				return self.filter.value(forKey: "inputLowLimit") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIHistogramDisplayFilter.inputLowLimit_Range), forKey: "inputLowLimit")
			}
		}
	}
}
