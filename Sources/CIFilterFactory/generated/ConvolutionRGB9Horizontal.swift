//
//  ConvolutionRGB9Horizontal.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 12.0, iOS 15, tvOS 15, *)
@objc public extension CIFF {
	///
	/// Horizontal 9 RGB Convolution
	///
	/// Horizontal Convolution of RGB channels with 9 values
	///
	/// **Availability**
	/// - macOS 12.0, iOS 15, tvOS 15
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryStillImage
	/// - CICategoryStylize
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIConvolutionRGB9Horizontal Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolutionRGB9Horizontal)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciconvolutionrgb9horizontal?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIConvolutionRGB9Horizontal/)
	///
	@available(macOS 12.0, iOS 15, tvOS 15, *)
	@objc(CIFFConvolutionRGB9Horizontal) class ConvolutionRGB9Horizontal: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIConvolutionRGB9Horizontal")
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

		// MARK: - weights (inputWeights)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWeights`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 0 0 0 1 0 0 0 0]`
		@objc public var weights: CIVector? {
			get {
				self.keyedValue("inputWeights")
			}
			set {
				self.setKeyedValue(newValue, for: "inputWeights")
			}
		}

		/// `weights` default value
		@objc public static let weightsDefault = CIVector(values: [0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0], count: 9)

		// MARK: - bias (inputBias)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBias`
		/// - Internal class: `NSNumber`
		@objc public var bias: NSNumber? {
			get {
				self.keyedValue("inputBias")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBias")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			weights: CIVector = ConvolutionRGB9Horizontal.weightsDefault,
			bias: NSNumber
		) {
			self.init()
			self.inputImage = inputImage
			self.weights = weights
			self.bias = bias
		}
	}
}
