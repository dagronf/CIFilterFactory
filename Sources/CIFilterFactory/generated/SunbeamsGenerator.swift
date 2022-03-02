//
//  SunbeamsGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, tvOS 9, *)
@objc public extension CIFF {
	///
	/// Sunbeams
	///
	/// Generates a sun effect. You typically use the output of the sunbeams filter as input to a composite filter.
	///
	/// **Links**
	///
	/// - [CISunbeamsGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISunbeamsGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cisunbeamsgenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISunbeamsGenerator/)
	///
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFSunbeamsGenerator) class SunbeamsGenerator: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CISunbeamsGenerator")
		}

		// MARK: - Inputs

		// MARK: - center (inputCenter)

		/// The x and y position to use as the center of the sunbeam pattern
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[150 150]`
		@objc public var center: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputCenter", defaultValue: Self.centerDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// center default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - color (inputColor)

		/// The color of the sun.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor`
		/// - Internal class: `CIColor`
		/// - Default value: `rgba(1 0.5 0 1)`
		@objc public var color: CIColor? {
			get {
				return self.keyedValue("inputColor")
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
		/// - Default value: `40`
		/// - Minimum value: `0.0`
		@objc public var sunRadius: NSNumber? {
			get {
				return self.keyedValue("inputSunRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: SunbeamsGenerator.sunRadiusRange), forKey: "inputSunRadius")
			}
		}

		/// `sunRadius` range definition
		public static let sunRadiusRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - maxStriationRadius (inputMaxStriationRadius)

		/// The radius of the sunbeams.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaxStriationRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `2.58`
		/// - Minimum value: `0.0`
		@objc public var maxStriationRadius: NSNumber? {
			get {
				return self.keyedValue("inputMaxStriationRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: SunbeamsGenerator.maxStriationRadiusRange), forKey: "inputMaxStriationRadius")
			}
		}

		/// `maxStriationRadius` range definition
		public static let maxStriationRadiusRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - striationStrength (inputStriationStrength)

		/// The intensity of the sunbeams. Higher values result in more intensity.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputStriationStrength`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.5`
		/// - Minimum value: `0.0`
		@objc public var striationStrength: NSNumber? {
			get {
				return self.keyedValue("inputStriationStrength")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: SunbeamsGenerator.striationStrengthRange), forKey: "inputStriationStrength")
			}
		}

		/// `striationStrength` range definition
		public static let striationStrengthRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - striationContrast (inputStriationContrast)

		/// The contrast of the sunbeams. Higher values result in more contrast.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputStriationContrast`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1.375`
		/// - Minimum value: `0.0`
		@objc public var striationContrast: NSNumber? {
			get {
				return self.keyedValue("inputStriationContrast")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: SunbeamsGenerator.striationContrastRange), forKey: "inputStriationContrast")
			}
		}

		/// `striationContrast` range definition
		public static let striationContrastRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - time (inputTime)

		/// The duration of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTime`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var time: NSNumber? {
			get {
				return self.keyedValue("inputTime")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: SunbeamsGenerator.timeRange), forKey: "inputTime")
			}
		}

		/// `time` range definition
		public static let timeRange: ClosedRange<Float> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			center: CGPoint = SunbeamsGenerator.centerDefault,
			color: CIColor,
			sunRadius: NSNumber = 40,
			maxStriationRadius: NSNumber = 2.58,
			striationStrength: NSNumber = 0.5,
			striationContrast: NSNumber = 1.375,
			time: NSNumber = 0
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
