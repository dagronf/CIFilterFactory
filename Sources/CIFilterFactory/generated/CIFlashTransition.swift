//
//  CIFlashTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.4, iOS 6, *)
	@inlinable @objc static func FlashTransition() -> CIFilterFactory.CIFlashTransition? {
		return CIFilterFactory.CIFlashTransition()
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Flash
	///
	/// Transitions from one image to another by creating a flash. The flash originates from a point you specify. Small at first, it rapidly expands until the image frame is completely filled with the flash color. As the color fades, the target image begins to appear.
	///
	/// **Links**
	///
	/// [CIFlashTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFlashTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIFlashTransition/)
	///
	@objc(CIFilterFactory_CIFlashTransition) class CIFlashTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIFlashTransition")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The target image for a transition.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputTargetImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputTargetImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTargetImage")
			}
		}

		///
		/// The x and y position to use as the center of the effect
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
		/// The extent of the flash.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeRectangle
		///   Default:  [0 0 300 300]
		@objc public dynamic var inputExtent: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputExtent")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputExtent")
			}
		}

		///
		/// The color of the light rays emanating from the flash.
		///
		///   Class:    CIColor
		///   Type:     CIAttributeTypeColor
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
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeTime
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputTime_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputTime: NSNumber? {
			get {
				return self.filter.value(forKey: "inputTime") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIFlashTransition.inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The radius of the light rays emanating from the flash.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  2.58
		///   minValue: 0.0
		///
		public static let inputMaxStriationRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputMaxStriationRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMaxStriationRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIFlashTransition.inputMaxStriationRadius_Range), forKey: "inputMaxStriationRadius")
			}
		}

		///
		/// The strength of the light rays emanating from the flash.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.5
		///   minValue: 0.0
		///
		public static let inputStriationStrength_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputStriationStrength: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationStrength") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIFlashTransition.inputStriationStrength_Range), forKey: "inputStriationStrength")
			}
		}

		///
		/// The contrast of the light rays emanating from the flash.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1.375
		///   minValue: 0.0
		///
		public static let inputStriationContrast_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputStriationContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIFlashTransition.inputStriationContrast_Range), forKey: "inputStriationContrast")
			}
		}

		///
		/// The amount of fade between the flash and the target image. The higher the value, the more flash time and the less fade time.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.85
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputFadeThreshold_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputFadeThreshold: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFadeThreshold") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIFlashTransition.inputFadeThreshold_Range), forKey: "inputFadeThreshold")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputTargetImage: CIImage,
			inputCenter: CIFilterFactory.Point = CIFilterFactory.Point(x: 150.0, y: 150.0),
			inputExtent: CIFilterFactory.Rect = CIFilterFactory.Rect(x: 0.0, y: 0.0, width: 300.0, height: 300.0),
			inputColor: CIColor,
			inputTime: NSNumber = 0,
			inputMaxStriationRadius: NSNumber = 2.58,
			inputStriationStrength: NSNumber = 0.5,
			inputStriationContrast: NSNumber = 1.375,
			inputFadeThreshold: NSNumber = 0.85
		) {
			self.init()

			self.inputImage = inputImage
			self.inputTargetImage = inputTargetImage
			self.inputCenter = inputCenter
			self.inputExtent = inputExtent
			self.inputColor = inputColor
			self.inputTime = inputTime
			self.inputMaxStriationRadius = inputMaxStriationRadius
			self.inputStriationStrength = inputStriationStrength
			self.inputStriationContrast = inputStriationContrast
			self.inputFadeThreshold = inputFadeThreshold
		}
	}
}
