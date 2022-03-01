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

@available(macOS 10.4, iOS 6, tvOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Disintegrate With Mask
	///
	/// Transitions from one image to another using the shape defined by a mask.
	///
	/// **Links**
	///
	/// - [CIDisintegrateWithMaskTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisintegrateWithMaskTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cidisintegratewithmasktransition?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDisintegrateWithMaskTransition/)
	///
	@objc(CIFilterFactory_DisintegrateWithMaskTransition) class DisintegrateWithMaskTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIDisintegrateWithMaskTransition")
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

		// MARK: - maskImage (inputMaskImage)

		///
		/// An image that defines the shape to use when disintegrating from the source to the target image.
		///
		///   - Attribute key: `inputMaskImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var maskImage: CIImage? {
			get {
				return self.keyedValue("inputMaskImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMaskImage")
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
				self.filter.setValue(newValue?.clamped(bounds: DisintegrateWithMaskTransition.time_Range), forKey: "inputTime")
			}
		}

		// MARK: - shadowRadius (inputShadowRadius)

		///
		/// The radius of the shadow created by the mask.
		///
		///   - Attribute key: `inputShadowRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `8`
		///   minValue: 0.0
		///
		public static let shadowRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var shadowRadius: NSNumber? {
			get {
				return self.keyedValue("inputShadowRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DisintegrateWithMaskTransition.shadowRadius_Range), forKey: "inputShadowRadius")
			}
		}

		// MARK: - shadowDensity (inputShadowDensity)

		///
		/// The density of the shadow created by the mask.
		///
		///   - Attribute key: `inputShadowDensity`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.65`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let shadowDensity_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var shadowDensity: NSNumber? {
			get {
				return self.keyedValue("inputShadowDensity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DisintegrateWithMaskTransition.shadowDensity_Range), forKey: "inputShadowDensity")
			}
		}

		// MARK: - shadowOffset (inputShadowOffset)

		///
		/// The offset of the shadow created by the mask.
		///
		///   - Attribute key: `inputShadowOffset`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypeOffset`
		///   - Default value: `[0 -10]`
		@objc public var shadowOffset: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputShadowOffset", defaultValue: Self.shadowOffset_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputShadowOffset")
			}
		}

		/// shadowOffset default value
		@objc public static let shadowOffset_default = CGPoint(x: 0.0, y: -10.0)

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			maskImage: CIImage,
			time: NSNumber = 0,
			shadowRadius: NSNumber = 8,
			shadowDensity: NSNumber = 0.65,
			shadowOffset: CGPoint = DisintegrateWithMaskTransition.shadowOffset_default
		) {
			self.init()

			self.image = image
			self.targetImage = targetImage
			self.maskImage = maskImage
			self.time = time
			self.shadowRadius = shadowRadius
			self.shadowDensity = shadowDensity
			self.shadowOffset = shadowOffset
		}
	}
}
