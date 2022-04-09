//
//  FlashTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, tvOS 6, *)
@objc public extension CIFF {
	///
	/// Flash
	///
	/// Transitions from one image to another by creating a flash. The flash originates from a point you specify. Small at first, it rapidly expands until the image frame is completely filled with the flash color. As the color fades, the target image begins to appear.
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryStillImage
	/// - CICategoryTransition
	/// - CICategoryVideo
	///
	/// **Links**
	/// - [CIFlashTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFlashTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciflashtransition?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIFlashTransition/)
	///
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFFlashTransition) class FlashTransition: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIFlashTransition")
		}

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - targetImage (inputTargetImage)

		/// The target image for a transition.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTargetImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var targetImage: CIImage? {
			get {
				return self.keyedValue("inputTargetImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputTargetImage")
			}
		}

		// MARK: - center (inputCenter)

		/// The x and y position to use as the center of the effect
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var center: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputCenter", defaultValue: Self.centerDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// `center` default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - extent (inputExtent)

		/// The extent of the flash.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputExtent`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeRectangle`
		/// - Default Value: `CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0)`
		@objc public var extent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extentDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// `extent` default value
		@objc public static let extentDefault = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0)

		// MARK: - color (inputColor)

		/// The color of the light rays emanating from the flash.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var color: CIColor? {
			get {
				return self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		// MARK: - time (inputTime)

		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTime`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeTime`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.0`
		@objc public var time: Double {
			get {
				let number = self.filter.value(forKey: "inputTime") as? NSNumber
				return number?.doubleValue ?? Self.timeDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: FlashTransition.timeRange)
				self.filter.setValue(number, forKey: "inputTime")
			}
		}

		/// `time` default value
		@objc public static let timeDefault: Double = 0.0

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - maxStriationRadius (inputMaxStriationRadius)

		/// The radius of the light rays emanating from the flash.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaxStriationRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `2.58`
		@objc public var maxStriationRadius: Double {
			get {
				let number = self.filter.value(forKey: "inputMaxStriationRadius") as? NSNumber
				return number?.doubleValue ?? Self.maxStriationRadiusDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: FlashTransition.maxStriationRadiusRange)
				self.filter.setValue(number, forKey: "inputMaxStriationRadius")
			}
		}

		/// `maxStriationRadius` default value
		@objc public static let maxStriationRadiusDefault: Double = 2.58

		/// `maxStriationRadius` range definition
		public static let maxStriationRadiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - striationStrength (inputStriationStrength)

		/// The strength of the light rays emanating from the flash.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputStriationStrength`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.5`
		@objc public var striationStrength: Double {
			get {
				let number = self.filter.value(forKey: "inputStriationStrength") as? NSNumber
				return number?.doubleValue ?? Self.striationStrengthDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: FlashTransition.striationStrengthRange)
				self.filter.setValue(number, forKey: "inputStriationStrength")
			}
		}

		/// `striationStrength` default value
		@objc public static let striationStrengthDefault: Double = 0.5

		/// `striationStrength` range definition
		public static let striationStrengthRange = PartialRangeFrom<Double>(0.0)

		// MARK: - striationContrast (inputStriationContrast)

		/// The contrast of the light rays emanating from the flash.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputStriationContrast`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.375`
		@objc public var striationContrast: Double {
			get {
				let number = self.filter.value(forKey: "inputStriationContrast") as? NSNumber
				return number?.doubleValue ?? Self.striationContrastDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: FlashTransition.striationContrastRange)
				self.filter.setValue(number, forKey: "inputStriationContrast")
			}
		}

		/// `striationContrast` default value
		@objc public static let striationContrastDefault: Double = 1.375

		/// `striationContrast` range definition
		public static let striationContrastRange = PartialRangeFrom<Double>(0.0)

		// MARK: - fadeThreshold (inputFadeThreshold)

		/// The amount of fade between the flash and the target image. The higher the value, the more flash time and the less fade time.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFadeThreshold`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.85`
		@objc public var fadeThreshold: Double {
			get {
				let number = self.filter.value(forKey: "inputFadeThreshold") as? NSNumber
				return number?.doubleValue ?? Self.fadeThresholdDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: FlashTransition.fadeThresholdRange)
				self.filter.setValue(number, forKey: "inputFadeThreshold")
			}
		}

		/// `fadeThreshold` default value
		@objc public static let fadeThresholdDefault: Double = 0.85

		/// `fadeThreshold` range definition
		public static let fadeThresholdRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			center: CGPoint = FlashTransition.centerDefault,
			extent: CGRect = FlashTransition.extentDefault,
			color: CIColor,
			time: Double = FlashTransition.timeDefault,
			maxStriationRadius: Double = FlashTransition.maxStriationRadiusDefault,
			striationStrength: Double = FlashTransition.striationStrengthDefault,
			striationContrast: Double = FlashTransition.striationContrastDefault,
			fadeThreshold: Double = FlashTransition.fadeThresholdDefault
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
