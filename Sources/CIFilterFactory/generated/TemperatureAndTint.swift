//
//  TemperatureAndTint.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Temperature and Tint
	///
	/// Adapt the reference white point for an image.
	///
	/// **CIFilter Name**
	/// - CITemperatureAndTint
	///
	/// **Availability**
	/// - macOS 10.7, iOS 5, tvOS 5
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
	/// - [CITemperatureAndTint Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITemperatureAndTint)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CITemperatureAndTint/)
	@available(macOS 10.7, iOS 5, tvOS 5, *)
	@objc(CIFFTemperatureAndTint) class TemperatureAndTint: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CITemperatureAndTint")
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

		// MARK: - neutral (inputNeutral)

		/// A vector containing the source white point defined by color temperature and tint or chromaticity (x,y).
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNeutral`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 6500.0, y: 6500.0)`
		@objc public var neutral: CGPoint {
			get {
				self.cgPointValue(forKey: "inputNeutral", defaultValue: Self.neutralDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputNeutral")
			}
		}

		/// `neutral` default value
		@objc public static let neutralDefault = CGPoint(x: 6500.0, y: 0.0)

		// MARK: - targetNeutral (inputTargetNeutral)

		/// A vector containing the desired white point defined by color temperature and tint or chromaticity (x,y).
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTargetNeutral`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 6500.0, y: 6500.0)`
		@objc public var targetNeutral: CGPoint {
			get {
				self.cgPointValue(forKey: "inputTargetNeutral", defaultValue: Self.targetNeutralDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTargetNeutral")
			}
		}

		/// `targetNeutral` default value
		@objc public static let targetNeutralDefault = CGPoint(x: 6500.0, y: 0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - neutral: A vector containing the source white point defined by color temperature and tint or chromaticity (x,y).
		///   - targetNeutral: A vector containing the desired white point defined by color temperature and tint or chromaticity (x,y).
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			neutral: CGPoint = TemperatureAndTint.neutralDefault,
			targetNeutral: CGPoint = TemperatureAndTint.targetNeutralDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.neutral = neutral
			self.targetNeutral = targetNeutral
		}
	}
}

@available(macOS 10.7, iOS 5, tvOS 5, *)
public extension CIImage {
	/// Apply the 'Temperature and Tint' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - neutral: A vector containing the source white point defined by color temperature and tint or chromaticity (x,y).
	///   - targetNeutral: A vector containing the desired white point defined by color temperature and tint or chromaticity (x,y).
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Adapt the reference white point for an image.
	///
	/// **Categories**: BuiltIn, ColorAdjustment, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CITemperatureAndTint Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITemperatureAndTint)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CITemperatureAndTint/)
	@inlinable func applyingTemperatureAndTint(
		neutral: CGPoint = CIFF.TemperatureAndTint.neutralDefault,
		targetNeutral: CGPoint = CIFF.TemperatureAndTint.targetNeutralDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.TemperatureAndTint(
			inputImage: self,
			neutral: neutral,
			targetNeutral: targetNeutral
		)?.outputImage ?? CIImage.empty()
	}
}
