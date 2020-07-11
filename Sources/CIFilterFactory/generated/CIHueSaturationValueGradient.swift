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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

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
	@objc(CIFilterFactory_CIHueSaturationValueGradient) class CIHueSaturationValueGradient: FilterCommon {
		@objc public init?() {
			super.init(name: "CIHueSaturationValueGradient")
		}

		// MARK: - inputValue

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputValue_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputValue: NSNumber? {
			get {
				return self.filter.value(forKey: "inputValue") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputValue_Range), forKey: "inputValue")
			}
		}

		// MARK: - inputRadius

		///
		/// The distance from the center of the effect.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputRadius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - inputSoftness

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputSoftness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSoftness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSoftness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputSoftness_Range), forKey: "inputSoftness")
			}
		}

		// MARK: - inputDither

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputDither_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputDither: NSNumber? {
			get {
				return self.filter.value(forKey: "inputDither") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputDither_Range), forKey: "inputDither")
			}
		}

		// MARK: - inputColorSpace

		///
		/// The CGColorSpaceRef that the color wheel should be generated in.
		///
		@objc public var inputColorSpace: NSObject? {
			get {
				return self.filter.value(forKey: "inputColorSpace") as? NSObject
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColorSpace")
			}
		}
	}
}
