//
//  CIDepthOfField.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.6, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Depth of Field
	///
	/// Simulates miniaturization effect created by Tilt & Shift lens by performing depth of field effects.
	///
	/// **Links**
	///
	/// [CIDepthOfField Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthOfField)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDepthOfField/)
	///
	@objc(CIFilterFactory_CIDepthOfField) class CIDepthOfField: FilterCommon {
		@objc public init?() {
			super.init(name: "CIDepthOfField")
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

		// MARK: - inputPoint0

		///
		/// No Description
		///
		@objc public var inputPoint0: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint0") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint0")
			}
		}

		// MARK: - inputPoint1

		///
		/// No Description
		///
		@objc public var inputPoint1: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint1") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint1")
			}
		}

		// MARK: - inputSaturation

		///
		/// The amount to adjust the saturation.
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

		// MARK: - inputUnsharpMaskRadius

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputUnsharpMaskRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputUnsharpMaskRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUnsharpMaskRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputUnsharpMaskRadius_Range), forKey: "inputUnsharpMaskRadius")
			}
		}

		// MARK: - inputUnsharpMaskIntensity

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputUnsharpMaskIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputUnsharpMaskIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUnsharpMaskIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputUnsharpMaskIntensity_Range), forKey: "inputUnsharpMaskIntensity")
			}
		}

		// MARK: - inputRadius

		///
		/// The distance from the center of the effect.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}
