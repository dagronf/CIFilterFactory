//
//  HueSaturationValueGradient.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.12, iOS 10, tvOS 10, *)
@objc public extension CIFF {
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
	@available(macOS 10.12, iOS 10, tvOS 10, *)
	@objc(CIFFHueSaturationValueGradient) class HueSaturationValueGradient: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIHueSaturationValueGradient")
		}

		// MARK: - Inputs

		// MARK: - value (inputValue)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputValue`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		@objc public var value: Double {
			get {
				let number = self.filter.value(forKey: "inputValue") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: HueSaturationValueGradient.valueRange)
				self.filter.setValue(number, forKey: "inputValue")
			}
		}

		/// `value` range definition
		public static let valueRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - radius (inputRadius)

		/// The distance from the center of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `300`
		/// - Minimum value: `0.0`
		@objc public var radius: Double {
			get {
				let number = self.filter.value(forKey: "inputRadius") as? NSNumber
				return number?.doubleValue ?? 300
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: HueSaturationValueGradient.radiusRange)
				self.filter.setValue(number, forKey: "inputRadius")
			}
		}

		/// `radius` range definition
		public static let radiusRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - softness (inputSoftness)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSoftness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		@objc public var softness: Double {
			get {
				let number = self.filter.value(forKey: "inputSoftness") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: HueSaturationValueGradient.softnessRange)
				self.filter.setValue(number, forKey: "inputSoftness")
			}
		}

		/// `softness` range definition
		public static let softnessRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - dither (inputDither)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputDither`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		@objc public var dither: Double {
			get {
				let number = self.filter.value(forKey: "inputDither") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: HueSaturationValueGradient.ditherRange)
				self.filter.setValue(number, forKey: "inputDither")
			}
		}

		/// `dither` range definition
		public static let ditherRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - colorSpace (inputColorSpace)

		/// The CGColorSpaceRef that the color wheel should be generated in.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColorSpace`
		/// - Internal class: `NSObject`
		/// - Default value: ` (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)`
		@objc public var colorSpace: NSObject? {
			get {
				return self.keyedValue("inputColorSpace")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColorSpace")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			value: Double = 1,
			radius: Double = 300,
			softness: Double = 1,
			dither: Double = 1,
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