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

@available(macOS 10.9, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Page Curl With Shadow
	///
	/// Transitions from one image to another by simulating a curling page, revealing the new image as the page curls.
	///
	/// **Links**
	///
	/// [CIPageCurlWithShadowTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlWithShadowTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPageCurlWithShadowTransition/)
	///
	@objc(CIFilterFactory_CIPageCurlWithShadowTransition) class CIPageCurlWithShadowTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIPageCurlWithShadowTransition")
		}

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
		/// The image that appears on the back of the source image, as the page curls to reveal the target image.
		///
		///   Class:    CIImage
		@objc public dynamic var inputBacksideImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBacksideImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBacksideImage")
			}
		}

		///
		/// The extent of the effect.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeRectangle
		///   Default:  [0 0 0 0]
		@objc public dynamic var inputExtent: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputExtent")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputExtent")
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
		static let inputTime_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputTime: NSNumber? {
			get {
				return self.filter.value(forKey: "inputTime") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIPageCurlWithShadowTransition.inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The angle of the curling page.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  0
		@objc public dynamic var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The radius of the curl.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  100
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}

		///
		/// The maximum size in pixels of the shadow.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  0.5
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputShadowSize_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputShadowSize: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowSize") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIPageCurlWithShadowTransition.inputShadowSize_Range), forKey: "inputShadowSize")
			}
		}

		///
		/// The strength of the shadow.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  0.7
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputShadowAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputShadowAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIPageCurlWithShadowTransition.inputShadowAmount_Range), forKey: "inputShadowAmount")
			}
		}

		///
		/// The rectagular portion of input image that will cast a shadow.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeRectangle
		///   Default:  [0 0 0 0]
		@objc public dynamic var inputShadowExtent: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputShadowExtent")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputShadowExtent")
			}
		}
	}
}
