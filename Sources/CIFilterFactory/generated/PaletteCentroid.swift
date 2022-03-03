//
//  PaletteCentroid.swift  (AUTOMATICALLY GENERATED FILE)
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

import AVFoundation
import CoreImage
import CoreML
import Foundation

@available(macOS 10.15, iOS 13, tvOS 13, *)
@objc public extension CIFF {
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
	@available(macOS 10.15, iOS 13, tvOS 13, *)
	@objc(CIFFPaletteCentroid) class PaletteCentroid: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIPaletteCentroid")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
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
		@objc public var paletteImage: CIImage? {
			get {
				return self.keyedValue("inputPaletteImage")
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
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var perceptual: Bool {
			get {
				let number = self.filter.value(forKey: "inputPerceptual") as? NSNumber
				return number?.boolValue ?? false
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputPerceptual")
			}
		}

		/// `perceptual` range definition
		public static let perceptualRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			paletteImage: CIImage,
			perceptual: Bool = false
		) {
			self.init()

			self.image = image
			self.paletteImage = paletteImage
			self.perceptual = perceptual
		}
	}
}
