//
//  ColorCrossPolynomial.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Cross Polynomial
	///
	/// Adjusts the color of an image with polynomials.
	///
	/// **CIFilter Name**
	/// - CIColorCrossPolynomial
	///
	/// **Availability**
	/// - macOS 10.9, iOS 7, tvOS 7
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorEffect (*CICategoryColorEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIColorCrossPolynomial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCrossPolynomial)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCrossPolynomial/)
	@available(macOS 10.9, iOS 7, tvOS 7, *)
	@objc(CIFFColorCrossPolynomial) class ColorCrossPolynomial: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIColorCrossPolynomial")
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
		/// - Default Value: `[1 0 0 0 0 0 0 0 0 0]`
		@objc public var redCoefficients: CIVector? {
			get {
				self.keyedValue("inputRedCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRedCoefficients")
			}
		}

		/// `redCoefficients` default value
		@objc public static let redCoefficientsDefault = CIVector(values: [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10)

		// MARK: - greenCoefficients (inputGreenCoefficients)

		/// Polynomial coefficients for green channel.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGreenCoefficients`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 1 0 0 0 0 0 0 0 0]`
		@objc public var greenCoefficients: CIVector? {
			get {
				self.keyedValue("inputGreenCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGreenCoefficients")
			}
		}

		/// `greenCoefficients` default value
		@objc public static let greenCoefficientsDefault = CIVector(values: [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10)

		// MARK: - blueCoefficients (inputBlueCoefficients)

		/// Polynomial coefficients for blue channel.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBlueCoefficients`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 0 1 0 0 0 0 0 0 0]`
		@objc public var blueCoefficients: CIVector? {
			get {
				self.keyedValue("inputBlueCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBlueCoefficients")
			}
		}

		/// `blueCoefficients` default value
		@objc public static let blueCoefficientsDefault = CIVector(values: [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - redCoefficients: Polynomial coefficients for red channel.
		///   - greenCoefficients: Polynomial coefficients for green channel.
		///   - blueCoefficients: Polynomial coefficients for blue channel.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			redCoefficients: CIVector = ColorCrossPolynomial.redCoefficientsDefault,
			greenCoefficients: CIVector = ColorCrossPolynomial.greenCoefficientsDefault,
			blueCoefficients: CIVector = ColorCrossPolynomial.blueCoefficientsDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.redCoefficients = redCoefficients
			self.greenCoefficients = greenCoefficients
			self.blueCoefficients = blueCoefficients
		}
	}
}

@available(macOS 10.9, iOS 7, tvOS 7, *)
public extension CIImage {
	/// Apply the 'Color Cross Polynomial' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - redCoefficients: Polynomial coefficients for red channel.
	///   - greenCoefficients: Polynomial coefficients for green channel.
	///   - blueCoefficients: Polynomial coefficients for blue channel.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Adjusts the color of an image with polynomials.
	///
	/// **Categories**: BuiltIn, ColorEffect, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIColorCrossPolynomial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCrossPolynomial)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCrossPolynomial/)
	@inlinable func applyingColorCrossPolynomial(
		redCoefficients: CIVector = CIFF.ColorCrossPolynomial.redCoefficientsDefault,
		greenCoefficients: CIVector = CIFF.ColorCrossPolynomial.greenCoefficientsDefault,
		blueCoefficients: CIVector = CIFF.ColorCrossPolynomial.blueCoefficientsDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ColorCrossPolynomial(
			inputImage: self,
			redCoefficients: redCoefficients,
			greenCoefficients: greenCoefficients,
			blueCoefficients: blueCoefficients
		)?.outputImage ?? CIImage.empty()
	}
}
