//
//  StarShineGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, tvOS 6, *)
@objc public extension CIFF {
	///
	/// Star Shine
	///
	/// Generates a starburst pattern. The output image is typically used as input to another filter
	///
	/// **Links**
	///
	/// - [CIStarShineGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStarShineGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cistarshinegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIStarShineGenerator/)
	///
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFStarShineGenerator) class StarShineGenerator: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIStarShineGenerator")
		}

		// MARK: - Inputs

		// MARK: - center (inputCenter)

		/// The x and y position to use as the center of the star.
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

		/// The color to use for the outer shell of the circular star.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor`
		/// - Internal class: `CIColor`
		/// - Default value: `rgba(1 0.8 0.6 1)`
		@objc public var color: CIColor? {
			get {
				return self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		// MARK: - radius (inputRadius)

		/// The radius of the star.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `50`
		/// - Minimum value: `0.0`
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StarShineGenerator.radiusRange), forKey: "inputRadius")
			}
		}

		/// `radius` range definition
		public static let radiusRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - crossScale (inputCrossScale)

		/// The size of the cross pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCrossScale`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `15`
		/// - Minimum value: `0.0`
		@objc public var crossScale: NSNumber? {
			get {
				return self.keyedValue("inputCrossScale")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StarShineGenerator.crossScaleRange), forKey: "inputCrossScale")
			}
		}

		/// `crossScale` range definition
		public static let crossScaleRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - crossAngle (inputCrossAngle)

		/// The angle of the cross pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCrossAngle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default value: `0.6`
		@objc public var crossAngle: NSNumber? {
			get {
				return self.keyedValue("inputCrossAngle")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCrossAngle")
			}
		}

		// MARK: - crossOpacity (inputCrossOpacity)

		/// The opacity of the cross pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCrossOpacity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `-2`
		/// - Minimum value: `-8.0`
		@objc public var crossOpacity: NSNumber? {
			get {
				return self.keyedValue("inputCrossOpacity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StarShineGenerator.crossOpacityRange), forKey: "inputCrossOpacity")
			}
		}

		/// `crossOpacity` range definition
		public static let crossOpacityRange: PartialRangeFrom<Float> = Float(-8.0)...

		// MARK: - crossWidth (inputCrossWidth)

		/// The width of the cross pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCrossWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `2.5`
		/// - Minimum value: `0.0`
		@objc public var crossWidth: NSNumber? {
			get {
				return self.keyedValue("inputCrossWidth")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StarShineGenerator.crossWidthRange), forKey: "inputCrossWidth")
			}
		}

		/// `crossWidth` range definition
		public static let crossWidthRange: PartialRangeFrom<Float> = Float(0.0)...

		// MARK: - epsilon (inputEpsilon)

		/// The length of the cross spikes.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputEpsilon`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `-2`
		/// - Minimum value: `-8.0`
		@objc public var epsilon: NSNumber? {
			get {
				return self.keyedValue("inputEpsilon")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StarShineGenerator.epsilonRange), forKey: "inputEpsilon")
			}
		}

		/// `epsilon` range definition
		public static let epsilonRange: PartialRangeFrom<Float> = Float(-8.0)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			center: CGPoint = StarShineGenerator.centerDefault,
			color: CIColor,
			radius: NSNumber = 50,
			crossScale: NSNumber = 15,
			crossAngle: NSNumber = 0.6,
			crossOpacity: NSNumber = -2,
			crossWidth: NSNumber = 2.5,
			epsilon: NSNumber = -2
		) {
			self.init()

			self.center = center
			self.color = color
			self.radius = radius
			self.crossScale = crossScale
			self.crossAngle = crossAngle
			self.crossOpacity = crossOpacity
			self.crossWidth = crossWidth
			self.epsilon = epsilon
		}
	}
}
