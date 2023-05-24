//
//  Convolution5X5.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2023 Darren Ford. All rights reserved.
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

@objc public extension CIFF {
	/// 5 by 5 Convolution
	///
	/// Convolution with 5 by 5 matrix.
	///
	/// **CIFilter Name**
	/// - CIConvolution5X5
	///
	/// **Availability**
	/// - macOS 10.9, iOS 7, tvOS 7
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Stylize (*CICategoryStylize*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIConvolution5X5 Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution5X5)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIConvolution5X5/)
	@available(macOS 10.9, iOS 7, tvOS 7, *)
	@objc(CIFFConvolution5X5) class Convolution5X5: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIConvolution5X5")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input for the effect.
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

		/// A vector containing the 25 weights of the convolution kernel.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWeights`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]`
		@objc public var weights: CIVector? {
			get {
				self.keyedValue("inputWeights")
			}
			set {
				self.setKeyedValue(newValue, for: "inputWeights")
			}
		}

		/// `weights` default value
		@objc public static let weightsDefault = CIVector(values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 25)

		// MARK: - bias (inputBias)

		/// A value that is added to the RGBA components of the output pixel.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBias`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `0.0`
		@objc public var bias: Double {
			get {
				self.doubleValue(forKey: "inputBias", defaultValue: Self.biasDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputBias")
			}
		}

		/// `bias` default value
		@objc public static let biasDefault: Double = 0.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - weights: A vector containing the 25 weights of the convolution kernel.
		///   - bias: A value that is added to the RGBA components of the output pixel.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			weights: CIVector = Convolution5X5.weightsDefault,
			bias: Double = Convolution5X5.biasDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.weights = weights
			self.bias = bias
		}
	}
}

@available(macOS 10.9, iOS 7, tvOS 7, *)
public extension CIImage {
	/// Apply the '5 by 5 Convolution' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - weights: A vector containing the 25 weights of the convolution kernel.
	///   - bias: A value that is added to the RGBA components of the output pixel.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Convolution with 5 by 5 matrix.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Stylize, Video
	///
	/// **Documentation Links**
	/// - [CIConvolution5X5 Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution5X5)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIConvolution5X5/)
	@inlinable func applyingConvolution5X5(
		weights: CIVector = CIFF.Convolution5X5.weightsDefault,
		bias: Double = CIFF.Convolution5X5.biasDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.Convolution5X5(
			inputImage: self,
			weights: weights,
			bias: bias
		)?.outputImage ?? CIImage.empty()
	}
}
