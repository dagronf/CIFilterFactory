//
//  SwipeTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Swipe
	///
	/// Transitions from one image to another by simulating a swiping action.
	///
	/// **CIFilter Name**
	/// - CISwipeTransition
	///
	/// **Availability**
	/// - macOS 10.4, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Transition (*CICategoryTransition*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CISwipeTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISwipeTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISwipeTransition/)
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFSwipeTransition) class SwipeTransition: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CISwipeTransition")
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

		// MARK: - extent (inputExtent)

		/// The extent of the effect.
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

		// MARK: - color (inputColor)

		/// The color of the swipe.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeOpaqueColor`
		@objc public var color: CIColor? {
			get {
				self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
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
				self.setDoubleValue(newValue, bounds: SwipeTransition.timeRange, forKey: "inputTime")
			}
		}

		/// `time` default value
		@objc public static let timeDefault: Double = 0.0

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - angle (inputAngle)

		/// The angle in radians of the swipe.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAngle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `0.0`
		@objc public var angle: Double {
			get {
				self.doubleValue(forKey: "inputAngle", defaultValue: Self.angleDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputAngle")
			}
		}

		/// `angle` default value
		@objc public static let angleDefault: Double = 0.0

		// MARK: - width (inputWidth)

		/// The width of the swipe.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.1`
		/// - Default Value: `300.0`
		@objc public var width: Double {
			get {
				self.doubleValue(forKey: "inputWidth", defaultValue: Self.widthDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: SwipeTransition.widthRange, forKey: "inputWidth")
			}
		}

		/// `width` default value
		@objc public static let widthDefault: Double = 300.0

		/// `width` range definition
		public static let widthRange = PartialRangeFrom<Double>(0.1)

		// MARK: - opacity (inputOpacity)

		/// The opacity of the swipe.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputOpacity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.0`
		@objc public var opacity: Double {
			get {
				self.doubleValue(forKey: "inputOpacity", defaultValue: Self.opacityDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: SwipeTransition.opacityRange, forKey: "inputOpacity")
			}
		}

		/// `opacity` default value
		@objc public static let opacityDefault: Double = 0.0

		/// `opacity` range definition
		public static let opacityRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - targetImage: The target image for a transition.
		///   - extent: The extent of the effect.
		///   - color: The color of the swipe.
		///   - time: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///   - angle: The angle in radians of the swipe.
		///   - width: The width of the swipe.
		///   - opacity: The opacity of the swipe.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			targetImage: CIImage? = nil,
			extent: CGRect = SwipeTransition.extentDefault,
			color: CIColor,
			time: Double = SwipeTransition.timeDefault,
			angle: Double = SwipeTransition.angleDefault,
			width: Double = SwipeTransition.widthDefault,
			opacity: Double = SwipeTransition.opacityDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let targetImage = targetImage {
				self.targetImage = targetImage
			}
			self.extent = extent
			self.color = color
			self.time = time
			self.angle = angle
			self.width = width
			self.opacity = opacity
		}
	}
}

@available(macOS 10.4, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Swipe' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - targetImage: The target image for a transition.
	///   - extent: The extent of the effect.
	///   - color: The color of the swipe.
	///   - time: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). (0.0...1.0)
	///   - angle: The angle in radians of the swipe.
	///   - width: The width of the swipe. (0.1...)
	///   - opacity: The opacity of the swipe. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Transitions from one image to another by simulating a swiping action.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Transition, Video
	///
	/// **Documentation Links**
	/// - [CISwipeTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISwipeTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISwipeTransition/)
	@inlinable func applyingSwipeTransition(
		targetImage: CIImage,
		extent: CGRect = CIFF.SwipeTransition.extentDefault,
		color: CIColor,
		time: Double = CIFF.SwipeTransition.timeDefault,
		angle: Double = CIFF.SwipeTransition.angleDefault,
		width: Double = CIFF.SwipeTransition.widthDefault,
		opacity: Double = CIFF.SwipeTransition.opacityDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.SwipeTransition(
			inputImage: self,
			targetImage: targetImage,
			extent: extent,
			color: color,
			time: time,
			angle: angle,
			width: width,
			opacity: opacity
		)?.outputImage ?? CIImage.empty()
	}
}
