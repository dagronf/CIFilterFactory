//
//  CIStarShineGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Star Shine
	///
	/// Generates a starburst pattern. The output image is typically used as input to another filter
	///
	/// **Links**
	///
	/// [CIStarShineGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStarShineGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIStarShineGenerator/)
	///
	@objc(CIFilterFactory_CIStarShineGenerator) class CIStarShineGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CIStarShineGenerator")
		}

		// MARK: - Inputs

		///
		/// The x and y position to use as the center of the star.
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
		/// The color to use for the outer shell of the circular star.
		///
		///   Class:    CIColor
		///   Default:  rgba(1 0.8 0.6 1)
		@objc public dynamic var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// The radius of the star.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  50
		///   minValue: 0.0
		///
		static let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIStarShineGenerator.inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The size of the cross pattern.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  15
		///   minValue: 0.0
		///
		static let inputCrossScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputCrossScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCrossScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIStarShineGenerator.inputCrossScale_Range), forKey: "inputCrossScale")
			}
		}

		///
		/// The angle of the cross pattern.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  0.6
		@objc public dynamic var inputCrossAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCrossAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCrossAngle")
			}
		}

		///
		/// The opacity of the cross pattern.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  -2
		///   minValue: -8.0
		///
		static let inputCrossOpacity_Range: PartialRangeFrom<Float> = Float(-8.0)...
		@objc public dynamic var inputCrossOpacity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCrossOpacity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIStarShineGenerator.inputCrossOpacity_Range), forKey: "inputCrossOpacity")
			}
		}

		///
		/// The width of the cross pattern.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  2.5
		///   minValue: 0.0
		///
		static let inputCrossWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputCrossWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCrossWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIStarShineGenerator.inputCrossWidth_Range), forKey: "inputCrossWidth")
			}
		}

		///
		/// The length of the cross spikes.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  -2
		///   minValue: -8.0
		///
		static let inputEpsilon_Range: PartialRangeFrom<Float> = Float(-8.0)...
		@objc public dynamic var inputEpsilon: NSNumber? {
			get {
				return self.filter.value(forKey: "inputEpsilon") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIStarShineGenerator.inputEpsilon_Range), forKey: "inputEpsilon")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputCenter: CIFilterFactory.Point = CIFilterFactory.Point(x: 150.0, y: 150.0),
			inputColor: CIColor,
			inputRadius: NSNumber = 50,
			inputCrossScale: NSNumber = 15,
			inputCrossAngle: NSNumber = 0.6,
			inputCrossOpacity: NSNumber = -2,
			inputCrossWidth: NSNumber = 2.5,
			inputEpsilon: NSNumber = -2
		) {
			self.init()

			self.inputCenter = inputCenter
			self.inputColor = inputColor
			self.inputRadius = inputRadius
			self.inputCrossScale = inputCrossScale
			self.inputCrossAngle = inputCrossAngle
			self.inputCrossOpacity = inputCrossOpacity
			self.inputCrossWidth = inputCrossWidth
			self.inputEpsilon = inputEpsilon
		}
	}
}
