//
//  CIColorMatrix.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 5, tvOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Matrix
	///
	/// Multiplies source color values and adds a bias factor to each color component.
	///
	/// **Links**
	///
	/// - [CIColorMatrix Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMatrix)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolormatrix?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorMatrix/)
	///
	@objc(CIFilterFactory_ColorMatrix) class ColorMatrix: FilterCore {
		@objc public init?() {
			super.init(name: "CIColorMatrix")
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

		// MARK: - rVector (inputRVector)

		///
		/// The amount of red to multiply the source color values by.
		///
		///   - Attribute key: `inputRVector`
		///   - Internal class: `CIVector`
		///   - Default value: `[1 0 0 0]`
		@objc public var rVector: CIVector? {
			get {
				return self.keyedValue("inputRVector")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRVector")
			}
		}

		// MARK: - gVector (inputGVector)

		///
		/// The amount of green to multiply the source color values by.
		///
		///   - Attribute key: `inputGVector`
		///   - Internal class: `CIVector`
		///   - Default value: `[0 1 0 0]`
		@objc public var gVector: CIVector? {
			get {
				return self.keyedValue("inputGVector")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGVector")
			}
		}

		// MARK: - bVector (inputBVector)

		///
		/// The amount of blue to multiply the source color values by.
		///
		///   - Attribute key: `inputBVector`
		///   - Internal class: `CIVector`
		///   - Default value: `[0 0 1 0]`
		@objc public var bVector: CIVector? {
			get {
				return self.keyedValue("inputBVector")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBVector")
			}
		}

		// MARK: - aVector (inputAVector)

		///
		/// The amount of alpha to multiply the source color values by.
		///
		///   - Attribute key: `inputAVector`
		///   - Internal class: `CIVector`
		///   - Default value: `[0 0 0 1]`
		@objc public var aVector: CIVector? {
			get {
				return self.keyedValue("inputAVector")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAVector")
			}
		}

		// MARK: - biasVector (inputBiasVector)

		///
		/// A vector that’s added to each color component.
		///
		///   - Attribute key: `inputBiasVector`
		///   - Internal class: `CIVector`
		///   - Default value: `[0 0 0 0]`
		@objc public var biasVector: CIVector? {
			get {
				return self.keyedValue("inputBiasVector")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBiasVector")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			rVector: CIVector = CIVector([1.0, 0.0, 0.0, 0.0]),
			gVector: CIVector = CIVector([0.0, 1.0, 0.0, 0.0]),
			bVector: CIVector = CIVector([0.0, 0.0, 1.0, 0.0]),
			aVector: CIVector = CIVector([0.0, 0.0, 0.0, 1.0]),
			biasVector: CIVector = CIVector([0.0, 0.0, 0.0, 0.0])
		) {
			self.init()

			self.image = image
			self.rVector = rVector
			self.gVector = gVector
			self.bVector = bVector
			self.aVector = aVector
			self.biasVector = biasVector
		}
	}
}
