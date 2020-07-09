//
//  CICoreMLModelFilter.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.14, iOS 12, *)
@objc public extension CIFilterFactory {
	///
	/// CoreML Model Filter
	///
	/// Generates output image by applying input CoreML model to the input image.
	///
	/// **Links**
	///
	/// [CICoreMLModelFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICoreMLModelFilter)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICoreMLModelFilter/)
	///
	@objc(CIFilterFactory_CICoreMLModelFilter) class CICoreMLModelFilter: Core {
		@objc public init?() {
			super.init(name: "CICoreMLModelFilter")
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

		// MARK: - inputModel

		///
		/// The CoreML model to be used for applying effect on the image.
		///
		@objc public var inputModel: MLModel? {
			get {
				return filter.value(forKey: "inputModel") as? MLModel
			}
			set {
				filter.setValue(newValue, forKey: "inputModel")
			}
		}

		// MARK: - inputHeadIndex

		///
		/// A number to specify which output of a multi-head CoreML model should be used for applying effect on the image.
		///
		///   minValue: 0.0
		///   maxValue: 10.0
		///
		let inputHeadIndex_Range: ClosedRange<Float> = 0.0 ... 10.0
		@objc public var inputHeadIndex: NSNumber? {
			get {
				return filter.value(forKey: "inputHeadIndex") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputHeadIndex_Range), forKey: "inputHeadIndex")
			}
		}

		// MARK: - inputSoftmaxNormalization

		///
		/// A boolean value to specify that Softmax normalization should be applied to the output of the model.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputSoftmaxNormalization_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputSoftmaxNormalization: NSNumber? {
			get {
				return filter.value(forKey: "inputSoftmaxNormalization") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputSoftmaxNormalization_Range), forKey: "inputSoftmaxNormalization")
			}
		}
	}
}