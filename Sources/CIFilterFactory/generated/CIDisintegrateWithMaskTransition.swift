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

public extension CIFilter {
	@available(macOS 10.4, iOS 6, *)
	@inlinable @objc static func DisintegrateWithMaskTransition() -> CIFilterFactory.CIDisintegrateWithMaskTransition? {
		return CIFilterFactory.CIDisintegrateWithMaskTransition()
	}
}

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
	@objc(CIFilterFactory_CIDisintegrateWithMaskTransition) class CIDisintegrateWithMaskTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIDisintegrateWithMaskTransition")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The target image for a transition.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputTargetImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputTargetImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTargetImage")
			}
		}

		///
		/// An image that defines the shape to use when disintegrating from the source to the target image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputMaskImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMaskImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMaskImage")
			}
		}

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeTime
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputTime_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputTime: NSNumber? {
			get {
				return self.filter.value(forKey: "inputTime") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDisintegrateWithMaskTransition.inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The radius of the shadow created by the mask.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  8
		///   minValue: 0.0
		///
		public static let inputShadowRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputShadowRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDisintegrateWithMaskTransition.inputShadowRadius_Range), forKey: "inputShadowRadius")
			}
		}

		///
		/// The density of the shadow created by the mask.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.65
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputShadowDensity_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputShadowDensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowDensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDisintegrateWithMaskTransition.inputShadowDensity_Range), forKey: "inputShadowDensity")
			}
		}

		///
		/// The offset of the shadow created by the mask.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeOffset
		///   Default:  [0 -10]
		@objc public dynamic var inputShadowOffset: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputShadowOffset")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputShadowOffset")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputTargetImage: CIImage,
			inputMaskImage: CIImage,
			inputTime: NSNumber = 0,
			inputShadowRadius: NSNumber = 8,
			inputShadowDensity: NSNumber = 0.65,
			inputShadowOffset: CIFilterFactory.Point = CIFilterFactory.Point(x: 0.0, y: -10.0)
		) {
			self.init()

			self.inputImage = inputImage
			self.inputTargetImage = inputTargetImage
			self.inputMaskImage = inputMaskImage
			self.inputTime = inputTime
			self.inputShadowRadius = inputShadowRadius
			self.inputShadowDensity = inputShadowDensity
			self.inputShadowOffset = inputShadowOffset
		}
	}
}
