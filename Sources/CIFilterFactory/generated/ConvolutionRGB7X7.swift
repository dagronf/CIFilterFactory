//
//  ConvolutionRGB7X7.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2024 Darren Ford. All rights reserved.
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

#if canImport(CoreImage)

	import AVFoundation
	import CoreImage
	import CoreML
	import Foundation

	@objc public extension CIFF {
		/// 7 by 7 RGB Convolution
		///
		/// Convolution of RGB channels with 7 by 7 matrix.
		///
		/// **CIFilter Name**
		/// - CIConvolutionRGB7X7
		///
		/// **Availability**
		/// - macOS 12.0, iOS 15, tvOS 15
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - HighDynamicRange (*CICategoryHighDynamicRange*)
		/// - StillImage (*CICategoryStillImage*)
		/// - Stylize (*CICategoryStylize*)
		/// - Video (*CICategoryVideo*)
		///
		/// **Documentation Links**
		/// - [CIConvolutionRGB7X7 Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolutionRGB7X7)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciconvolutionrgb7x7)
		/// - [CIFilter.app documentation](https://cifilter.app/CIConvolutionRGB7X7/)
		@available(macOS 12.0, iOS 15, tvOS 15, *)
		@objc(CIFFConvolutionRGB7X7) class ConvolutionRGB7X7: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIConvolutionRGB7X7")
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

			/// A vector containing the 49 weights of the convolution kernel.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputWeights`
			/// - Internal class: `CIVector`
			/// - Default Value: `[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]`
			@objc public var weights: CIVector? {
				get {
					self.keyedValue("inputWeights")
				}
				set {
					self.setKeyedValue(newValue, for: "inputWeights")
				}
			}

			/// `weights` default value
			@objc public static let weightsDefault = CIVector(values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 49)

			// MARK: - bias (inputBias)

			/// A value that is added to the RGB components of the output pixel.
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
			///   - weights: A vector containing the 49 weights of the convolution kernel.
			///   - bias: A value that is added to the RGB components of the output pixel.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				weights: CIVector = ConvolutionRGB7X7.weightsDefault,
				bias: Double = ConvolutionRGB7X7.biasDefault
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

	@available(macOS 12.0, iOS 15, tvOS 15, *)
	public extension CIImage {
		/// Apply the '7 by 7 RGB Convolution' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - weights: A vector containing the 49 weights of the convolution kernel.
		///   - bias: A value that is added to the RGB components of the output pixel.
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Convolution of RGB channels with 7 by 7 matrix.
		///
		/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Stylize, Video
		///
		/// **Documentation Links**
		/// - [CIConvolutionRGB7X7 Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolutionRGB7X7)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciconvolutionrgb7x7)
		/// - [CIFilter.app documentation](https://cifilter.app/CIConvolutionRGB7X7/)
		@inlinable func applyingConvolutionRGB7X7(
			weights: CIVector = CIFF.ConvolutionRGB7X7.weightsDefault,
			bias: Double = CIFF.ConvolutionRGB7X7.biasDefault,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.ConvolutionRGB7X7(
				inputImage: self,
				weights: weights,
				bias: bias
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
