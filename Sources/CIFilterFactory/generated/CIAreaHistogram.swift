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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

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
	@objc(CIFilterFactory_CIAreaHistogram) class CIAreaHistogram: Core {
		@objc public init?() {
			super.init(name: "CIAreaHistogram")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image whose histogram you want to calculate.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputExtent

		///
		/// A rectangle that, after intersection with the image extent, specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputExtent")
			}
		}

		// MARK: - inputScale

		///
		/// The scale value to use for the histogram values. If the scale is 1.0, then the bins in the resulting image will add up to 1.0.
		///
		///   minValue: 0.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}

		// MARK: - inputCount

		///
		/// The number of bins for the histogram. This value will determine the width of the output image.
		///
		///   minValue: 1.0
		///   maxValue: 2048.0
		///
		let inputCount_Range: ClosedRange<Float> = 1.0 ... 2048.0
		@objc public var inputCount: NSNumber? {
			get {
				return filter.value(forKey: "inputCount") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCount_Range), forKey: "inputCount")
			}
		}
	}
}
