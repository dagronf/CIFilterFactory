//
//  SunbeamsGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Sunbeams
	///
	/// Generates a sun effect. You typically use the output of the sunbeams filter as input to a composite filter.
	///
	/// **CIFilter Name**
	/// - CISunbeamsGenerator
	///
	/// **Availability**
	/// - macOS 10.4, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Generator (*CICategoryGenerator*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CISunbeamsGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISunbeamsGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISunbeamsGenerator/)
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFSunbeamsGenerator) class SunbeamsGenerator: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CISunbeamsGenerator")
		}

		// MARK: - center (inputCenter)

		/// The center of the effect as x and y pixel coordinates.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var center: CGPoint {
			get {
				self.cgPointValue(forKey: "inputCenter", defaultValue: Self.centerDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// `center` default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - color (inputColor)

		/// The color of the sun.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var color: CIColor? {
			get {
				self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		// MARK: - sunRadius (inputSunRadius)

		/// The radius of the sun.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSunRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `40.0`
		@objc public var sunRadius: Double {
			get {
				self.doubleValue(forKey: "inputSunRadius", defaultValue: Self.sunRadiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: SunbeamsGenerator.sunRadiusRange, forKey: "inputSunRadius")
			}
		}

		/// `sunRadius` default value
		@objc public static let sunRadiusDefault: Double = 40.0

		/// `sunRadius` range definition
		public static let sunRadiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - maxStriationRadius (inputMaxStriationRadius)

		/// The radius of the sunbeams.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaxStriationRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `2.58`
		@objc public var maxStriationRadius: Double {
			get {
				self.doubleValue(forKey: "inputMaxStriationRadius", defaultValue: Self.maxStriationRadiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: SunbeamsGenerator.maxStriationRadiusRange, forKey: "inputMaxStriationRadius")
			}
		}

		/// `maxStriationRadius` default value
		@objc public static let maxStriationRadiusDefault: Double = 2.58

		/// `maxStriationRadius` range definition
		public static let maxStriationRadiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - striationStrength (inputStriationStrength)

		/// The intensity of the sunbeams. Higher values result in more intensity.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputStriationStrength`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.5`
		@objc public var striationStrength: Double {
			get {
				self.doubleValue(forKey: "inputStriationStrength", defaultValue: Self.striationStrengthDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: SunbeamsGenerator.striationStrengthRange, forKey: "inputStriationStrength")
			}
		}

		/// `striationStrength` default value
		@objc public static let striationStrengthDefault: Double = 0.5

		/// `striationStrength` range definition
		public static let striationStrengthRange = PartialRangeFrom<Double>(0.0)

		// MARK: - striationContrast (inputStriationContrast)

		/// The contrast of the sunbeams. Higher values result in more contrast.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputStriationContrast`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.375`
		@objc public var striationContrast: Double {
			get {
				self.doubleValue(forKey: "inputStriationContrast", defaultValue: Self.striationContrastDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: SunbeamsGenerator.striationContrastRange, forKey: "inputStriationContrast")
			}
		}

		/// `striationContrast` default value
		@objc public static let striationContrastDefault: Double = 1.375

		/// `striationContrast` range definition
		public static let striationContrastRange = PartialRangeFrom<Double>(0.0)

		// MARK: - time (inputTime)

		/// The duration of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTime`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.0`
		@objc public var time: Double {
			get {
				self.doubleValue(forKey: "inputTime", defaultValue: Self.timeDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: SunbeamsGenerator.timeRange, forKey: "inputTime")
			}
		}

		/// `time` default value
		@objc public static let timeDefault: Double = 0.0

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - color: The color of the sun.
		///   - sunRadius: The radius of the sun.
		///   - maxStriationRadius: The radius of the sunbeams.
		///   - striationStrength: The intensity of the sunbeams. Higher values result in more intensity.
		///   - striationContrast: The contrast of the sunbeams. Higher values result in more contrast.
		///   - time: The duration of the effect.
		@objc public convenience init?(
			center: CGPoint = SunbeamsGenerator.centerDefault,
			color: CIColor,
			sunRadius: Double = SunbeamsGenerator.sunRadiusDefault,
			maxStriationRadius: Double = SunbeamsGenerator.maxStriationRadiusDefault,
			striationStrength: Double = SunbeamsGenerator.striationStrengthDefault,
			striationContrast: Double = SunbeamsGenerator.striationContrastDefault,
			time: Double = SunbeamsGenerator.timeDefault
		) {
			self.init()
			self.center = center
			self.color = color
			self.sunRadius = sunRadius
			self.maxStriationRadius = maxStriationRadius
			self.striationStrength = striationStrength
			self.striationContrast = striationContrast
			self.time = time
		}
	}
}

@available(macOS 10.4, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Create a new CIImage using the 'Sunbeams' filter
	///
	/// - Parameters:
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - color: The color of the sun.
	///   - sunRadius: The radius of the sun. (0.0...)
	///   - maxStriationRadius: The radius of the sunbeams. (0.0...)
	///   - striationStrength: The intensity of the sunbeams. Higher values result in more intensity. (0.0...)
	///   - striationContrast: The contrast of the sunbeams. Higher values result in more contrast. (0.0...)
	///   - time: The duration of the effect. (0.0...1.0)
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generates a sun effect. You typically use the output of the sunbeams filter as input to a composite filter.
	///
	/// **Categories**: BuiltIn, Generator, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CISunbeamsGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISunbeamsGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISunbeamsGenerator/)
	@inlinable static func createUsingSunbeamsGenerator(
		center: CGPoint = CIFF.SunbeamsGenerator.centerDefault,
		color: CIColor,
		sunRadius: Double = CIFF.SunbeamsGenerator.sunRadiusDefault,
		maxStriationRadius: Double = CIFF.SunbeamsGenerator.maxStriationRadiusDefault,
		striationStrength: Double = CIFF.SunbeamsGenerator.striationStrengthDefault,
		striationContrast: Double = CIFF.SunbeamsGenerator.striationContrastDefault,
		time: Double = CIFF.SunbeamsGenerator.timeDefault
	) -> CIImage? {
		return CIFF.SunbeamsGenerator(
			center: center,
			color: color,
			sunRadius: sunRadius,
			maxStriationRadius: maxStriationRadius,
			striationStrength: striationStrength,
			striationContrast: striationContrast,
			time: time
		)?.outputImage
	}
}
