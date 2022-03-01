//
//  CISpotLight.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Spot Light
	///
	/// Applies a directional spotlight effect to an image.
	///
	/// **Links**
	///
	/// - [CISpotLight Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotLight)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cispotlight?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISpotLight/)
	///
	@objc(CIFilterFactory_SpotLight) class SpotLight: FilterCore {
		@objc public init?() {
			super.init(name: "CISpotLight")
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

		// MARK: - lightPosition (inputLightPosition)

		///
		/// The x and y position of the spotlight.
		///
		///   - Attribute key: `inputLightPosition`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition3`
		///   - Default value: `[400 600 150]`
		@objc public var lightPosition: CIVector? {
			get {
				return self.keyedValue("inputLightPosition")
			}
			set {
				self.setKeyedValue(newValue, for: "inputLightPosition")
			}
		}

		// MARK: - lightPointsAt (inputLightPointsAt)

		///
		/// The x and y position that the spotlight points at.
		///
		///   - Attribute key: `inputLightPointsAt`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition3`
		///   - Default value: `[200 200 0]`
		@objc public var lightPointsAt: CIVector? {
			get {
				return self.keyedValue("inputLightPointsAt")
			}
			set {
				self.setKeyedValue(newValue, for: "inputLightPointsAt")
			}
		}

		// MARK: - brightness (inputBrightness)

		///
		/// The brightness of the spotlight.
		///
		///   - Attribute key: `inputBrightness`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `3`
		///   minValue: 0.0
		///
		public static let brightness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var brightness: NSNumber? {
			get {
				return self.keyedValue("inputBrightness")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: SpotLight.brightness_Range), forKey: "inputBrightness")
			}
		}

		// MARK: - concentration (inputConcentration)

		///
		/// The spotlight size. The smaller the value, the more tightly focused the light beam.
		///
		///   - Attribute key: `inputConcentration`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.1`
		@objc public var concentration: NSNumber? {
			get {
				return self.keyedValue("inputConcentration")
			}
			set {
				self.setKeyedValue(newValue, for: "inputConcentration")
			}
		}

		// MARK: - color (inputColor)

		///
		/// The color of the spotlight.
		///
		///   - Attribute key: `inputColor`
		///   - Internal class: `CIColor`
		///   - Type: `CIAttributeTypeOpaqueColor`
		///   - Default value: `rgba(1 1 1 1`)
		@objc public var color: CIColor? {
			get {
				return self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			lightPosition: CIVector = CIVector([400.0, 600.0, 150.0]),
			lightPointsAt: CIVector = CIVector([200.0, 200.0, 0.0]),
			brightness: NSNumber = 3,
			concentration: NSNumber = 0.1,
			color: CIColor
		) {
			self.init()

			self.image = image
			self.lightPosition = lightPosition
			self.lightPointsAt = lightPointsAt
			self.brightness = brightness
			self.concentration = concentration
			self.color = color
		}
	}
}
