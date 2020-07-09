//
//  CIStretchCrop.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.6, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Stretch Crop
	///
	/// Distorts an image by stretching and or cropping to fit a target size.
	///
	/// **Links**
	///
	/// [CIStretchCrop Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStretchCrop)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIStretchCrop/)
	///
	@objc(CIFilterFactory_CIStretchCrop) class CIStretchCrop: Core {
		@objc public init?() {
			super.init(name: "CIStretchCrop")
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

		// MARK: - inputSize

		///
		/// The size in pixels of the output image.
		///
		@objc public var inputSize: CIVector? {
			get {
				return filter.value(forKey: "inputSize") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputSize")
			}
		}

		// MARK: - inputCropAmount

		///
		/// Determines if and how much cropping should be used to achieve the target size. If value is 0 then only stretching is used. If 1 then only cropping is used.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputCropAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputCropAmount: NSNumber? {
			get {
				return filter.value(forKey: "inputCropAmount") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCropAmount_Range), forKey: "inputCropAmount")
			}
		}

		// MARK: - inputCenterStretchAmount

		///
		/// Determine how much the center of the image is stretched if stretching is used. If value is 0 then the center of the image maintains the original aspect ratio. If 1 then the image is stretched uniformly.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputCenterStretchAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputCenterStretchAmount: NSNumber? {
			get {
				return filter.value(forKey: "inputCenterStretchAmount") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCenterStretchAmount_Range), forKey: "inputCenterStretchAmount")
			}
		}
	}
}
