//
//  DepthOfField.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2023 Darren Ford. All rights reserved.
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

@objc public extension CIFF {
	/// Depth of Field
	///
	/// Simulates miniaturization effect created by Tilt & Shift lens by performing depth of field effects.
	///
	/// **CIFilter Name**
	/// - CIDepthOfField
	///
	/// **Availability**
	/// - macOS 10.6, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Stylize (*CICategoryStylize*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIDepthOfField Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthOfField)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDepthOfField/)
	@available(macOS 10.6, iOS 9, tvOS 9, *)
	@objc(CIFFDepthOfField) class DepthOfField: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIDepthOfField")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input for the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
			get {
				self.keyedValue("inputImage")
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
		/// - Default Value: `CGPoint(x: 0.0, y: 0.0)`
		@objc public var point0: CGPoint {
			get {
				self.cgPointValue(forKey: "inputPoint0", defaultValue: Self.point0Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint0")
			}
		}

		/// `point0` default value
		@objc public static let point0Default = CGPoint(x: 0.0, y: 300.0)

		// MARK: - point1 (inputPoint1)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint1`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 300.0, y: 300.0)`
		@objc public var point1: CGPoint {
			get {
				self.cgPointValue(forKey: "inputPoint1", defaultValue: Self.point1Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint1")
			}
		}

		/// `point1` default value
		@objc public static let point1Default = CGPoint(x: 300.0, y: 300.0)

		// MARK: - saturation (inputSaturation)

		/// The amount to adjust the saturation.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSaturation`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.5`
		@objc public var saturation: Double {
			get {
				self.doubleValue(forKey: "inputSaturation", defaultValue: Self.saturationDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DepthOfField.saturationRange, forKey: "inputSaturation")
			}
		}

		/// `saturation` default value
		@objc public static let saturationDefault: Double = 1.5

		/// `saturation` range definition
		public static let saturationRange = PartialRangeFrom<Double>(0.0)

		// MARK: - unsharpMaskRadius (inputUnsharpMaskRadius)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputUnsharpMaskRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `2.5`
		@objc public var unsharpMaskRadius: Double {
			get {
				self.doubleValue(forKey: "inputUnsharpMaskRadius", defaultValue: Self.unsharpMaskRadiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DepthOfField.unsharpMaskRadiusRange, forKey: "inputUnsharpMaskRadius")
			}
		}

		/// `unsharpMaskRadius` default value
		@objc public static let unsharpMaskRadiusDefault: Double = 2.5

		/// `unsharpMaskRadius` range definition
		public static let unsharpMaskRadiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - unsharpMaskIntensity (inputUnsharpMaskIntensity)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputUnsharpMaskIntensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.5`
		@objc public var unsharpMaskIntensity: Double {
			get {
				self.doubleValue(forKey: "inputUnsharpMaskIntensity", defaultValue: Self.unsharpMaskIntensityDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DepthOfField.unsharpMaskIntensityRange, forKey: "inputUnsharpMaskIntensity")
			}
		}

		/// `unsharpMaskIntensity` default value
		@objc public static let unsharpMaskIntensityDefault: Double = 0.5

		/// `unsharpMaskIntensity` range definition
		public static let unsharpMaskIntensityRange = PartialRangeFrom<Double>(0.0)

		// MARK: - radius (inputRadius)

		/// The distance from the center of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `6.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DepthOfField.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 6.0

		/// `radius` range definition
		public static let radiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - point0: No Description
		///   - point1: No Description
		///   - saturation: The amount to adjust the saturation.
		///   - unsharpMaskRadius: No Description
		///   - unsharpMaskIntensity: No Description
		///   - radius: The distance from the center of the effect.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			point0: CGPoint = DepthOfField.point0Default,
			point1: CGPoint = DepthOfField.point1Default,
			saturation: Double = DepthOfField.saturationDefault,
			unsharpMaskRadius: Double = DepthOfField.unsharpMaskRadiusDefault,
			unsharpMaskIntensity: Double = DepthOfField.unsharpMaskIntensityDefault,
			radius: Double = DepthOfField.radiusDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.point0 = point0
			self.point1 = point1
			self.saturation = saturation
			self.unsharpMaskRadius = unsharpMaskRadius
			self.unsharpMaskIntensity = unsharpMaskIntensity
			self.radius = radius
		}
	}
}

@available(macOS 10.6, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Depth of Field' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - point0: No Description
	///   - point1: No Description
	///   - saturation: The amount to adjust the saturation. (0.0...)
	///   - unsharpMaskRadius: No Description (0.0...)
	///   - unsharpMaskIntensity: No Description (0.0...)
	///   - radius: The distance from the center of the effect. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Simulates miniaturization effect created by Tilt & Shift lens by performing depth of field effects.
	///
	/// **Categories**: BuiltIn, StillImage, Stylize, Video
	///
	/// **Documentation Links**
	/// - [CIDepthOfField Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthOfField)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDepthOfField/)
	@inlinable func applyingDepthOfField(
		point0: CGPoint = CIFF.DepthOfField.point0Default,
		point1: CGPoint = CIFF.DepthOfField.point1Default,
		saturation: Double = CIFF.DepthOfField.saturationDefault,
		unsharpMaskRadius: Double = CIFF.DepthOfField.unsharpMaskRadiusDefault,
		unsharpMaskIntensity: Double = CIFF.DepthOfField.unsharpMaskIntensityDefault,
		radius: Double = CIFF.DepthOfField.radiusDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.DepthOfField(
			inputImage: self,
			point0: point0,
			point1: point1,
			saturation: saturation,
			unsharpMaskRadius: unsharpMaskRadius,
			unsharpMaskIntensity: unsharpMaskIntensity,
			radius: radius
		)?.outputImage ?? CIImage.empty()
	}
}
