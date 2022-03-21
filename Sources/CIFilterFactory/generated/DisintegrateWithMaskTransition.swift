//
//  DisintegrateWithMaskTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, tvOS 6, *)
@objc public extension CIFF {
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
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFDisintegrateWithMaskTransition) class DisintegrateWithMaskTransition: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIDisintegrateWithMaskTransition")
		}

		// MARK: - Inputs

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

		// MARK: - maskImage (inputMaskImage)

		/// An image that defines the shape to use when disintegrating from the source to the target image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaskImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var maskImage: CIImage? {
			get {
				return self.keyedValue("inputMaskImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMaskImage")
			}
		}

		// MARK: - time (inputTime)

		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTime`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeTime`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var time: Double {
			get {
				let number = self.filter.value(forKey: "inputTime") as? NSNumber
				return number?.doubleValue ?? 0
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: DisintegrateWithMaskTransition.timeRange)
				self.filter.setValue(number, forKey: "inputTime")
			}
		}

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - shadowRadius (inputShadowRadius)

		/// The radius of the shadow created by the mask.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `8`
		/// - Minimum value: `0.0`
		@objc public var shadowRadius: Double {
			get {
				let number = self.filter.value(forKey: "inputShadowRadius") as? NSNumber
				return number?.doubleValue ?? 8
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: DisintegrateWithMaskTransition.shadowRadiusRange)
				self.filter.setValue(number, forKey: "inputShadowRadius")
			}
		}

		/// `shadowRadius` range definition
		public static let shadowRadiusRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - shadowDensity (inputShadowDensity)

		/// The density of the shadow created by the mask.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowDensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.65`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var shadowDensity: Double {
			get {
				let number = self.filter.value(forKey: "inputShadowDensity") as? NSNumber
				return number?.doubleValue ?? 0.65
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: DisintegrateWithMaskTransition.shadowDensityRange)
				self.filter.setValue(number, forKey: "inputShadowDensity")
			}
		}

		/// `shadowDensity` range definition
		public static let shadowDensityRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - shadowOffset (inputShadowOffset)

		/// The offset of the shadow created by the mask.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowOffset`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default value: `[0 -10]`
		@objc public var shadowOffset: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputShadowOffset", defaultValue: Self.shadowOffsetDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputShadowOffset")
			}
		}

		/// shadowOffset default value
		@objc public static let shadowOffsetDefault = CGPoint(x: 0.0, y: -10.0)

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			maskImage: CIImage,
			time: Double = 0,
			shadowRadius: Double = 8,
			shadowDensity: Double = 0.65,
			shadowOffset: CGPoint = DisintegrateWithMaskTransition.shadowOffsetDefault
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
