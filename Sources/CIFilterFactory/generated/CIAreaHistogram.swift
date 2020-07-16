//
//  CIAreaHistogram.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.5, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Area Histogram
	///
	/// Calculates histograms of the R, G, B, and A channels of the specified area of an image. The output image is a one pixel tall image containing the histogram data for all four channels.
	///
	/// **Links**
	///
	/// [CIAreaHistogram Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaHistogram)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAreaHistogram/)
	///
	@objc(CIFilterFactory_CIAreaHistogram) class CIAreaHistogram: FilterCommon {
		@objc public init?() {
			super.init(name: "CIAreaHistogram")
		}

		///
		/// The image whose histogram you want to calculate.
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
		/// A rectangle that, after intersection with the image extent, specifies the subregion of the image that you want to process.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeRectangle
		///   Default:  [0 0 640 80]
		@objc public dynamic var inputExtent: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputExtent")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputExtent")
			}
		}

		///
		/// The scale value to use for the histogram values. If the scale is 1.0, then the bins in the resulting image will add up to 1.0.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///
		static let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIAreaHistogram.inputScale_Range), forKey: "inputScale")
			}
		}

		///
		/// The number of bins for the histogram. This value will determine the width of the output image.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  64
		///   minValue: 1.0
		///   maxValue: 2048.0
		///
		static let inputCount_Range: ClosedRange<Float> = 1.0 ... 2048.0
		@objc public dynamic var inputCount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIAreaHistogram.inputCount_Range), forKey: "inputCount")
			}
		}
	}
}
