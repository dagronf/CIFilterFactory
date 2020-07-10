//
//  CIPageCurlWithShadowTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

@available(macOS 10.9, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Page Curl With Shadow
	///
	/// Transitions from one image to another by simulating a curling page, revealing the new image as the page curls.
	///
	/// **Links**
	///
	/// [CIPageCurlWithShadowTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlWithShadowTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPageCurlWithShadowTransition/)
	///
	@objc(CIFilterFactory_CIPageCurlWithShadowTransition) class CIPageCurlWithShadowTransition: FilterCommon {
		@objc public init?() {
			super.init(name: "CIPageCurlWithShadowTransition")
			self.filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputTargetImage

		///
		/// The target image for a transition.
		///
		@objc public var inputTargetImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputTargetImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTargetImage")
			}
		}

		// MARK: - inputBacksideImage

		///
		/// The image that appears on the back of the source image, as the page curls to reveal the target image.
		///
		@objc public var inputBacksideImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBacksideImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBacksideImage")
			}
		}

		// MARK: - inputExtent

		///
		/// The extent of the effect.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
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
				return self.filter.value(forKey: "inputTime") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputTime_Range), forKey: "inputTime")
			}
		}

		// MARK: - inputAngle

		///
		/// The angle of the curling page.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		// MARK: - inputRadius

		///
		/// The radius of the curl.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}

		// MARK: - inputShadowSize

		///
		/// The maximum size in pixels of the shadow.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputShadowSize_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputShadowSize: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowSize") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputShadowSize_Range), forKey: "inputShadowSize")
			}
		}

		// MARK: - inputShadowAmount

		///
		/// The strength of the shadow.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputShadowAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputShadowAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputShadowAmount_Range), forKey: "inputShadowAmount")
			}
		}

		// MARK: - inputShadowExtent

		///
		/// The rectagular portion of input image that will cast a shadow.
		///
		@objc public var inputShadowExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputShadowExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputShadowExtent")
			}
		}
	}
}
