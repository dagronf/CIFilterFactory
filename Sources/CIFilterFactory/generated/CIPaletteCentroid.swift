//
//  CIPaletteCentroid.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.15, iOS 13, tvOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Palette Centroid
	///
	/// Calculate the mean (x,y) image coordinates of a color palette.
	///
	/// **Links**
	///
	/// - [CIPaletteCentroid Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPaletteCentroid)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cipalettecentroid?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPaletteCentroid/)
	///
	@objc(CIFilterFactory_PaletteCentroid) class PaletteCentroid: FilterCore {
		@objc public init?() {
			super.init(name: "CIPaletteCentroid")
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

		// MARK: - paletteImage (inputPaletteImage)

		///
		/// The input color palette, obtained using “CIKMeans“ filter.
		///
		///   - Attribute key: `inputPaletteImage`
		///   - Internal class: `CIImage`
		@objc public var paletteImage: CIImage? {
			get {
				return self.keyedValue("inputPaletteImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputPaletteImage")
			}
		}

		// MARK: - perceptual (inputPerceptual)

		///
		/// Specifies whether the color palette should be applied in a perceptual color space.
		///
		///   - Attribute key: `inputPerceptual`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeBoolean`
		///   - Default value: `0`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let perceptual_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var perceptual: NSNumber? {
			get {
				return self.keyedValue("inputPerceptual")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: PaletteCentroid.perceptual_Range), forKey: "inputPerceptual")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			paletteImage: CIImage,
			perceptual: NSNumber = 0
		) {
			self.init()

			self.image = image
			self.paletteImage = paletteImage
			self.perceptual = perceptual
		}
	}
}
