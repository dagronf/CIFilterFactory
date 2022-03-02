//
//  DepthOfField.swift  (AUTOMATICALLY GENERATED FILE)
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

import AVFoundation
import CoreImage
import CoreML
import Foundation

@available(macOS 10.6, iOS 9, tvOS 9, *)
@objc public extension CIFF {
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
	@available(macOS 10.6, iOS 9, tvOS 9, *)
	@objc(CIFFDepthOfField) class DepthOfField: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIDepthOfField")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - point0 (inputPoint0)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint0`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[0 300]`
		@objc public var point0: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint0", defaultValue: Self.point0Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint0")
			}
		}

		/// point0 default value
		@objc public static let point0Default = CGPoint(x: 0.0, y: 300.0)

		// MARK: - point1 (inputPoint1)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint1`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[300 300]`
		@objc public var point1: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint1", defaultValue: Self.point1Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint1")
			}
		}

		/// point1 default value
		@objc public static let point1Default = CGPoint(x: 300.0, y: 300.0)

		// MARK: - saturation (inputSaturation)

		/// The amount to adjust the saturation.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSaturation`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1.5`
		/// - Minimum value: `0.0`
		@objc public var saturation: NSNumber? {
			get {
				return self.keyedValue("inputSaturation")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DepthOfField.saturationRange), forKey: "inputSaturation")
			}
		}

		/// `saturation` range definition
		public static let saturationRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - unsharpMaskRadius (inputUnsharpMaskRadius)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputUnsharpMaskRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `2.5`
		/// - Minimum value: `0.0`
		@objc public var unsharpMaskRadius: NSNumber? {
			get {
				return self.keyedValue("inputUnsharpMaskRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DepthOfField.unsharpMaskRadiusRange), forKey: "inputUnsharpMaskRadius")
			}
		}

		/// `unsharpMaskRadius` range definition
		public static let unsharpMaskRadiusRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - unsharpMaskIntensity (inputUnsharpMaskIntensity)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputUnsharpMaskIntensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.5`
		/// - Minimum value: `0.0`
		@objc public var unsharpMaskIntensity: NSNumber? {
			get {
				return self.keyedValue("inputUnsharpMaskIntensity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DepthOfField.unsharpMaskIntensityRange), forKey: "inputUnsharpMaskIntensity")
			}
		}

		/// `unsharpMaskIntensity` range definition
		public static let unsharpMaskIntensityRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - radius (inputRadius)

		/// The distance from the center of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `6`
		/// - Minimum value: `0.0`
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DepthOfField.radiusRange), forKey: "inputRadius")
			}
		}

		/// `radius` range definition
		public static let radiusRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			point0: CGPoint = DepthOfField.point0Default,
			point1: CGPoint = DepthOfField.point1Default,
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
