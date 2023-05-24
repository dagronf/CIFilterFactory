//
//  FlashTransition.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2023 Darren Ford. All rights reserved.
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

@objc public extension CIFF {
	/// Flash
	///
	/// Transitions from one image to another by creating a flash. The flash originates from a point you specify. Small at first, it rapidly expands until the image frame is completely filled with the flash color. As the color fades, the target image begins to appear.
	///
	/// **CIFilter Name**
	/// - CIFlashTransition
	///
	/// **Availability**
	/// - macOS 10.4, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Transition (*CICategoryTransition*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIFlashTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFlashTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIFlashTransition/)
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFFlashTransition) class FlashTransition: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIFlashTransition")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input for the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
			get {
				self.keyedValue("inputImage")
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
				self.keyedValue("inputTargetImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputTargetImage")
			}
		}

		// MARK: - center (inputCenter)

		/// The center of the effect as x and y pixel coordinates.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var center: CGPoint {
			get {
				self.cgPointValue(forKey: "inputCenter", defaultValue: Self.centerDefault)
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
				self.cgRectValue(forKey: "inputExtent", defaultValue: Self.extentDefault)
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
				self.keyedValue("inputColor")
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
				self.doubleValue(forKey: "inputTime", defaultValue: Self.timeDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: FlashTransition.timeRange, forKey: "inputTime")
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
				self.doubleValue(forKey: "inputMaxStriationRadius", defaultValue: Self.maxStriationRadiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: FlashTransition.maxStriationRadiusRange, forKey: "inputMaxStriationRadius")
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
				self.doubleValue(forKey: "inputStriationStrength", defaultValue: Self.striationStrengthDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: FlashTransition.striationStrengthRange, forKey: "inputStriationStrength")
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
				self.doubleValue(forKey: "inputStriationContrast", defaultValue: Self.striationContrastDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: FlashTransition.striationContrastRange, forKey: "inputStriationContrast")
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
				self.doubleValue(forKey: "inputFadeThreshold", defaultValue: Self.fadeThresholdDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: FlashTransition.fadeThresholdRange, forKey: "inputFadeThreshold")
			}
		}

		/// `fadeThreshold` default value
		@objc public static let fadeThresholdDefault: Double = 0.85

		/// `fadeThreshold` range definition
		public static let fadeThresholdRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - targetImage: The target image for a transition.
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - extent: The extent of the flash.
		///   - color: The color of the light rays emanating from the flash.
		///   - time: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///   - maxStriationRadius: The radius of the light rays emanating from the flash.
		///   - striationStrength: The strength of the light rays emanating from the flash.
		///   - striationContrast: The contrast of the light rays emanating from the flash.
		///   - fadeThreshold: The amount of fade between the flash and the target image. The higher the value, the more flash time and the less fade time.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			targetImage: CIImage? = nil,
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
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let targetImage = targetImage {
				self.targetImage = targetImage
			}
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

@available(macOS 10.4, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Flash' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - targetImage: The target image for a transition.
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - extent: The extent of the flash.
	///   - color: The color of the light rays emanating from the flash.
	///   - time: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). (0.0...1.0)
	///   - maxStriationRadius: The radius of the light rays emanating from the flash. (0.0...)
	///   - striationStrength: The strength of the light rays emanating from the flash. (0.0...)
	///   - striationContrast: The contrast of the light rays emanating from the flash. (0.0...)
	///   - fadeThreshold: The amount of fade between the flash and the target image. The higher the value, the more flash time and the less fade time. (0.0...1.0)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Transitions from one image to another by creating a flash. The flash originates from a point you specify. Small at first, it rapidly expands until the image frame is completely filled with the flash color. As the color fades, the target image begins to appear.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Transition, Video
	///
	/// **Documentation Links**
	/// - [CIFlashTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFlashTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIFlashTransition/)
	@inlinable func applyingFlashTransition(
		targetImage: CIImage,
		center: CGPoint = CIFF.FlashTransition.centerDefault,
		extent: CGRect = CIFF.FlashTransition.extentDefault,
		color: CIColor,
		time: Double = CIFF.FlashTransition.timeDefault,
		maxStriationRadius: Double = CIFF.FlashTransition.maxStriationRadiusDefault,
		striationStrength: Double = CIFF.FlashTransition.striationStrengthDefault,
		striationContrast: Double = CIFF.FlashTransition.striationContrastDefault,
		fadeThreshold: Double = CIFF.FlashTransition.fadeThresholdDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.FlashTransition(
			inputImage: self,
			targetImage: targetImage,
			center: center,
			extent: extent,
			color: color,
			time: time,
			maxStriationRadius: maxStriationRadius,
			striationStrength: striationStrength,
			striationContrast: striationContrast,
			fadeThreshold: fadeThreshold
		)?.outputImage ?? CIImage.empty()
	}
}
