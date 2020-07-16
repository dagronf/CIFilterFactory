//
//  CIVignetteEffect.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Vignette Effect
	///
	/// Applies a vignette shading to the corners of an image.
	///
	/// **Links**
	///
	/// [CIVignetteEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignetteEffect)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIVignetteEffect/)
	///
	@objc(CIFilterFactory_CIVignetteEffect) class CIVignetteEffect: FilterCore {
		@objc public init?() {
			super.init(name: "CIVignetteEffect")
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
		/// The center of the effect as x and y coordinates.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [150 150]
		@objc public dynamic var inputCenter: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputCenter")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputCenter")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  150
		///   minValue: 0.0
		///
		static let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIVignetteEffect.inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The intensity of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		static let inputIntensity_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public dynamic var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIVignetteEffect.inputIntensity_Range), forKey: "inputIntensity")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.5
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputFalloff_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputFalloff: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFalloff") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIVignetteEffect.inputFalloff_Range), forKey: "inputFalloff")
			}
		}
	}
}
