//
//  PaletteCentroid.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Palette Centroid
	///
	/// Calculate the mean (x,y) image coordinates of a color palette.
	///
	/// **CIFilter Name**
	/// - CIPaletteCentroid
	///
	/// **Availability**
	/// - macOS 10.15, iOS 13, tvOS 13
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorEffect (*CICategoryColorEffect*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIPaletteCentroid Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPaletteCentroid)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPaletteCentroid/)
	@available(macOS 10.15, iOS 13, tvOS 13, *)
	@objc(CIFFPaletteCentroid) class PaletteCentroid: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIPaletteCentroid")
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

		// MARK: - paletteImage (inputPaletteImage)

		/// The input color palette, obtained using “CIKMeans“ filter.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPaletteImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var paletteImage: CIImage? {
			get {
				self.keyedValue("inputPaletteImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputPaletteImage")
			}
		}

		// MARK: - perceptual (inputPerceptual)

		/// Specifies whether the color palette should be applied in a perceptual color space.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPerceptual`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var perceptual: Bool {
			get {
				self.boolValue(forKey: "inputPerceptual", defaultValue: Self.perceptualDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputPerceptual")
			}
		}

		/// `perceptual` default value
		@objc public static let perceptualDefault: Bool = false

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - paletteImage: The input color palette, obtained using “CIKMeans“ filter.
		///   - perceptual: Specifies whether the color palette should be applied in a perceptual color space.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			paletteImage: CIImage? = nil,
			perceptual: Bool = PaletteCentroid.perceptualDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let paletteImage = paletteImage {
				self.paletteImage = paletteImage
			}
			self.perceptual = perceptual
		}
	}
}

@available(macOS 10.15, iOS 13, tvOS 13, *)
public extension CIImage {
	/// Apply the 'Palette Centroid' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - paletteImage: The input color palette, obtained using “CIKMeans“ filter.
	///   - perceptual: Specifies whether the color palette should be applied in a perceptual color space.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Calculate the mean (x,y) image coordinates of a color palette.
	///
	/// **Categories**: BuiltIn, ColorEffect, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIPaletteCentroid Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPaletteCentroid)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPaletteCentroid/)
	@inlinable func applyingPaletteCentroid(
		paletteImage: CIImage,
		perceptual: Bool = CIFF.PaletteCentroid.perceptualDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.PaletteCentroid(
			inputImage: self,
			paletteImage: paletteImage,
			perceptual: perceptual
		)?.outputImage ?? CIImage.empty()
	}
}
