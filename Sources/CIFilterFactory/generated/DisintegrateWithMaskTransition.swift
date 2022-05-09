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
	/// **Availability**
	/// - macOS 10.4, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryStillImage
	/// - CICategoryTransition
	/// - CICategoryVideo
	///
	/// **Documentation Links**
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

		// MARK: - inputImage (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
			get {
				self.keyedValue("inputImage")
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
				self.keyedValue("inputTargetImage")
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
				self.keyedValue("inputMaskImage")
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
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.0`
		@objc public var time: Double {
			get {
				self.doubleValue(forKey: "inputTime", defaultValue: Self.timeDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DisintegrateWithMaskTransition.timeRange, forKey: "inputTime")
			}
		}

		/// `time` default value
		@objc public static let timeDefault: Double = 0.0

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - shadowRadius (inputShadowRadius)

		/// The radius of the shadow created by the mask.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `8.0`
		@objc public var shadowRadius: Double {
			get {
				self.doubleValue(forKey: "inputShadowRadius", defaultValue: Self.shadowRadiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DisintegrateWithMaskTransition.shadowRadiusRange, forKey: "inputShadowRadius")
			}
		}

		/// `shadowRadius` default value
		@objc public static let shadowRadiusDefault: Double = 8.0

		/// `shadowRadius` range definition
		public static let shadowRadiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - shadowDensity (inputShadowDensity)

		/// The density of the shadow created by the mask.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowDensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.65`
		@objc public var shadowDensity: Double {
			get {
				self.doubleValue(forKey: "inputShadowDensity", defaultValue: Self.shadowDensityDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DisintegrateWithMaskTransition.shadowDensityRange, forKey: "inputShadowDensity")
			}
		}

		/// `shadowDensity` default value
		@objc public static let shadowDensityDefault: Double = 0.65

		/// `shadowDensity` range definition
		public static let shadowDensityRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - shadowOffset (inputShadowOffset)

		/// The offset of the shadow created by the mask.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowOffset`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 0.0, y: 0.0)`
		@objc public var shadowOffset: CGPoint {
			get {
				self.cgPointValue(forKey: "inputShadowOffset", defaultValue: Self.shadowOffsetDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputShadowOffset")
			}
		}

		/// `shadowOffset` default value
		@objc public static let shadowOffsetDefault = CGPoint(x: 0.0, y: -10.0)

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			targetImage: CIImage,
			maskImage: CIImage,
			time: Double = DisintegrateWithMaskTransition.timeDefault,
			shadowRadius: Double = DisintegrateWithMaskTransition.shadowRadiusDefault,
			shadowDensity: Double = DisintegrateWithMaskTransition.shadowDensityDefault,
			shadowOffset: CGPoint = DisintegrateWithMaskTransition.shadowOffsetDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.targetImage = targetImage
			self.maskImage = maskImage
			self.time = time
			self.shadowRadius = shadowRadius
			self.shadowDensity = shadowDensity
			self.shadowOffset = shadowOffset
		}
	}
}
