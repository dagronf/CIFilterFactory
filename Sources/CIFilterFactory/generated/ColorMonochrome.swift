//
//  ColorMonochrome.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Monochrome
	///
	/// Remaps colors so they fall within shades of a single color.
	///
	/// **CIFilter Name**
	/// - CIColorMonochrome
	///
	/// **Availability**
	/// - macOS 10.4, iOS 5, tvOS 5
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
	/// - [CIColorMonochrome Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMonochrome)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorMonochrome/)
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFColorMonochrome) class ColorMonochrome: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIColorMonochrome")
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

		// MARK: - color (inputColor)

		/// The monochrome color to apply to the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeOpaqueColor`
		@objc public var color: CIColor? {
			get {
				self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		// MARK: - intensity (inputIntensity)

		/// The intensity of the monochrome effect. A value of 1.0 creates a monochrome image using the supplied color. A value of 0.0 has no effect on the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputIntensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.0`
		@objc public var intensity: Double {
			get {
				self.doubleValue(forKey: "inputIntensity", defaultValue: Self.intensityDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: ColorMonochrome.intensityRange, forKey: "inputIntensity")
			}
		}

		/// `intensity` default value
		@objc public static let intensityDefault: Double = 1.0

		/// `intensity` range definition
		public static let intensityRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - color: The monochrome color to apply to the image.
		///   - intensity: The intensity of the monochrome effect. A value of 1.0 creates a monochrome image using the supplied color. A value of 0.0 has no effect on the image.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			color: CIColor,
			intensity: Double = ColorMonochrome.intensityDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.color = color
			self.intensity = intensity
		}
	}
}

@available(macOS 10.4, iOS 5, tvOS 5, *)
public extension CIImage {
	/// Apply the 'Color Monochrome' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - color: The monochrome color to apply to the image.
	///   - intensity: The intensity of the monochrome effect. A value of 1.0 creates a monochrome image using the supplied color. A value of 0.0 has no effect on the image. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Remaps colors so they fall within shades of a single color.
	///
	/// **Categories**: BuiltIn, ColorEffect, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIColorMonochrome Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMonochrome)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorMonochrome/)
	@inlinable func applyingColorMonochrome(
		color: CIColor,
		intensity: Double = CIFF.ColorMonochrome.intensityDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ColorMonochrome(
			inputImage: self,
			color: color,
			intensity: intensity
		)?.outputImage ?? CIImage.empty()
	}
}
