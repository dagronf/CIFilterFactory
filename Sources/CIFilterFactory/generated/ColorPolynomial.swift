//
//  ColorPolynomial.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Polynomial
	///
	/// Adjusts the color of an image with polynomials.
	///
	/// **CIFilter Name**
	/// - CIColorPolynomial
	///
	/// **Availability**
	/// - macOS 10.9, iOS 7, tvOS 7
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorAdjustment (*CICategoryColorAdjustment*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIColorPolynomial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPolynomial)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorPolynomial/)
	@available(macOS 10.9, iOS 7, tvOS 7, *)
	@objc(CIFFColorPolynomial) class ColorPolynomial: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIColorPolynomial")
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

		// MARK: - redCoefficients (inputRedCoefficients)

		/// Polynomial coefficients for red channel.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRedCoefficients`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 1 0 0]`
		@objc public var redCoefficients: CIVector? {
			get {
				self.keyedValue("inputRedCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRedCoefficients")
			}
		}

		/// `redCoefficients` default value
		@objc public static let redCoefficientsDefault = CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4)

		// MARK: - greenCoefficients (inputGreenCoefficients)

		/// Polynomial coefficients for green channel.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGreenCoefficients`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 1 0 0]`
		@objc public var greenCoefficients: CIVector? {
			get {
				self.keyedValue("inputGreenCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGreenCoefficients")
			}
		}

		/// `greenCoefficients` default value
		@objc public static let greenCoefficientsDefault = CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4)

		// MARK: - blueCoefficients (inputBlueCoefficients)

		/// Polynomial coefficients for blue channel.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBlueCoefficients`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 1 0 0]`
		@objc public var blueCoefficients: CIVector? {
			get {
				self.keyedValue("inputBlueCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBlueCoefficients")
			}
		}

		/// `blueCoefficients` default value
		@objc public static let blueCoefficientsDefault = CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4)

		// MARK: - alphaCoefficients (inputAlphaCoefficients)

		/// Polynomial coefficients for alpha channel.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAlphaCoefficients`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 1 0 0]`
		@objc public var alphaCoefficients: CIVector? {
			get {
				self.keyedValue("inputAlphaCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAlphaCoefficients")
			}
		}

		/// `alphaCoefficients` default value
		@objc public static let alphaCoefficientsDefault = CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - redCoefficients: Polynomial coefficients for red channel.
		///   - greenCoefficients: Polynomial coefficients for green channel.
		///   - blueCoefficients: Polynomial coefficients for blue channel.
		///   - alphaCoefficients: Polynomial coefficients for alpha channel.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			redCoefficients: CIVector = ColorPolynomial.redCoefficientsDefault,
			greenCoefficients: CIVector = ColorPolynomial.greenCoefficientsDefault,
			blueCoefficients: CIVector = ColorPolynomial.blueCoefficientsDefault,
			alphaCoefficients: CIVector = ColorPolynomial.alphaCoefficientsDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.redCoefficients = redCoefficients
			self.greenCoefficients = greenCoefficients
			self.blueCoefficients = blueCoefficients
			self.alphaCoefficients = alphaCoefficients
		}
	}
}

@available(macOS 10.9, iOS 7, tvOS 7, *)
public extension CIImage {
	/// Apply the 'Color Polynomial' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - redCoefficients: Polynomial coefficients for red channel.
	///   - greenCoefficients: Polynomial coefficients for green channel.
	///   - blueCoefficients: Polynomial coefficients for blue channel.
	///   - alphaCoefficients: Polynomial coefficients for alpha channel.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Adjusts the color of an image with polynomials.
	///
	/// **Categories**: BuiltIn, ColorAdjustment, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIColorPolynomial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPolynomial)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorPolynomial/)
	@inlinable func applyingColorPolynomial(
		redCoefficients: CIVector = CIFF.ColorPolynomial.redCoefficientsDefault,
		greenCoefficients: CIVector = CIFF.ColorPolynomial.greenCoefficientsDefault,
		blueCoefficients: CIVector = CIFF.ColorPolynomial.blueCoefficientsDefault,
		alphaCoefficients: CIVector = CIFF.ColorPolynomial.alphaCoefficientsDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ColorPolynomial(
			inputImage: self,
			redCoefficients: redCoefficients,
			greenCoefficients: greenCoefficients,
			blueCoefficients: blueCoefficients,
			alphaCoefficients: alphaCoefficients
		)?.outputImage ?? CIImage.empty()
	}
}
