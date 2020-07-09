//
//  CINoiseReduction.swift  (AUTOMATICALLY GENERATED FILE)
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
	import UIKit // For access to NSValue.cgAffineTransformValue
#endif

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Noise Reduction
	///
	/// Reduces noise using a threshold value to define what is considered noise. Small changes in luminance below that value are considered noise and get a noise reduction treatment, which is a local blur. Changes above the threshold value are considered edges, so they are sharpened.
	///
	/// **Links**
	///
	/// [CINoiseReduction Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINoiseReduction)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CINoiseReduction/)
	///
	@objc(CIFilterFactory_CINoiseReduction) class CINoiseReduction: Core {
		@objc public init?() {
			super.init(name: "CINoiseReduction")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputNoiseLevel

		///
		/// The amount of noise reduction. The larger the value, the more noise reduction.
		///
		///   minValue: 0.0
		///
		let inputNoiseLevel_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputNoiseLevel: NSNumber? {
			get {
				return filter.value(forKey: "inputNoiseLevel") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputNoiseLevel_Range), forKey: "inputNoiseLevel")
			}
		}

		// MARK: - inputSharpness

		///
		/// The sharpness of the final image. The larger the value, the sharper the result.
		///
		///   minValue: 0.0
		///
		let inputSharpness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSharpness: NSNumber? {
			get {
				return filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}
