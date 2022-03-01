//
//  CIBarsSwipeTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.5, iOS 6, tvOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Bars Swipe Transition
	///
	/// Transitions from one image to another by swiping rectangular portions of the foreground image to disclose the target image.
	///
	/// **Links**
	///
	/// - [CIBarsSwipeTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBarsSwipeTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cibarsswipetransition?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBarsSwipeTransition/)
	///
	@objc(CIFilterFactory_BarsSwipeTransition) class BarsSwipeTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIBarsSwipeTransition")
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

		// MARK: - angle (inputAngle)

		///
		/// The angle (in radians) of the bars.
		///
		///   - Attribute key: `inputAngle`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `3.141592653589793`
		@objc public var angle: NSNumber? {
			get {
				return self.keyedValue("inputAngle")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAngle")
			}
		}

		// MARK: - width (inputWidth)

		///
		/// The width of each bar.
		///
		///   - Attribute key: `inputWidth`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `30`
		///   minValue: 2.0
		///
		public static let width_Range: PartialRangeFrom<Float> = Float(2.0)...
		@objc public var width: NSNumber? {
			get {
				return self.keyedValue("inputWidth")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: BarsSwipeTransition.width_Range), forKey: "inputWidth")
			}
		}

		// MARK: - barOffset (inputBarOffset)

		///
		/// The offset of one bar with respect to another
		///
		///   - Attribute key: `inputBarOffset`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `10`
		///   minValue: 1.0
		///
		public static let barOffset_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var barOffset: NSNumber? {
			get {
				return self.keyedValue("inputBarOffset")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: BarsSwipeTransition.barOffset_Range), forKey: "inputBarOffset")
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
				self.filter.setValue(newValue?.clamped(bounds: BarsSwipeTransition.time_Range), forKey: "inputTime")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			angle: NSNumber = 3.141592653589793,
			width: NSNumber = 30,
			barOffset: NSNumber = 10,
			time: NSNumber = 0
		) {
			self.init()

			self.image = image
			self.targetImage = targetImage
			self.angle = angle
			self.width = width
			self.barOffset = barOffset
			self.time = time
		}
	}
}
