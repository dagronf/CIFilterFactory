//
//  CIColorPolynomial.swift  (AUTOMATICALLY GENERATED FILE)
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

#if !os(macOS)
	import UIKit // For access to NSValue.cgAffineTransformValue
#endif

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Color Polynomial
	///
	/// Adjusts the color of an image with polynomials.
	///
	/// **Links**
	///
	/// [CIColorPolynomial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPolynomial)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorPolynomial/)
	///
	@objc(CIFilterFactory_CIColorPolynomial) class CIColorPolynomial: Core {
		@objc public init?() {
			super.init(name: "CIColorPolynomial")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputRedCoefficients

		///
		/// Polynomial coefficients for red channel
		///
		@objc public var inputRedCoefficients: CIVector? {
			get {
				return filter.value(forKey: "inputRedCoefficients") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputRedCoefficients")
			}
		}

		// MARK: - inputGreenCoefficients

		///
		/// Polynomial coefficients for green channel
		///
		@objc public var inputGreenCoefficients: CIVector? {
			get {
				return filter.value(forKey: "inputGreenCoefficients") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputGreenCoefficients")
			}
		}

		// MARK: - inputBlueCoefficients

		///
		/// Polynomial coefficients for blue channel
		///
		@objc public var inputBlueCoefficients: CIVector? {
			get {
				return filter.value(forKey: "inputBlueCoefficients") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputBlueCoefficients")
			}
		}

		// MARK: - inputAlphaCoefficients

		///
		/// Polynomial coefficients for alpha channel
		///
		@objc public var inputAlphaCoefficients: CIVector? {
			get {
				return filter.value(forKey: "inputAlphaCoefficients") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputAlphaCoefficients")
			}
		}
	}
}
