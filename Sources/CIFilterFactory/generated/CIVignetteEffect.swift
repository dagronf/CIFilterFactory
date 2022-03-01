//
//  CIVignetteEffect.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.9, iOS 7, tvOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Vignette Effect
	///
	/// Applies a vignette shading to the corners of an image.
	///
	/// **Links**
	///
	/// - [CIVignetteEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignetteEffect)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/civignetteeffect?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIVignetteEffect/)
	///
	@objc(CIFilterFactory_VignetteEffect) class VignetteEffect: FilterCore {
		@objc public init?() {
			super.init(name: "CIVignetteEffect")
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

		// MARK: - center (inputCenter)

		///
		/// The center of the effect as x and y coordinates.
		///
		///   - Attribute key: `inputCenter`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[150 150]`
		@objc public var center: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputCenter", defaultValue: Self.center_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// center default value
		@objc public static let center_default = CGPoint(x: 150.0, y: 150.0)

		// MARK: - radius (inputRadius)

		///
		/// The distance from the center of the effect.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `150`
		///   minValue: 0.0
		///
		public static let radius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: VignetteEffect.radius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - intensity (inputIntensity)

		///
		/// The intensity of the effect.
		///
		///   - Attribute key: `inputIntensity`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		public static let intensity_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public var intensity: NSNumber? {
			get {
				return self.keyedValue("inputIntensity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: VignetteEffect.intensity_Range), forKey: "inputIntensity")
			}
		}

		// MARK: - falloff (inputFalloff)

		///
		/// No Description
		///
		///   - Attribute key: `inputFalloff`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.5`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let falloff_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var falloff: NSNumber? {
			get {
				return self.keyedValue("inputFalloff")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: VignetteEffect.falloff_Range), forKey: "inputFalloff")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			center: CGPoint = VignetteEffect.center_default,
			radius: NSNumber = 150,
			intensity: NSNumber = 1,
			falloff: NSNumber = 0.5
		) {
			self.init()

			self.image = image
			self.center = center
			self.radius = radius
			self.intensity = intensity
			self.falloff = falloff
		}
	}
}
