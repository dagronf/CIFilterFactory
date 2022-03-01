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

@available(macOS 10.4, iOS 6, tvOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Flash
	///
	/// Transitions from one image to another by creating a flash. The flash originates from a point you specify. Small at first, it rapidly expands until the image frame is completely filled with the flash color. As the color fades, the target image begins to appear.
	///
	/// **Links**
	///
	/// - [CIFlashTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFlashTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciflashtransition?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIFlashTransition/)
	///
	@objc(CIFilterFactory_FlashTransition) class FlashTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIFlashTransition")
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

		// MARK: - targetImage (inputTargetImage)

		///
		/// The target image for a transition.
		///
		///   - Attribute key: `inputTargetImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var targetImage: CIImage? {
			get {
				return self.keyedValue("inputTargetImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputTargetImage")
			}
		}

		// MARK: - center (inputCenter)

		///
		/// The x and y position to use as the center of the effect
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

		// MARK: - extent (inputExtent)

		///
		/// The extent of the flash.
		///
		///   - Attribute key: `inputExtent`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypeRectangle`
		///   - Default value: `[0 0 300 300]`
		@objc public var extent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extent_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// extent default value
		@objc public static let extent_default = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0)

		// MARK: - color (inputColor)

		///
		/// The color of the light rays emanating from the flash.
		///
		///   - Attribute key: `inputColor`
		///   - Internal class: `CIColor`
		///   - Type: `CIAttributeTypeColor`
		///   - Default value: `rgba(1 0.8 0.6 1`)
		@objc public var color: CIColor? {
			get {
				return self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		// MARK: - time (inputTime)

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///
		///   - Attribute key: `inputTime`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeTime`
		///   - Default value: `0`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let time_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var time: NSNumber? {
			get {
				return self.keyedValue("inputTime")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: FlashTransition.time_Range), forKey: "inputTime")
			}
		}

		// MARK: - maxStriationRadius (inputMaxStriationRadius)

		///
		/// The radius of the light rays emanating from the flash.
		///
		///   - Attribute key: `inputMaxStriationRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `2.58`
		///   minValue: 0.0
		///
		public static let maxStriationRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var maxStriationRadius: NSNumber? {
			get {
				return self.keyedValue("inputMaxStriationRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: FlashTransition.maxStriationRadius_Range), forKey: "inputMaxStriationRadius")
			}
		}

		// MARK: - striationStrength (inputStriationStrength)

		///
		/// The strength of the light rays emanating from the flash.
		///
		///   - Attribute key: `inputStriationStrength`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.5`
		///   minValue: 0.0
		///
		public static let striationStrength_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var striationStrength: NSNumber? {
			get {
				return self.keyedValue("inputStriationStrength")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: FlashTransition.striationStrength_Range), forKey: "inputStriationStrength")
			}
		}

		// MARK: - striationContrast (inputStriationContrast)

		///
		/// The contrast of the light rays emanating from the flash.
		///
		///   - Attribute key: `inputStriationContrast`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1.375`
		///   minValue: 0.0
		///
		public static let striationContrast_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var striationContrast: NSNumber? {
			get {
				return self.keyedValue("inputStriationContrast")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: FlashTransition.striationContrast_Range), forKey: "inputStriationContrast")
			}
		}

		// MARK: - fadeThreshold (inputFadeThreshold)

		///
		/// The amount of fade between the flash and the target image. The higher the value, the more flash time and the less fade time.
		///
		///   - Attribute key: `inputFadeThreshold`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.85`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let fadeThreshold_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var fadeThreshold: NSNumber? {
			get {
				return self.keyedValue("inputFadeThreshold")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: FlashTransition.fadeThreshold_Range), forKey: "inputFadeThreshold")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			center: CGPoint = FlashTransition.center_default,
			extent: CGRect = FlashTransition.extent_default,
			color: CIColor,
			time: NSNumber = 0,
			maxStriationRadius: NSNumber = 2.58,
			striationStrength: NSNumber = 0.5,
			striationContrast: NSNumber = 1.375,
			fadeThreshold: NSNumber = 0.85
		) {
			self.init()

			self.image = image
			self.targetImage = targetImage
			self.center = center
			self.extent = extent
			self.color = color
			self.time = time
			self.maxStriationRadius = maxStriationRadius
			self.striationStrength = striationStrength
			self.striationContrast = striationContrast
			self.fadeThreshold = fadeThreshold
		}
	}
}
