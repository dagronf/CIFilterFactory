//
//  ColorMatrix.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Matrix
	///
	/// Multiplies source color values and adds a bias factor to each color component.
	///
	/// **CIFilter Name**
	/// - CIColorMatrix
	///
	/// **Availability**
	/// - macOS 10.4, iOS 5, tvOS 5
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
	/// - [CIColorMatrix Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMatrix)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorMatrix/)
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFColorMatrix) class ColorMatrix: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIColorMatrix")
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

		// MARK: - rVector (inputRVector)

		/// The amount of red to multiply the source color values by.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRVector`
		/// - Internal class: `CIVector`
		/// - Default Value: `[1 0 0 0]`
		@objc public var rVector: CIVector? {
			get {
				self.keyedValue("inputRVector")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRVector")
			}
		}

		/// `rVector` default value
		@objc public static let rVectorDefault = CIVector(values: [1.0, 0.0, 0.0, 0.0], count: 4)

		// MARK: - gVector (inputGVector)

		/// The amount of green to multiply the source color values by.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGVector`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 1 0 0]`
		@objc public var gVector: CIVector? {
			get {
				self.keyedValue("inputGVector")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGVector")
			}
		}

		/// `gVector` default value
		@objc public static let gVectorDefault = CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4)

		// MARK: - bVector (inputBVector)

		/// The amount of blue to multiply the source color values by.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBVector`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 0 1 0]`
		@objc public var bVector: CIVector? {
			get {
				self.keyedValue("inputBVector")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBVector")
			}
		}

		/// `bVector` default value
		@objc public static let bVectorDefault = CIVector(values: [0.0, 0.0, 1.0, 0.0], count: 4)

		// MARK: - aVector (inputAVector)

		/// The amount of alpha to multiply the source color values by.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAVector`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 0 0 1]`
		@objc public var aVector: CIVector? {
			get {
				self.keyedValue("inputAVector")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAVector")
			}
		}

		/// `aVector` default value
		@objc public static let aVectorDefault = CIVector(values: [0.0, 0.0, 0.0, 1.0], count: 4)

		// MARK: - biasVector (inputBiasVector)

		/// A vector that’s added to each color component.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBiasVector`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 0 0 0]`
		@objc public var biasVector: CIVector? {
			get {
				self.keyedValue("inputBiasVector")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBiasVector")
			}
		}

		/// `biasVector` default value
		@objc public static let biasVectorDefault = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - rVector: The amount of red to multiply the source color values by.
		///   - gVector: The amount of green to multiply the source color values by.
		///   - bVector: The amount of blue to multiply the source color values by.
		///   - aVector: The amount of alpha to multiply the source color values by.
		///   - biasVector: A vector that’s added to each color component.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			rVector: CIVector = ColorMatrix.rVectorDefault,
			gVector: CIVector = ColorMatrix.gVectorDefault,
			bVector: CIVector = ColorMatrix.bVectorDefault,
			aVector: CIVector = ColorMatrix.aVectorDefault,
			biasVector: CIVector = ColorMatrix.biasVectorDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.rVector = rVector
			self.gVector = gVector
			self.bVector = bVector
			self.aVector = aVector
			self.biasVector = biasVector
		}
	}
}

@available(macOS 10.4, iOS 5, tvOS 5, *)
public extension CIImage {
	/// Apply the 'Color Matrix' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - rVector: The amount of red to multiply the source color values by.
	///   - gVector: The amount of green to multiply the source color values by.
	///   - bVector: The amount of blue to multiply the source color values by.
	///   - aVector: The amount of alpha to multiply the source color values by.
	///   - biasVector: A vector that’s added to each color component.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Multiplies source color values and adds a bias factor to each color component.
	///
	/// **Categories**: BuiltIn, ColorAdjustment, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIColorMatrix Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMatrix)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorMatrix/)
	@inlinable func applyingColorMatrix(
		rVector: CIVector = CIFF.ColorMatrix.rVectorDefault,
		gVector: CIVector = CIFF.ColorMatrix.gVectorDefault,
		bVector: CIVector = CIFF.ColorMatrix.bVectorDefault,
		aVector: CIVector = CIFF.ColorMatrix.aVectorDefault,
		biasVector: CIVector = CIFF.ColorMatrix.biasVectorDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ColorMatrix(
			inputImage: self,
			rVector: rVector,
			gVector: gVector,
			bVector: bVector,
			aVector: aVector,
			biasVector: biasVector
		)?.outputImage ?? CIImage.empty()
	}
}
