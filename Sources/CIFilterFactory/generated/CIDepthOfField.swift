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

@available(macOS 10.6, iOS 9, tvOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Depth of Field
	///
	/// Simulates miniaturization effect created by Tilt & Shift lens by performing depth of field effects.
	///
	/// **Links**
	///
	/// - [CIDepthOfField Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthOfField)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cidepthoffield?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDepthOfField/)
	///
	@objc(CIFilterFactory_DepthOfField) class DepthOfField: FilterCore {
		@objc public init?() {
			super.init(name: "CIDepthOfField")
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

		// MARK: - point0 (inputPoint0)

		///
		/// No Description
		///
		///   - Attribute key: `inputPoint0`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[0 300]`
		@objc public var point0: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint0", defaultValue: Self.point0_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint0")
			}
		}

		/// point0 default value
		@objc public static let point0_default = CGPoint(x: 0.0, y: 300.0)

		// MARK: - point1 (inputPoint1)

		///
		/// No Description
		///
		///   - Attribute key: `inputPoint1`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[300 300]`
		@objc public var point1: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint1", defaultValue: Self.point1_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint1")
			}
		}

		/// point1 default value
		@objc public static let point1_default = CGPoint(x: 300.0, y: 300.0)

		// MARK: - saturation (inputSaturation)

		///
		/// The amount to adjust the saturation.
		///
		///   - Attribute key: `inputSaturation`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1.5`
		///   minValue: 0.0
		///
		public static let saturation_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var saturation: NSNumber? {
			get {
				return self.keyedValue("inputSaturation")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DepthOfField.saturation_Range), forKey: "inputSaturation")
			}
		}

		// MARK: - unsharpMaskRadius (inputUnsharpMaskRadius)

		///
		/// No Description
		///
		///   - Attribute key: `inputUnsharpMaskRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `2.5`
		///   minValue: 0.0
		///
		public static let unsharpMaskRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var unsharpMaskRadius: NSNumber? {
			get {
				return self.keyedValue("inputUnsharpMaskRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DepthOfField.unsharpMaskRadius_Range), forKey: "inputUnsharpMaskRadius")
			}
		}

		// MARK: - unsharpMaskIntensity (inputUnsharpMaskIntensity)

		///
		/// No Description
		///
		///   - Attribute key: `inputUnsharpMaskIntensity`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.5`
		///   minValue: 0.0
		///
		public static let unsharpMaskIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var unsharpMaskIntensity: NSNumber? {
			get {
				return self.keyedValue("inputUnsharpMaskIntensity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DepthOfField.unsharpMaskIntensity_Range), forKey: "inputUnsharpMaskIntensity")
			}
		}

		// MARK: - radius (inputRadius)

		///
		/// The distance from the center of the effect.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `6`
		///   minValue: 0.0
		///
		public static let radius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DepthOfField.radius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			point0: CGPoint = DepthOfField.point0_default,
			point1: CGPoint = DepthOfField.point1_default,
			saturation: NSNumber = 1.5,
			unsharpMaskRadius: NSNumber = 2.5,
			unsharpMaskIntensity: NSNumber = 0.5,
			radius: NSNumber = 6
		) {
			self.init()

			self.image = image
			self.point0 = point0
			self.point1 = point1
			self.saturation = saturation
			self.unsharpMaskRadius = unsharpMaskRadius
			self.unsharpMaskIntensity = unsharpMaskIntensity
			self.radius = radius
		}
	}
}
