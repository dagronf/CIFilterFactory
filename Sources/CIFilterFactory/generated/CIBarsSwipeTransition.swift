//
//  CIBarsSwipeTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Bars Swipe Transition
	///
	/// Transitions from one image to another by swiping rectangular portions of the foreground image to disclose the target image.
	///
	/// **Links**
	///
	/// [CIBarsSwipeTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBarsSwipeTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBarsSwipeTransition/)
	///
	@objc(CIFilterFactory_CIBarsSwipeTransition) class CIBarsSwipeTransition: Core {
		@objc public init?() {
			super.init(name: "CIBarsSwipeTransition")
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

		// MARK: - inputAngle

		///
		/// The angle (in radians) of the bars.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		// MARK: - inputWidth

		///
		/// The width of each bar.
		///
		///   minValue: 2.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(2.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		// MARK: - inputBarOffset

		///
		/// The offset of one bar with respect to another
		///
		///   minValue: 1.0
		///
		let inputBarOffset_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputBarOffset: NSNumber? {
			get {
				return filter.value(forKey: "inputBarOffset") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputBarOffset_Range), forKey: "inputBarOffset")
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
	}
}
