//
//  CIFlashTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	import UIKit // For access to NSValue.cgAffineTransformValue
#endif

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
	@objc(CIFilterFactory_CIFlashTransition) class CIFlashTransition: Core {
		@objc public init?() {
			super.init(name: "CIFlashTransition")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputTargetImage

		///
		/// The target image for a transition.
		///
		@objc public var inputTargetImage: CIImage? {
			get {
				return filter.value(forKey: "inputTargetImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputTargetImage")
			}
		}

		// MARK: - inputCenter

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		// MARK: - inputExtent

		///
		/// The extent of the flash.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputExtent")
			}
		}

		// MARK: - inputColor

		///
		/// The color of the light rays emanating from the flash.
		///
		@objc public var inputColor: CIColor? {
			get {
				return filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputColor")
			}
		}

		// MARK: - inputTime

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputTime_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputTime: NSNumber? {
			get {
				return filter.value(forKey: "inputTime") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}

		// MARK: - inputMaxStriationRadius

		///
		/// The radius of the light rays emanating from the flash.
		///
		///   minValue: 0.0
		///
		let inputMaxStriationRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputMaxStriationRadius: NSNumber? {
			get {
				return filter.value(forKey: "inputMaxStriationRadius") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputMaxStriationRadius_Range), forKey: "inputMaxStriationRadius")
			}
		}

		// MARK: - inputStriationStrength

		///
		/// The strength of the light rays emanating from the flash.
		///
		///   minValue: 0.0
		///
		let inputStriationStrength_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputStriationStrength: NSNumber? {
			get {
				return filter.value(forKey: "inputStriationStrength") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputStriationStrength_Range), forKey: "inputStriationStrength")
			}
		}

		// MARK: - inputStriationContrast

		///
		/// The contrast of the light rays emanating from the flash.
		///
		///   minValue: 0.0
		///
		let inputStriationContrast_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputStriationContrast: NSNumber? {
			get {
				return filter.value(forKey: "inputStriationContrast") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputStriationContrast_Range), forKey: "inputStriationContrast")
			}
		}

		// MARK: - inputFadeThreshold

		///
		/// The amount of fade between the flash and the target image. The higher the value, the more flash time and the less fade time.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputFadeThreshold_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputFadeThreshold: NSNumber? {
			get {
				return filter.value(forKey: "inputFadeThreshold") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputFadeThreshold_Range), forKey: "inputFadeThreshold")
			}
		}
	}
}
