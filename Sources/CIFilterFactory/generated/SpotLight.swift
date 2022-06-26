//
//  SpotLight.swift  (AUTOMATICALLY GENERATED FILE)
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

@objc public extension CIFF {
	/// Spot Light
	///
	/// Applies a directional spotlight effect to an image.
	///
	/// **CIFilter Name**
	/// - CISpotLight
	///
	/// **Availability**
	/// - macOS 10.4, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryHighDynamicRange
	/// - CICategoryStillImage
	/// - CICategoryStylize
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CISpotLight Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotLight)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cispotlight?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISpotLight/)
	///
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFSpotLight) class SpotLight: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CISpotLight")
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

		// MARK: - lightPosition (inputLightPosition)

		/// The x and y position of the spotlight.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLightPosition`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition3`
		/// - Default Value: `[400 600 150]`
		@objc public var lightPosition: CIPosition3? {
			get {
				self.cgPosition3Value(forKey: "inputLightPosition", defaultValue: Self.lightPositionDefault)
			}
			set {
				self.setKeyedValue(newValue?.ciVector, for: "inputLightPosition")
			}
		}

		/// `lightPosition` default value
		@objc public static let lightPositionDefault = CIPosition3(x: 400.0, y: 600.0, z: 150.0)

		// MARK: - lightPointsAt (inputLightPointsAt)

		/// The x and y position that the spotlight points at.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLightPointsAt`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition3`
		/// - Default Value: `[200 200 0]`
		@objc public var lightPointsAt: CIPosition3? {
			get {
				self.cgPosition3Value(forKey: "inputLightPointsAt", defaultValue: Self.lightPointsAtDefault)
			}
			set {
				self.setKeyedValue(newValue?.ciVector, for: "inputLightPointsAt")
			}
		}

		/// `lightPointsAt` default value
		@objc public static let lightPointsAtDefault = CIPosition3(x: 200.0, y: 200.0, z: 0.0)

		// MARK: - brightness (inputBrightness)

		/// The brightness of the spotlight.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBrightness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `3.0`
		@objc public var brightness: Double {
			get {
				self.doubleValue(forKey: "inputBrightness", defaultValue: Self.brightnessDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: SpotLight.brightnessRange, forKey: "inputBrightness")
			}
		}

		/// `brightness` default value
		@objc public static let brightnessDefault: Double = 3.0

		/// `brightness` range definition
		public static let brightnessRange = PartialRangeFrom<Double>(0.0)

		// MARK: - concentration (inputConcentration)

		/// The spotlight size. The smaller the value, the more tightly focused the light beam.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputConcentration`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.001`
		/// - Default Value: `0.1`
		@objc public var concentration: Double {
			get {
				self.doubleValue(forKey: "inputConcentration", defaultValue: Self.concentrationDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: SpotLight.concentrationRange, forKey: "inputConcentration")
			}
		}

		/// `concentration` default value
		@objc public static let concentrationDefault: Double = 0.1

		/// `concentration` range definition
		public static let concentrationRange = PartialRangeFrom<Double>(0.001)

		// MARK: - color (inputColor)

		/// The color of the spotlight.
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

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			lightPosition: CIPosition3 = SpotLight.lightPositionDefault,
			lightPointsAt: CIPosition3 = SpotLight.lightPointsAtDefault,
			brightness: Double = SpotLight.brightnessDefault,
			concentration: Double = SpotLight.concentrationDefault,
			color: CIColor
		) {
			self.init()
			self.inputImage = inputImage
			self.lightPosition = lightPosition
			self.lightPointsAt = lightPointsAt
			self.brightness = brightness
			self.concentration = concentration
			self.color = color
		}
	}
}
