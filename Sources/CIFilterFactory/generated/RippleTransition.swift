//
//  RippleTransition.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2023 Darren Ford. All rights reserved.
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

@objc public extension CIFF {
	/// Ripple
	///
	/// Transitions from one image to another by creating a circular wave that expands from the center point, revealing the new image in the wake of the wave.
	///
	/// **CIFilter Name**
	/// - CIRippleTransition
	///
	/// **Availability**
	/// - macOS 10.4, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Transition (*CICategoryTransition*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIRippleTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRippleTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIRippleTransition/)
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFRippleTransition) class RippleTransition: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIRippleTransition")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input for the effect.
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

		// MARK: - shadingImage (inputShadingImage)

		/// An image that looks like a shaded sphere enclosed in a square image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadingImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var shadingImage: CIImage? {
			get {
				self.keyedValue("inputShadingImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputShadingImage")
			}
		}

		// MARK: - center (inputCenter)

		/// The center of the effect as x and y pixel coordinates.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var center: CGPoint {
			get {
				self.cgPointValue(forKey: "inputCenter", defaultValue: Self.centerDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// `center` default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - extent (inputExtent)

		/// A rectangle that defines the extent of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputExtent`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeRectangle`
		/// - Default Value: `CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0)`
		@objc public var extent: CGRect {
			get {
				self.cgRectValue(forKey: "inputExtent", defaultValue: Self.extentDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// `extent` default value
		@objc public static let extentDefault = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0)

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
				self.setDoubleValue(newValue, bounds: RippleTransition.timeRange, forKey: "inputTime")
			}
		}

		/// `time` default value
		@objc public static let timeDefault: Double = 0.0

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - width (inputWidth)

		/// The width of the ripple.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `1.0`
		/// - Default Value: `100.0`
		@objc public var width: Double {
			get {
				self.doubleValue(forKey: "inputWidth", defaultValue: Self.widthDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: RippleTransition.widthRange, forKey: "inputWidth")
			}
		}

		/// `width` default value
		@objc public static let widthDefault: Double = 100.0

		/// `width` range definition
		public static let widthRange = PartialRangeFrom<Double>(1.0)

		// MARK: - scale (inputScale)

		/// A value that determines whether the ripple starts as a bulge (higher value) or a dimple (lower value).
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputScale`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `-50.0`
		/// - Default Value: `50.0`
		@objc public var scale: Double {
			get {
				self.doubleValue(forKey: "inputScale", defaultValue: Self.scaleDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: RippleTransition.scaleRange, forKey: "inputScale")
			}
		}

		/// `scale` default value
		@objc public static let scaleDefault: Double = 50.0

		/// `scale` range definition
		public static let scaleRange = PartialRangeFrom<Double>(-50.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - targetImage: The target image for a transition.
		///   - shadingImage: An image that looks like a shaded sphere enclosed in a square image.
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - extent: A rectangle that defines the extent of the effect.
		///   - time: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///   - width: The width of the ripple.
		///   - scale: A value that determines whether the ripple starts as a bulge (higher value) or a dimple (lower value).
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			targetImage: CIImage? = nil,
			shadingImage: CIImage? = nil,
			center: CGPoint = RippleTransition.centerDefault,
			extent: CGRect = RippleTransition.extentDefault,
			time: Double = RippleTransition.timeDefault,
			width: Double = RippleTransition.widthDefault,
			scale: Double = RippleTransition.scaleDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let targetImage = targetImage {
				self.targetImage = targetImage
			}
			if let shadingImage = shadingImage {
				self.shadingImage = shadingImage
			}
			self.center = center
			self.extent = extent
			self.time = time
			self.width = width
			self.scale = scale
		}
	}
}

@available(macOS 10.4, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Ripple' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - targetImage: The target image for a transition.
	///   - shadingImage: An image that looks like a shaded sphere enclosed in a square image.
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - extent: A rectangle that defines the extent of the effect.
	///   - time: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). (0.0...1.0)
	///   - width: The width of the ripple. (1.0...)
	///   - scale: A value that determines whether the ripple starts as a bulge (higher value) or a dimple (lower value). (-50.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Transitions from one image to another by creating a circular wave that expands from the center point, revealing the new image in the wake of the wave.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Transition, Video
	///
	/// **Documentation Links**
	/// - [CIRippleTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRippleTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIRippleTransition/)
	@inlinable func applyingRippleTransition(
		targetImage: CIImage,
		shadingImage: CIImage,
		center: CGPoint = CIFF.RippleTransition.centerDefault,
		extent: CGRect = CIFF.RippleTransition.extentDefault,
		time: Double = CIFF.RippleTransition.timeDefault,
		width: Double = CIFF.RippleTransition.widthDefault,
		scale: Double = CIFF.RippleTransition.scaleDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.RippleTransition(
			inputImage: self,
			targetImage: targetImage,
			shadingImage: shadingImage,
			center: center,
			extent: extent,
			time: time,
			width: width,
			scale: scale
		)?.outputImage ?? CIImage.empty()
	}
}
