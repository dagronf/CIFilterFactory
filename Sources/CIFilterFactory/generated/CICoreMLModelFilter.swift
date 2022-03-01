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

@available(macOS 10.14, iOS 12, tvOS 12, *)
@objc public extension CIFilterFactory {
	///
	/// CoreML Model Filter
	///
	/// Generates output image by applying input CoreML model to the input image.
	///
	/// **Links**
	///
	/// - [CICoreMLModelFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICoreMLModelFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicoremlmodelfilter?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICoreMLModelFilter/)
	///
	@objc(CIFilterFactory_CoreMLModelFilter) class CoreMLModelFilter: FilterCore {
		@objc public init?() {
			super.init(name: "CICoreMLModelFilter")
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

		// MARK: - model (inputModel)

		///
		/// The CoreML model to be used for applying effect on the image.
		///
		///   - Attribute key: `inputModel`
		///   - Internal class: `MLModel`
		@objc public var model: MLModel? {
			get {
				return self.keyedValue("inputModel")
			}
			set {
				self.setKeyedValue(newValue, for: "inputModel")
			}
		}

		// MARK: - headIndex (inputHeadIndex)

		///
		/// A number to specify which output of a multi-head CoreML model should be used for applying effect on the image.
		///
		///   - Attribute key: `inputHeadIndex`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeInteger`
		///   - Default value: `0`
		///   minValue: 0.0
		///   maxValue: 10.0
		///
		public static let headIndex_Range: ClosedRange<Float> = 0.0 ... 10.0
		@objc public var headIndex: NSNumber? {
			get {
				return self.keyedValue("inputHeadIndex")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CoreMLModelFilter.headIndex_Range), forKey: "inputHeadIndex")
			}
		}

		// MARK: - softmaxNormalization (inputSoftmaxNormalization)

		///
		/// A boolean value to specify that Softmax normalization should be applied to the output of the model.
		///
		///   - Attribute key: `inputSoftmaxNormalization`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeBoolean`
		///   - Default value: `0`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let softmaxNormalization_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var softmaxNormalization: NSNumber? {
			get {
				return self.keyedValue("inputSoftmaxNormalization")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CoreMLModelFilter.softmaxNormalization_Range), forKey: "inputSoftmaxNormalization")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			model: MLModel,
			headIndex: NSNumber = 0,
			softmaxNormalization: NSNumber = 0
		) {
			self.init()

			self.image = image
			self.model = model
			self.headIndex = headIndex
			self.softmaxNormalization = softmaxNormalization
		}
	}
}
