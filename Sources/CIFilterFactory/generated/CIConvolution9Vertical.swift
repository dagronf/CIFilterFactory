//
//  CIConvolution9Vertical.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.9, iOS 7, tvOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Vertical 9 Convolution
	///
	/// Vertical Convolution with 9 values
	///
	/// **Links**
	///
	/// - [CIConvolution9Vertical Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution9Vertical)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciconvolution9vertical?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIConvolution9Vertical/)
	///
	@objc(CIFilterFactory_Convolution9Vertical) class Convolution9Vertical: FilterCore {
		@objc public init?() {
			super.init(name: "CIConvolution9Vertical")
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

		// MARK: - weights (inputWeights)

		///
		/// No Description
		///
		///   - Attribute key: `inputWeights`
		///   - Internal class: `CIVector`
		///   - Default value: `[0 0 0 0 1 0 0 0 0]`
		@objc public var weights: CIVector? {
			get {
				return self.keyedValue("inputWeights")
			}
			set {
				self.setKeyedValue(newValue, for: "inputWeights")
			}
		}

		// MARK: - bias (inputBias)

		///
		/// No Description
		///
		///   - Attribute key: `inputBias`
		///   - Internal class: `NSNumber`
		///   - Default value: `0`
		@objc public var bias: NSNumber? {
			get {
				return self.keyedValue("inputBias")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBias")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			weights: CIVector = CIVector([0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0]),
			bias: NSNumber = 0
		) {
			self.init()

			self.image = image
			self.weights = weights
			self.bias = bias
		}
	}
}
