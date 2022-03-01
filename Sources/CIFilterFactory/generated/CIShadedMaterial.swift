//
//  CIShadedMaterial.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, tvOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Shaded Material
	///
	/// Produces a shaded image from a height field. The height field is defined to have greater heights with lighter shades, and lesser heights (lower areas) with darker shades. You can combine this filter with the “Height Field From Mask” filter to produce quick shadings of masks, such as text.
	///
	/// **Links**
	///
	/// - [CIShadedMaterial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIShadedMaterial)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cishadedmaterial?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIShadedMaterial/)
	///
	@objc(CIFilterFactory_ShadedMaterial) class ShadedMaterial: FilterCore {
		@objc public init?() {
			super.init(name: "CIShadedMaterial")
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

		// MARK: - shadingImage (inputShadingImage)

		///
		/// The image to use as the height field. The resulting image has greater heights with lighter shades, and lesser heights (lower areas) with darker shades.
		///
		///   - Attribute key: `inputShadingImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var shadingImage: CIImage? {
			get {
				return self.keyedValue("inputShadingImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputShadingImage")
			}
		}

		// MARK: - scale (inputScale)

		///
		/// The scale of the effect. The higher the value, the more dramatic the effect.
		///
		///   - Attribute key: `inputScale`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `10`
		///   minValue: 0.0
		///
		public static let scale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var scale: NSNumber? {
			get {
				return self.keyedValue("inputScale")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: ShadedMaterial.scale_Range), forKey: "inputScale")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			shadingImage: CIImage,
			scale: NSNumber = 10
		) {
			self.init()

			self.image = image
			self.shadingImage = shadingImage
			self.scale = scale
		}
	}
}
