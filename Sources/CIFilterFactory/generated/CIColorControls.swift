//
//  CIColorControls.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Controls
	///
	/// Adjusts saturation, brightness, and contrast values.
	///
	/// **Links**
	///
	/// [CIColorControls Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorControls)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorControls/)
	///
	@objc(CIFilterFactory_CIColorControls) class CIColorControls: FilterCommon {
		@objc public init?() {
			super.init(name: "CIColorControls")
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class: CIImage, Type: CIAttributeTypeImage
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputSaturation

		///
		/// The amount of saturation to apply. The larger the value, the more saturated the result.
		///
		///   Class: NSNumber, Type: CIAttributeTypeScalar
		///
		///   minValue: 0.0
		///
		let inputSaturation_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSaturation: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSaturation") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputSaturation_Range), forKey: "inputSaturation")
			}
		}

		// MARK: - inputBrightness

		///
		/// The amount of brightness to apply. The larger the value, the brighter the result.
		///
		///   Class: NSNumber, Type: CIAttributeTypeScalar
		///
		///   minValue: -1.0
		///
		let inputBrightness_Range: PartialRangeFrom<Float> = Float(-1.0)...
		@objc public var inputBrightness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBrightness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputBrightness_Range), forKey: "inputBrightness")
			}
		}

		// MARK: - inputContrast

		///
		/// The amount of contrast to apply. The larger the value, the more contrast in the resulting image.
		///
		///   Class: NSNumber, Type: CIAttributeTypeScalar
		///
		///   minValue: 0.0
		///
		let inputContrast_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputContrast_Range), forKey: "inputContrast")
			}
		}
	}
}
