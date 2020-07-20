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
	@objc(CIFilterFactory_CIDepthOfField) class CIDepthOfField: FilterCore {
		@objc public init?() {
			super.init(name: "CIDepthOfField")
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
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [0 300]
		@objc public dynamic var inputPoint0: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputPoint0")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputPoint0")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [300 300]
		@objc public dynamic var inputPoint1: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputPoint1")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputPoint1")
			}
		}

		///
		/// The amount to adjust the saturation.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1.5
		///   minValue: 0.0
		///
		static let inputSaturation_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputSaturation: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSaturation") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDepthOfField.inputSaturation_Range), forKey: "inputSaturation")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  2.5
		///   minValue: 0.0
		///
		static let inputUnsharpMaskRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputUnsharpMaskRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUnsharpMaskRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDepthOfField.inputUnsharpMaskRadius_Range), forKey: "inputUnsharpMaskRadius")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.5
		///   minValue: 0.0
		///
		static let inputUnsharpMaskIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputUnsharpMaskIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUnsharpMaskIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDepthOfField.inputUnsharpMaskIntensity_Range), forKey: "inputUnsharpMaskIntensity")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  6
		///   minValue: 0.0
		///
		static let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDepthOfField.inputRadius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputPoint0: CIFilterFactory.Point = CIFilterFactory.Point(x: 0.0, y: 300.0),
			inputPoint1: CIFilterFactory.Point = CIFilterFactory.Point(x: 300.0, y: 300.0),
			inputSaturation: NSNumber = 1.5,
			inputUnsharpMaskRadius: NSNumber = 2.5,
			inputUnsharpMaskIntensity: NSNumber = 0.5,
			inputRadius: NSNumber = 6
		) {
			self.init()

			self.inputImage = inputImage
			self.inputPoint0 = inputPoint0
			self.inputPoint1 = inputPoint1
			self.inputSaturation = inputSaturation
			self.inputUnsharpMaskRadius = inputUnsharpMaskRadius
			self.inputUnsharpMaskIntensity = inputUnsharpMaskIntensity
			self.inputRadius = inputRadius
		}
	}
}
