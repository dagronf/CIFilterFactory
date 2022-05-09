//
//  CoreMLModelFilter.swift  (AUTOMATICALLY GENERATED FILE)
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

import AVFoundation
import CoreImage
import CoreML
import Foundation

@available(macOS 10.14, iOS 12, tvOS 12, *)
@objc public extension CIFF {
	///
	/// CoreML Model Filter
	///
	/// Generates output image by applying input CoreML model to the input image.
	///
	/// **Availability**
	/// - macOS 10.14, iOS 12, tvOS 12
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryStillImage
	/// - CICategoryStylize
	///
	/// **Documentation Links**
	/// - [CICoreMLModelFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICoreMLModelFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicoremlmodelfilter?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICoreMLModelFilter/)
	///
	@available(macOS 10.14, iOS 12, tvOS 12, *)
	@objc(CIFFCoreMLModelFilter) class CoreMLModelFilter: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CICoreMLModelFilter")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
			get {
				self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - model (inputModel)

		/// The CoreML model to be used for applying effect on the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputModel`
		/// - Internal class: `MLModel`
		@objc public var model: MLModel? {
			get {
				self.keyedValue("inputModel")
			}
			set {
				self.setKeyedValue(newValue, for: "inputModel")
			}
		}

		// MARK: - headIndex (inputHeadIndex)

		/// A number to specify which output of a multi-head CoreML model should be used for applying effect on the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputHeadIndex`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `0`
		/// - Maximum Value: `10`
		/// - Default Value: `0`
		@objc public var headIndex: Int {
			get {
				self.intValue(forKey: "inputHeadIndex", defaultValue: Self.headIndexDefault)
			}
			set {
				self.setIntValue(newValue, bounds: CoreMLModelFilter.headIndexRange, forKey: "inputHeadIndex")
			}
		}

		/// `headIndex` default value
		@objc public static let headIndexDefault: Int = 0

		/// `headIndex` range definition
		public static let headIndexRange: ClosedRange<Int> = 0 ... 10

		// MARK: - softmaxNormalization (inputSoftmaxNormalization)

		/// A boolean value to specify that Softmax normalization should be applied to the output of the model.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSoftmaxNormalization`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var softmaxNormalization: Bool {
			get {
				self.boolValue(forKey: "inputSoftmaxNormalization", defaultValue: Self.softmaxNormalizationDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputSoftmaxNormalization")
			}
		}

		/// `softmaxNormalization` default value
		@objc public static let softmaxNormalizationDefault: Bool = false

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			model: MLModel,
			headIndex: Int = CoreMLModelFilter.headIndexDefault,
			softmaxNormalization: Bool = CoreMLModelFilter.softmaxNormalizationDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.model = model
			self.headIndex = headIndex
			self.softmaxNormalization = softmaxNormalization
		}
	}
}
