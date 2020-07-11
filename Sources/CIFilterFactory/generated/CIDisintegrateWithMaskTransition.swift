//
//  CIDisintegrateWithMaskTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Disintegrate With Mask
	///
	/// Transitions from one image to another using the shape defined by a mask.
	///
	/// **Links**
	///
	/// [CIDisintegrateWithMaskTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisintegrateWithMaskTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDisintegrateWithMaskTransition/)
	///
	@objc(CIFilterFactory_CIDisintegrateWithMaskTransition) class CIDisintegrateWithMaskTransition: FilterCommon {
		@objc public init?() {
			super.init(name: "CIDisintegrateWithMaskTransition")
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

		// MARK: - inputMaskImage

		///
		/// An image that defines the shape to use when disintegrating from the source to the target image.
		///
		@objc public var inputMaskImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMaskImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMaskImage")
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

		// MARK: - inputShadowRadius

		///
		/// The radius of the shadow created by the mask.
		///
		///   minValue: 0.0
		///
		let inputShadowRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputShadowRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputShadowRadius_Range), forKey: "inputShadowRadius")
			}
		}

		// MARK: - inputShadowDensity

		///
		/// The density of the shadow created by the mask.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputShadowDensity_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputShadowDensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowDensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputShadowDensity_Range), forKey: "inputShadowDensity")
			}
		}

		// MARK: - inputShadowOffset

		///
		/// The offset of the shadow created by the mask.
		///
		@objc public var inputShadowOffset: CIVector? {
			get {
				return self.filter.value(forKey: "inputShadowOffset") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputShadowOffset")
			}
		}
	}
}
