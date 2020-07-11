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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

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
	@objc(CIFilterFactory_CISpotLight) class CISpotLight: FilterCommon {
		@objc public init?() {
			super.init(name: "CISpotLight")
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputLightPosition

		///
		/// The x and y position of the spotlight.
		///
		@objc public var inputLightPosition: CIVector? {
			get {
				return self.filter.value(forKey: "inputLightPosition") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputLightPosition")
			}
		}

		// MARK: - inputLightPointsAt

		///
		/// The x and y position that the spotlight points at.
		///
		@objc public var inputLightPointsAt: CIVector? {
			get {
				return self.filter.value(forKey: "inputLightPointsAt") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputLightPointsAt")
			}
		}

		// MARK: - inputBrightness

		///
		/// The brightness of the spotlight.
		///
		///   minValue: 0.0
		///
		let inputBrightness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputBrightness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBrightness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputBrightness_Range), forKey: "inputBrightness")
			}
		}

		// MARK: - inputConcentration

		///
		/// The spotlight size. The smaller the value, the more tightly focused the light beam.
		///
		@objc public var inputConcentration: NSNumber? {
			get {
				return self.filter.value(forKey: "inputConcentration") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputConcentration")
			}
		}

		// MARK: - inputColor

		///
		/// The color of the spotlight.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}
	}
}
