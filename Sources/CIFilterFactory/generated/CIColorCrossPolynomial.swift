//
//  CIColorCrossPolynomial.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.9, iOS 7, *)
	@inlinable @objc static func ColorCrossPolynomial() -> CIFilterFactory.CIColorCrossPolynomial? {
		return CIFilterFactory.CIColorCrossPolynomial()
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Color Cross Polynomial
	///
	/// Adjusts the color of an image with polynomials.
	///
	/// **Links**
	///
	/// [CIColorCrossPolynomial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCrossPolynomial)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorCrossPolynomial/)
	///
	@objc(CIFilterFactory_CIColorCrossPolynomial) class CIColorCrossPolynomial: FilterCore {
		@objc public init?() {
			super.init(name: "CIColorCrossPolynomial")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		///
		/// Polynomial coefficients for red channel
		///
		///   Class:    CIVector
		///   Default:  [1 0 0 0 0 0 0 0 0 0]
		@objc public dynamic var inputRedCoefficients: CIVector? {
			get {
				return self.keyedValue("inputRedCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRedCoefficients")
			}
		}

		///
		/// Polynomial coefficients for green channel
		///
		///   Class:    CIVector
		///   Default:  [0 1 0 0 0 0 0 0 0 0]
		@objc public dynamic var inputGreenCoefficients: CIVector? {
			get {
				return self.keyedValue("inputGreenCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGreenCoefficients")
			}
		}

		///
		/// Polynomial coefficients for blue channel
		///
		///   Class:    CIVector
		///   Default:  [0 0 1 0 0 0 0 0 0 0]
		@objc public dynamic var inputBlueCoefficients: CIVector? {
			get {
				return self.keyedValue("inputBlueCoefficients")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBlueCoefficients")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputRedCoefficients: CIVector = CIVector([1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]),
			inputGreenCoefficients: CIVector = CIVector([0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]),
			inputBlueCoefficients: CIVector = CIVector([0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
		) {
			self.init()

			self.inputImage = inputImage
			self.inputRedCoefficients = inputRedCoefficients
			self.inputGreenCoefficients = inputGreenCoefficients
			self.inputBlueCoefficients = inputBlueCoefficients
		}
	}
}
