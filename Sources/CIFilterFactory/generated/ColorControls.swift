//
//  ColorControls.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 5, tvOS 5, *)
@objc public extension CIFF {
	///
	/// Color Controls
	///
	/// Adjusts saturation, brightness, and contrast values.
	///
	/// **Links**
	///
	/// - [CIColorControls Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorControls)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolorcontrols?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorControls/)
	///
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFColorControls) class ColorControls: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIColorControls")
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

		// MARK: - saturation (inputSaturation)

		/// The amount of saturation to apply. The larger the value, the more saturated the result.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSaturation`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		@objc public var saturation: NSNumber? {
			get {
				return self.keyedValue("inputSaturation")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: ColorControls.saturationRange), forKey: "inputSaturation")
			}
		}

		/// `saturation` range definition
		public static let saturationRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - brightness (inputBrightness)

		/// The amount of brightness to apply. The larger the value, the brighter the result.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBrightness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0`
		/// - Minimum value: `-1.0`
		@objc public var brightness: NSNumber? {
			get {
				return self.keyedValue("inputBrightness")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: ColorControls.brightnessRange), forKey: "inputBrightness")
			}
		}

		/// `brightness` range definition
		public static let brightnessRange: PartialRangeFrom<Float> = Float(-1.0)...

		// MARK: - contrast (inputContrast)

		/// The amount of contrast to apply. The larger the value, the more contrast in the resulting image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputContrast`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		@objc public var contrast: NSNumber? {
			get {
				return self.keyedValue("inputContrast")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: ColorControls.contrastRange), forKey: "inputContrast")
			}
		}

		/// `contrast` range definition
		public static let contrastRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			saturation: NSNumber = 1,
			brightness: NSNumber = 0,
			contrast: NSNumber = 1
		) {
			self.init()

			self.image = image
			self.saturation = saturation
			self.brightness = brightness
			self.contrast = contrast
		}
	}
}
