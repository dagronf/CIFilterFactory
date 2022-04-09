//
//  PageCurlWithShadowTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.9, iOS 9, tvOS 9, *)
@objc public extension CIFF {
	///
	/// Page Curl With Shadow
	///
	/// Transitions from one image to another by simulating a curling page, revealing the new image as the page curls.
	///
	/// **Links**
	///
	/// - [CIPageCurlWithShadowTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlWithShadowTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cipagecurlwithshadowtransition?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPageCurlWithShadowTransition/)
	///
	@available(macOS 10.9, iOS 9, tvOS 9, *)
	@objc(CIFFPageCurlWithShadowTransition) class PageCurlWithShadowTransition: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIPageCurlWithShadowTransition")
		}

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

		// MARK: - backsideImage (inputBacksideImage)

		/// The image that appears on the back of the source image, as the page curls to reveal the target image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBacksideImage`
		/// - Internal class: `CIImage`
		@objc public var backsideImage: CIImage? {
			get {
				return self.keyedValue("inputBacksideImage")
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
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extentDefault)
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
				let number = self.filter.value(forKey: "inputTime") as? NSNumber
				return number?.doubleValue ?? Self.timeDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: PageCurlWithShadowTransition.timeRange)
				self.filter.setValue(number, forKey: "inputTime")
			}
		}

		/// `time` default value
		@objc public static let timeDefault: Double = 0.0

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - angle (inputAngle)

		/// The angle of the curling page.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAngle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `0.0`
		@objc public var angle: Double {
			get {
				let number = self.filter.value(forKey: "inputAngle") as? NSNumber
				return number?.doubleValue ?? Self.angleDefault
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
				let number = self.filter.value(forKey: "inputRadius") as? NSNumber
				return number?.doubleValue ?? Self.radiusDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: PageCurlWithShadowTransition.radiusRange)
				self.filter.setValue(number, forKey: "inputRadius")
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
				let number = self.filter.value(forKey: "inputShadowSize") as? NSNumber
				return number?.doubleValue ?? Self.shadowSizeDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: PageCurlWithShadowTransition.shadowSizeRange)
				self.filter.setValue(number, forKey: "inputShadowSize")
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
				let number = self.filter.value(forKey: "inputShadowAmount") as? NSNumber
				return number?.doubleValue ?? Self.shadowAmountDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: PageCurlWithShadowTransition.shadowAmountRange)
				self.filter.setValue(number, forKey: "inputShadowAmount")
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
				return CGRect(with: self.filter, key: "inputShadowExtent", defaultValue: Self.shadowExtentDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputShadowExtent")
			}
		}

		/// `shadowExtent` default value
		@objc public static let shadowExtentDefault = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			backsideImage: CIImage,
			extent: CGRect = PageCurlWithShadowTransition.extentDefault,
			time: Double = PageCurlWithShadowTransition.timeDefault,
			angle: Double = PageCurlWithShadowTransition.angleDefault,
			radius: Double = PageCurlWithShadowTransition.radiusDefault,
			shadowSize: Double = PageCurlWithShadowTransition.shadowSizeDefault,
			shadowAmount: Double = PageCurlWithShadowTransition.shadowAmountDefault,
			shadowExtent: CGRect = PageCurlWithShadowTransition.shadowExtentDefault
		) {
			self.init()
			self.image = image
			self.targetImage = targetImage
			self.backsideImage = backsideImage
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
