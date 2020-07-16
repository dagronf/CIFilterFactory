//
//  CISpotLight.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Spot Light
	///
	/// Applies a directional spotlight effect to an image.
	///
	/// **Links**
	///
	/// [CISpotLight Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotLight)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISpotLight/)
	///
	@objc(CIFilterFactory_CISpotLight) class CISpotLight: FilterCore {
		@objc public init?() {
			super.init(name: "CISpotLight")
		}

		// MARK: - Inputs

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
		/// The x and y position of the spotlight.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition3
		///   Default:  [400 600 150]
		@objc public dynamic var inputLightPosition: CIVector? {
			get {
				return self.filter.value(forKey: "inputLightPosition") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputLightPosition")
			}
		}

		///
		/// The x and y position that the spotlight points at.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition3
		///   Default:  [200 200 0]
		@objc public dynamic var inputLightPointsAt: CIVector? {
			get {
				return self.filter.value(forKey: "inputLightPointsAt") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputLightPointsAt")
			}
		}

		///
		/// The brightness of the spotlight.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  3
		///   minValue: 0.0
		///
		static let inputBrightness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputBrightness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBrightness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISpotLight.inputBrightness_Range), forKey: "inputBrightness")
			}
		}

		///
		/// The spotlight size. The smaller the value, the more tightly focused the light beam.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.1
		@objc public dynamic var inputConcentration: NSNumber? {
			get {
				return self.filter.value(forKey: "inputConcentration") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputConcentration")
			}
		}

		///
		/// The color of the spotlight.
		///
		///   Class:    CIColor
		///   Type:     CIAttributeTypeOpaqueColor
		///   Default:  rgba(1 1 1 1)
		@objc public dynamic var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}
	}
}
