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

public extension CIFilter {
	@available(macOS 10.14, iOS 12, *)
	@inlinable @objc static func CoreMLModelFilter() -> CIFilterFactory.CICoreMLModelFilter? {
		return CIFilterFactory.CICoreMLModelFilter()
	}
}

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
	@objc(CIFilterFactory_CICoreMLModelFilter) class CICoreMLModelFilter: FilterCore {
		@objc public init?() {
			super.init(name: "CICoreMLModelFilter")
		}

		// MARK: - Inputs

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
		/// The CoreML model to be used for applying effect on the image.
		///
		///   Class:    MLModel
		@objc public dynamic var inputModel: MLModel? {
			get {
				return self.filter.value(forKey: "inputModel") as? MLModel
			}
			set {
				self.filter.setValue(newValue, forKey: "inputModel")
			}
		}

		///
		/// A number to specify which output of a multi-head CoreML model should be used for applying effect on the image.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeInteger
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 10.0
		///
		public static let inputHeadIndex_Range: ClosedRange<Float> = 0.0 ... 10.0
		@objc public dynamic var inputHeadIndex: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHeadIndex") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CICoreMLModelFilter.inputHeadIndex_Range), forKey: "inputHeadIndex")
			}
		}

		///
		/// A boolean value to specify that Softmax normalization should be applied to the output of the model.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeBoolean
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputSoftmaxNormalization_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputSoftmaxNormalization: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSoftmaxNormalization") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CICoreMLModelFilter.inputSoftmaxNormalization_Range), forKey: "inputSoftmaxNormalization")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputModel: MLModel,
			inputHeadIndex: NSNumber = 0,
			inputSoftmaxNormalization: NSNumber = 0
		) {
			self.init()

			self.inputImage = inputImage
			self.inputModel = inputModel
			self.inputHeadIndex = inputHeadIndex
			self.inputSoftmaxNormalization = inputSoftmaxNormalization
		}
	}
}
