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

public extension CIFilter {
	@available(macOS 10.12, iOS 10, *)
	@inlinable @objc static func HueSaturationValueGradient() -> CIFilterFactory.CIHueSaturationValueGradient? {
		return CIFilterFactory.CIHueSaturationValueGradient()
	}
}

@available(macOS 10.12, iOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// Hue/Saturation/Value Gradient
	///
	/// Generates a color wheel that shows hues and saturations for a specified value.
	///
	/// **Links**
	///
	/// [CIHueSaturationValueGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueSaturationValueGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHueSaturationValueGradient/)
	///
	@objc(CIFilterFactory_CIHueSaturationValueGradient) class CIHueSaturationValueGradient: FilterCore {
		@objc public init?() {
			super.init(name: "CIHueSaturationValueGradient")
		}

		// MARK: - Inputs

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///
		public static let inputValue_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputValue: NSNumber? {
			get {
				return self.keyedValue("inputValue")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIHueSaturationValueGradient.inputValue_Range), forKey: "inputValue")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  300
		///   minValue: 0.0
		///
		public static let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIHueSaturationValueGradient.inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///
		public static let inputSoftness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputSoftness: NSNumber? {
			get {
				return self.keyedValue("inputSoftness")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIHueSaturationValueGradient.inputSoftness_Range), forKey: "inputSoftness")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///
		public static let inputDither_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputDither: NSNumber? {
			get {
				return self.keyedValue("inputDither")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIHueSaturationValueGradient.inputDither_Range), forKey: "inputDither")
			}
		}

		///
		/// The CGColorSpaceRef that the color wheel should be generated in.
		///
		///   Class:    NSObject
		///   Default:  (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)
		@objc public dynamic var inputColorSpace: NSObject? {
			get {
				return self.keyedValue("inputColorSpace")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColorSpace")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputValue: NSNumber = 1,
			inputRadius: NSNumber = 300,
			inputSoftness: NSNumber = 1,
			inputDither: NSNumber = 1,
			inputColorSpace: NSObject
		) {
			self.init()

			self.inputValue = inputValue
			self.inputRadius = inputRadius
			self.inputSoftness = inputSoftness
			self.inputDither = inputDither
			self.inputColorSpace = inputColorSpace
		}
	}
}
