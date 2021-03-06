//
//  CIPalettize.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.15, iOS 13, *)
	@inlinable @objc static func Palettize() -> CIFilterFactory.CIPalettize? {
		return CIFilterFactory.CIPalettize()
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Palettize
	///
	/// Paint an image from a color palette obtained using “CIKMeans“.
	///
	/// **Links**
	///
	/// [CIPalettize Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPalettize)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPalettize/)
	///
	@objc(CIFilterFactory_CIPalettize) class CIPalettize: FilterCore {
		@objc public init?() {
			super.init(name: "CIPalettize")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The input color palette, obtained using “CIKMeans“ filter.
		///
		///   Class:    CIImage
		@objc public dynamic var inputPaletteImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputPaletteImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPaletteImage")
			}
		}

		///
		/// Specifies whether the color palette should be applied in a perceptual color space.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeBoolean
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputPerceptual_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputPerceptual: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPerceptual") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIPalettize.inputPerceptual_Range), forKey: "inputPerceptual")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputPaletteImage: CIImage,
			inputPerceptual: NSNumber = 0
		) {
			self.init()

			self.inputImage = inputImage
			self.inputPaletteImage = inputPaletteImage
			self.inputPerceptual = inputPerceptual
		}
	}
}
