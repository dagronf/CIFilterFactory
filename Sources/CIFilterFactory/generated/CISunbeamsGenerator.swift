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
	@objc(CIFilterFactory_CISunbeamsGenerator) class CISunbeamsGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CISunbeamsGenerator")
		}

		// MARK: - Inputs

		///
		/// The x and y position to use as the center of the sunbeam pattern
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [150 150]
		@objc public dynamic var inputCenter: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputCenter")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputCenter")
			}
		}

		///
		/// The color of the sun.
		///
		///   Class:    CIColor
		///   Default:  rgba(1 0.5 0 1)
		@objc public dynamic var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// The radius of the sun.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  40
		///   minValue: 0.0
		///
		static let inputSunRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputSunRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSunRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISunbeamsGenerator.inputSunRadius_Range), forKey: "inputSunRadius")
			}
		}

		///
		/// The radius of the sunbeams.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  2.58
		///   minValue: 0.0
		///
		static let inputMaxStriationRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputMaxStriationRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMaxStriationRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISunbeamsGenerator.inputMaxStriationRadius_Range), forKey: "inputMaxStriationRadius")
			}
		}

		///
		/// The intensity of the sunbeams. Higher values result in more intensity.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.5
		///   minValue: 0.0
		///
		static let inputStriationStrength_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputStriationStrength: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationStrength") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISunbeamsGenerator.inputStriationStrength_Range), forKey: "inputStriationStrength")
			}
		}

		///
		/// The contrast of the sunbeams. Higher values result in more contrast.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1.375
		///   minValue: 0.0
		///
		static let inputStriationContrast_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputStriationContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISunbeamsGenerator.inputStriationContrast_Range), forKey: "inputStriationContrast")
			}
		}

		///
		/// The duration of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputTime_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputTime: NSNumber? {
			get {
				return self.filter.value(forKey: "inputTime") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISunbeamsGenerator.inputTime_Range), forKey: "inputTime")
			}
		}
	}
}
