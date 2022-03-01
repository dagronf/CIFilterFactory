//
//  CIHueSaturationValueGradient.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.12, iOS 10, tvOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// Hue/Saturation/Value Gradient
	///
	/// Generates a color wheel that shows hues and saturations for a specified value.
	///
	/// **Links**
	///
	/// - [CIHueSaturationValueGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueSaturationValueGradient)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cihuesaturationvaluegradient?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIHueSaturationValueGradient/)
	///
	@objc(CIFilterFactory_HueSaturationValueGradient) class HueSaturationValueGradient: FilterCore {
		@objc public init?() {
			super.init(name: "CIHueSaturationValueGradient")
		}

		// MARK: - Inputs

		// MARK: - value (inputValue)

		///
		/// No Description
		///
		///   - Attribute key: `inputValue`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///
		public static let value_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var value: NSNumber? {
			get {
				return self.keyedValue("inputValue")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: HueSaturationValueGradient.value_Range), forKey: "inputValue")
			}
		}

		// MARK: - radius (inputRadius)

		///
		/// The distance from the center of the effect.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `300`
		///   minValue: 0.0
		///
		public static let radius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: HueSaturationValueGradient.radius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - softness (inputSoftness)

		///
		/// No Description
		///
		///   - Attribute key: `inputSoftness`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///
		public static let softness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var softness: NSNumber? {
			get {
				return self.keyedValue("inputSoftness")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: HueSaturationValueGradient.softness_Range), forKey: "inputSoftness")
			}
		}

		// MARK: - dither (inputDither)

		///
		/// No Description
		///
		///   - Attribute key: `inputDither`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///
		public static let dither_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var dither: NSNumber? {
			get {
				return self.keyedValue("inputDither")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: HueSaturationValueGradient.dither_Range), forKey: "inputDither")
			}
		}

		// MARK: - colorSpace (inputColorSpace)

		///
		/// The CGColorSpaceRef that the color wheel should be generated in.
		///
		///   - Attribute key: `inputColorSpace`
		///   - Internal class: `NSObject`
		///   - Default value: ` (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)`
		@objc public var colorSpace: NSObject? {
			get {
				return self.keyedValue("inputColorSpace")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColorSpace")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			value: NSNumber = 1,
			radius: NSNumber = 300,
			softness: NSNumber = 1,
			dither: NSNumber = 1,
			colorSpace: NSObject
		) {
			self.init()

			self.value = value
			self.radius = radius
			self.softness = softness
			self.dither = dither
			self.colorSpace = colorSpace
		}
	}
}
