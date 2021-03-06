//
//  CIColorMonochrome.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.4, iOS 5, *)
	@inlinable @objc static func ColorMonochrome() -> CIFilterFactory.CIColorMonochrome? {
		return CIFilterFactory.CIColorMonochrome()
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Monochrome
	///
	/// Remaps colors so they fall within shades of a single color.
	///
	/// **Links**
	///
	/// [CIColorMonochrome Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMonochrome)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorMonochrome/)
	///
	@objc(CIFilterFactory_CIColorMonochrome) class CIColorMonochrome: FilterCore {
		@objc public init?() {
			super.init(name: "CIColorMonochrome")
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
		/// The monochrome color to apply to the image.
		///
		///   Class:    CIColor
		///   Type:     CIAttributeTypeOpaqueColor
		///   Default:  rgba(0.6 0.45 0.3 1)
		@objc public dynamic var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// The intensity of the monochrome effect. A value of 1.0 creates a monochrome image using the supplied color. A value of 0.0 has no effect on the image.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///
		public static let inputIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIColorMonochrome.inputIntensity_Range), forKey: "inputIntensity")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputColor: CIColor,
			inputIntensity: NSNumber = 1
		) {
			self.init()

			self.inputImage = inputImage
			self.inputColor = inputColor
			self.inputIntensity = inputIntensity
		}
	}
}
