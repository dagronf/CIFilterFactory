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

@available(macOS 10.9, iOS 9, tvOS 9, *)
@objc public extension CIFilterFactory {
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
	@objc(CIFilterFactory_PageCurlWithShadowTransition) class PageCurlWithShadowTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIPageCurlWithShadowTransition")
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

		// MARK: - backsideImage (inputBacksideImage)

		///
		/// The image that appears on the back of the source image, as the page curls to reveal the target image.
		///
		///   - Attribute key: `inputBacksideImage`
		///   - Internal class: `CIImage`
		@objc public var backsideImage: CIImage? {
			get {
				return self.keyedValue("inputBacksideImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBacksideImage")
			}
		}

		// MARK: - extent (inputExtent)

		///
		/// The extent of the effect.
		///
		///   - Attribute key: `inputExtent`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypeRectangle`
		///   - Default value: `[0 0 0 0]`
		@objc public var extent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extent_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// extent default value
		@objc public static let extent_default = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)

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
				self.filter.setValue(newValue?.clamped(bounds: PageCurlWithShadowTransition.time_Range), forKey: "inputTime")
			}
		}

		// MARK: - angle (inputAngle)

		///
		/// The angle of the curling page.
		///
		///   - Attribute key: `inputAngle`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `0`
		@objc public var angle: NSNumber? {
			get {
				return self.keyedValue("inputAngle")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAngle")
			}
		}

		// MARK: - radius (inputRadius)

		///
		/// The radius of the curl.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `100`
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRadius")
			}
		}

		// MARK: - shadowSize (inputShadowSize)

		///
		/// The maximum size in pixels of the shadow.
		///
		///   - Attribute key: `inputShadowSize`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `0.5`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let shadowSize_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var shadowSize: NSNumber? {
			get {
				return self.keyedValue("inputShadowSize")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: PageCurlWithShadowTransition.shadowSize_Range), forKey: "inputShadowSize")
			}
		}

		// MARK: - shadowAmount (inputShadowAmount)

		///
		/// The strength of the shadow.
		///
		///   - Attribute key: `inputShadowAmount`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `0.7`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let shadowAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var shadowAmount: NSNumber? {
			get {
				return self.keyedValue("inputShadowAmount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: PageCurlWithShadowTransition.shadowAmount_Range), forKey: "inputShadowAmount")
			}
		}

		// MARK: - shadowExtent (inputShadowExtent)

		///
		/// The rectagular portion of input image that will cast a shadow.
		///
		///   - Attribute key: `inputShadowExtent`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypeRectangle`
		///   - Default value: `[0 0 0 0]`
		@objc public var shadowExtent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputShadowExtent", defaultValue: Self.shadowExtent_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputShadowExtent")
			}
		}

		/// shadowExtent default value
		@objc public static let shadowExtent_default = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			backsideImage: CIImage,
			extent: CGRect = PageCurlWithShadowTransition.extent_default,
			time: NSNumber = 0,
			angle: NSNumber = 0,
			radius: NSNumber = 100,
			shadowSize: NSNumber = 0.5,
			shadowAmount: NSNumber = 0.7,
			shadowExtent: CGRect = PageCurlWithShadowTransition.shadowExtent_default
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
