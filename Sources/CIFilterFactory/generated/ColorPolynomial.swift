//
//  ColorPolynomial.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.9, iOS 7, tvOS 7, *)
@objc public extension CIFF {
	///
	/// Color Polynomial
	///
	/// Adjusts the color of an image with polynomials.
	///
	/// **Links**
	///
	/// - [CIColorPolynomial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPolynomial)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolorpolynomial?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorPolynomial/)
	///
	@available(macOS 10.9, iOS 7, tvOS 7, *)
	@objc(CIFFColorPolynomial) class ColorPolynomial: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIColorPolynomial")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - redCoefficients (inputRedCoefficients)

		/// Polynomial coefficients for red channel
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRedCoefficients`
		/// - Internal class: `CIVector`
		/// - Default value: `[0 1 0 0]`
		@objc public var redCoefficients: CIVector? {
			get {
				return self.keyedValue("inputRedCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRedCoefficients")
			}
		}

		// MARK: - greenCoefficients (inputGreenCoefficients)

		/// Polynomial coefficients for green channel
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGreenCoefficients`
		/// - Internal class: `CIVector`
		/// - Default value: `[0 1 0 0]`
		@objc public var greenCoefficients: CIVector? {
			get {
				return self.keyedValue("inputGreenCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGreenCoefficients")
			}
		}

		// MARK: - blueCoefficients (inputBlueCoefficients)

		/// Polynomial coefficients for blue channel
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBlueCoefficients`
		/// - Internal class: `CIVector`
		/// - Default value: `[0 1 0 0]`
		@objc public var blueCoefficients: CIVector? {
			get {
				return self.keyedValue("inputBlueCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBlueCoefficients")
			}
		}

		// MARK: - alphaCoefficients (inputAlphaCoefficients)

		/// Polynomial coefficients for alpha channel
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAlphaCoefficients`
		/// - Internal class: `CIVector`
		/// - Default value: `[0 1 0 0]`
		@objc public var alphaCoefficients: CIVector? {
			get {
				return self.keyedValue("inputAlphaCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAlphaCoefficients")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			redCoefficients: CIVector = CIVector([0.0, 1.0, 0.0, 0.0]),
			greenCoefficients: CIVector = CIVector([0.0, 1.0, 0.0, 0.0]),
			blueCoefficients: CIVector = CIVector([0.0, 1.0, 0.0, 0.0]),
			alphaCoefficients: CIVector = CIVector([0.0, 1.0, 0.0, 0.0])
		) {
			self.init()

			self.image = image
			self.redCoefficients = redCoefficients
			self.greenCoefficients = greenCoefficients
			self.blueCoefficients = blueCoefficients
			self.alphaCoefficients = alphaCoefficients
		}
	}
}
