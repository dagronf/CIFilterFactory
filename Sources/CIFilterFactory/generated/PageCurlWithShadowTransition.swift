//
//  PageCurlWithShadowTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Page Curl With Shadow
	///
	/// Transitions from one image to another by simulating a curling page, revealing the new image as the page curls.
	///
	/// **CIFilter Name**
	/// - CIPageCurlWithShadowTransition
	///
	/// **Availability**
	/// - macOS 10.9, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Transition (*CICategoryTransition*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIPageCurlWithShadowTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlWithShadowTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPageCurlWithShadowTransition/)
	@available(macOS 10.9, iOS 9, tvOS 9, *)
	@objc(CIFFPageCurlWithShadowTransition) class PageCurlWithShadowTransition: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIPageCurlWithShadowTransition")
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

		// MARK: - backsideImage (inputBacksideImage)

		/// The image that appears on the back of the source image, as the page curls to reveal the target image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBacksideImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var backsideImage: CIImage? {
			get {
				self.keyedValue("inputBacksideImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBacksideImage")
			}
		}

		// MARK: - extent (inputExtent)

		/// The extent of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputExtent`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeRectangle`
		/// - Default Value: `CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)`
		@objc public var extent: CGRect {
			get {
				self.cgRectValue(forKey: "inputExtent", defaultValue: Self.extentDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// `extent` default value
		@objc public static let extentDefault = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)

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
				self.setDoubleValue(newValue, bounds: PageCurlWithShadowTransition.timeRange, forKey: "inputTime")
			}
		}

		/// `time` default value
		@objc public static let timeDefault: Double = 0.0

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - angle (inputAngle)

		/// The angle in radians of the curling page.
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

		// MARK: - radius (inputRadius)

		/// The radius of the curl.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.01`
		/// - Default Value: `100.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: PageCurlWithShadowTransition.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 100.0

		/// `radius` range definition
		public static let radiusRange = PartialRangeFrom<Double>(0.01)

		// MARK: - shadowSize (inputShadowSize)

		/// The maximum size in pixels of the shadow.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowSize`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.5`
		@objc public var shadowSize: Double {
			get {
				self.doubleValue(forKey: "inputShadowSize", defaultValue: Self.shadowSizeDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: PageCurlWithShadowTransition.shadowSizeRange, forKey: "inputShadowSize")
			}
		}

		/// `shadowSize` default value
		@objc public static let shadowSizeDefault: Double = 0.5

		/// `shadowSize` range definition
		public static let shadowSizeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - shadowAmount (inputShadowAmount)

		/// The strength of the shadow.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.7`
		@objc public var shadowAmount: Double {
			get {
				self.doubleValue(forKey: "inputShadowAmount", defaultValue: Self.shadowAmountDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: PageCurlWithShadowTransition.shadowAmountRange, forKey: "inputShadowAmount")
			}
		}

		/// `shadowAmount` default value
		@objc public static let shadowAmountDefault: Double = 0.7

		/// `shadowAmount` range definition
		public static let shadowAmountRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - shadowExtent (inputShadowExtent)

		/// The rectagular portion of input image that will cast a shadow.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowExtent`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeRectangle`
		/// - Default Value: `CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)`
		@objc public var shadowExtent: CGRect {
			get {
				self.cgRectValue(forKey: "inputShadowExtent", defaultValue: Self.shadowExtentDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputShadowExtent")
			}
		}

		/// `shadowExtent` default value
		@objc public static let shadowExtentDefault = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - targetImage: The target image for a transition.
		///   - backsideImage: The image that appears on the back of the source image, as the page curls to reveal the target image.
		///   - extent: The extent of the effect.
		///   - time: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///   - angle: The angle in radians of the curling page.
		///   - radius: The radius of the curl.
		///   - shadowSize: The maximum size in pixels of the shadow.
		///   - shadowAmount: The strength of the shadow.
		///   - shadowExtent: The rectagular portion of input image that will cast a shadow.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			targetImage: CIImage? = nil,
			backsideImage: CIImage? = nil,
			extent: CGRect = PageCurlWithShadowTransition.extentDefault,
			time: Double = PageCurlWithShadowTransition.timeDefault,
			angle: Double = PageCurlWithShadowTransition.angleDefault,
			radius: Double = PageCurlWithShadowTransition.radiusDefault,
			shadowSize: Double = PageCurlWithShadowTransition.shadowSizeDefault,
			shadowAmount: Double = PageCurlWithShadowTransition.shadowAmountDefault,
			shadowExtent: CGRect = PageCurlWithShadowTransition.shadowExtentDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let targetImage = targetImage {
				self.targetImage = targetImage
			}
			if let backsideImage = backsideImage {
				self.backsideImage = backsideImage
			}
			self.extent = extent
			self.time = time
			self.angle = angle
			self.radius = radius
			self.shadowSize = shadowSize
			self.shadowAmount = shadowAmount
			self.shadowExtent = shadowExtent
		}
	}
}

@available(macOS 10.9, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Page Curl With Shadow' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - targetImage: The target image for a transition.
	///   - backsideImage: The image that appears on the back of the source image, as the page curls to reveal the target image.
	///   - extent: The extent of the effect.
	///   - time: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). (0.0...1.0)
	///   - angle: The angle in radians of the curling page.
	///   - radius: The radius of the curl. (0.01...)
	///   - shadowSize: The maximum size in pixels of the shadow. (0.0...1.0)
	///   - shadowAmount: The strength of the shadow. (0.0...1.0)
	///   - shadowExtent: The rectagular portion of input image that will cast a shadow.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Transitions from one image to another by simulating a curling page, revealing the new image as the page curls.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Transition, Video
	///
	/// **Documentation Links**
	/// - [CIPageCurlWithShadowTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlWithShadowTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPageCurlWithShadowTransition/)
	@inlinable func applyingPageCurlWithShadowTransition(
		targetImage: CIImage,
		backsideImage: CIImage,
		extent: CGRect = CIFF.PageCurlWithShadowTransition.extentDefault,
		time: Double = CIFF.PageCurlWithShadowTransition.timeDefault,
		angle: Double = CIFF.PageCurlWithShadowTransition.angleDefault,
		radius: Double = CIFF.PageCurlWithShadowTransition.radiusDefault,
		shadowSize: Double = CIFF.PageCurlWithShadowTransition.shadowSizeDefault,
		shadowAmount: Double = CIFF.PageCurlWithShadowTransition.shadowAmountDefault,
		shadowExtent: CGRect = CIFF.PageCurlWithShadowTransition.shadowExtentDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.PageCurlWithShadowTransition(
			inputImage: self,
			targetImage: targetImage,
			backsideImage: backsideImage,
			extent: extent,
			time: time,
			angle: angle,
			radius: radius,
			shadowSize: shadowSize,
			shadowAmount: shadowAmount,
			shadowExtent: shadowExtent
		)?.outputImage ?? CIImage.empty()
	}
}
