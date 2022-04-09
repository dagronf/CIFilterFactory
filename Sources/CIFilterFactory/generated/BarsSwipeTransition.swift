//
//  BarsSwipeTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.5, iOS 6, tvOS 6, *)
@objc public extension CIFF {
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
	@available(macOS 10.5, iOS 6, tvOS 6, *)
	@objc(CIFFBarsSwipeTransition) class BarsSwipeTransition: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIBarsSwipeTransition")
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

		// MARK: - angle (inputAngle)

		/// The angle (in radians) of the bars.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAngle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `3.141592653589793`
		@objc public var angle: Double {
			get {
				let number = self.filter.value(forKey: "inputAngle") as? NSNumber
				return number?.doubleValue ?? Self.angleDefault
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputAngle")
			}
		}

		/// `angle` default value
		@objc public static let angleDefault: Double = 3.141592653589793

		// MARK: - width (inputWidth)

		/// The width of each bar.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `2.0`
		/// - Default Value: `30.0`
		@objc public var width: Double {
			get {
				let number = self.filter.value(forKey: "inputWidth") as? NSNumber
				return number?.doubleValue ?? Self.widthDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: BarsSwipeTransition.widthRange)
				self.filter.setValue(number, forKey: "inputWidth")
			}
		}

		/// `width` default value
		@objc public static let widthDefault: Double = 30.0

		/// `width` range definition
		public static let widthRange = PartialRangeFrom<Double>(2.0)

		// MARK: - barOffset (inputBarOffset)

		/// The offset of one bar with respect to another
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBarOffset`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `1.0`
		/// - Default Value: `10.0`
		@objc public var barOffset: Double {
			get {
				let number = self.filter.value(forKey: "inputBarOffset") as? NSNumber
				return number?.doubleValue ?? Self.barOffsetDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: BarsSwipeTransition.barOffsetRange)
				self.filter.setValue(number, forKey: "inputBarOffset")
			}
		}

		/// `barOffset` default value
		@objc public static let barOffsetDefault: Double = 10.0

		/// `barOffset` range definition
		public static let barOffsetRange = PartialRangeFrom<Double>(1.0)

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
				let number = NSNumber(value: newValue).clamped(bounds: BarsSwipeTransition.timeRange)
				self.filter.setValue(number, forKey: "inputTime")
			}
		}

		/// `time` default value
		@objc public static let timeDefault: Double = 0.0

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			angle: Double = BarsSwipeTransition.angleDefault,
			width: Double = BarsSwipeTransition.widthDefault,
			barOffset: Double = BarsSwipeTransition.barOffsetDefault,
			time: Double = BarsSwipeTransition.timeDefault
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
