//
//  CIPageCurlTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Page Curl
	///
	/// Transitions from one image to another by simulating a curling page, revealing the new image as the page curls.
	///
	/// **Links**
	///
	/// [CIPageCurlTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPageCurlTransition/)
	///
	@objc(CIFilterFactory_CIPageCurlTransition) class CIPageCurlTransition: Core {
		@objc public init?() {
			super.init(name: "CIPageCurlTransition")
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

		// MARK: - inputBacksideImage

		///
		/// The image that appears on the back of the source image, as the page curls to reveal the target image.
		///
		@objc public var inputBacksideImage: CIImage? {
			get {
				return filter.value(forKey: "inputBacksideImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputBacksideImage")
			}
		}

		// MARK: - inputShadingImage

		///
		/// An image that looks like a shaded sphere enclosed in a square image.
		///
		@objc public var inputShadingImage: CIImage? {
			get {
				return filter.value(forKey: "inputShadingImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputShadingImage")
			}
		}

		// MARK: - inputExtent

		///
		/// The extent of the effect.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputExtent")
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

		// MARK: - inputAngle

		///
		/// The angle of the curling page.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		// MARK: - inputRadius

		///
		/// The radius of the curl.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				filter.setValue(newValue, forKey: "inputRadius")
			}
		}
	}
}
