//
//  CIPageCurlTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.4, iOS 9, *)
	@inlinable @objc static func PageCurlTransition() -> CIFilterFactory.CIPageCurlTransition? {
		return CIFilterFactory.CIPageCurlTransition()
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Page Curl
	///
	/// Transitions from one image to another by simulating a curling page, revealing the new image as the page curls.
	///
	/// **Links**
	///
	/// [CIPageCurlTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPageCurlTransition/)
	///
	@objc(CIFilterFactory_CIPageCurlTransition) class CIPageCurlTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIPageCurlTransition")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		///
		/// The target image for a transition.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputTargetImage: CIImage? {
			get {
				return self.keyedValue("inputTargetImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputTargetImage")
			}
		}

		///
		/// The image that appears on the back of the source image, as the page curls to reveal the target image.
		///
		///   Class:    CIImage
		@objc public dynamic var inputBacksideImage: CIImage? {
			get {
				return self.keyedValue("inputBacksideImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBacksideImage")
			}
		}

		///
		/// An image that looks like a shaded sphere enclosed in a square image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputShadingImage: CIImage? {
			get {
				return self.keyedValue("inputShadingImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputShadingImage")
			}
		}

		///
		/// The extent of the effect.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeRectangle
		///   Default:  [0 0 300 300]
		@objc public dynamic var inputExtent: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputExtent")
			}
			set {
				self.setKeyedValue(newValue?.vector, for: "inputExtent")
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
				return self.keyedValue("inputTime")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIPageCurlTransition.inputTime_Range), forKey: "inputTime")
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
				return self.keyedValue("inputAngle")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAngle")
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
				return self.keyedValue("inputRadius")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRadius")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputTargetImage: CIImage,
			inputBacksideImage: CIImage,
			inputShadingImage: CIImage,
			inputExtent: CIFilterFactory.Rect = CIFilterFactory.Rect(x: 0.0, y: 0.0, width: 300.0, height: 300.0),
			inputTime: NSNumber = 0,
			inputAngle: NSNumber = 0,
			inputRadius: NSNumber = 100
		) {
			self.init()

			self.inputImage = inputImage
			self.inputTargetImage = inputTargetImage
			self.inputBacksideImage = inputBacksideImage
			self.inputShadingImage = inputShadingImage
			self.inputExtent = inputExtent
			self.inputTime = inputTime
			self.inputAngle = inputAngle
			self.inputRadius = inputRadius
		}
	}
}
