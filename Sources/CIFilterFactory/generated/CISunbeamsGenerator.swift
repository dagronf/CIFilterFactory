//
//  CISunbeamsGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Sunbeams
	///
	/// Generates a sun effect. You typically use the output of the sunbeams filter as input to a composite filter.
	///
	/// **Links**
	///
	/// [CISunbeamsGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISunbeamsGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISunbeamsGenerator/)
	///
	@objc(CIFilterFactory_CISunbeamsGenerator) class CISunbeamsGenerator: FilterCommon {
		@objc public init?() {
			super.init(name: "CISunbeamsGenerator")
			self.filter.setDefaults()
		}

		// MARK: - inputCenter

		///
		/// The x and y position to use as the center of the sunbeam pattern
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		// MARK: - inputColor

		///
		/// The color of the sun.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		// MARK: - inputSunRadius

		///
		/// The radius of the sun.
		///
		///   minValue: 0.0
		///
		let inputSunRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSunRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSunRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputSunRadius_Range), forKey: "inputSunRadius")
			}
		}

		// MARK: - inputMaxStriationRadius

		///
		/// The radius of the sunbeams.
		///
		///   minValue: 0.0
		///
		let inputMaxStriationRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputMaxStriationRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMaxStriationRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputMaxStriationRadius_Range), forKey: "inputMaxStriationRadius")
			}
		}

		// MARK: - inputStriationStrength

		///
		/// The intensity of the sunbeams. Higher values result in more intensity.
		///
		///   minValue: 0.0
		///
		let inputStriationStrength_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputStriationStrength: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationStrength") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputStriationStrength_Range), forKey: "inputStriationStrength")
			}
		}

		// MARK: - inputStriationContrast

		///
		/// The contrast of the sunbeams. Higher values result in more contrast.
		///
		///   minValue: 0.0
		///
		let inputStriationContrast_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputStriationContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputStriationContrast_Range), forKey: "inputStriationContrast")
			}
		}

		// MARK: - inputTime

		///
		/// The duration of the effect.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputTime_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputTime: NSNumber? {
			get {
				return self.filter.value(forKey: "inputTime") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputTime_Range), forKey: "inputTime")
			}
		}
	}
}
