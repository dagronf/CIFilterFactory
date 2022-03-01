//
//  CIStarShineGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, tvOS 6, *)
@objc public extension CIFilterFactory {
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
	@objc(CIFilterFactory_StarShineGenerator) class StarShineGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CIStarShineGenerator")
		}

		// MARK: - Inputs

		// MARK: - center (inputCenter)

		///
		/// The x and y position to use as the center of the star.
		///
		///   - Attribute key: `inputCenter`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[150 150]`
		@objc public var center: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputCenter", defaultValue: Self.center_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// center default value
		@objc public static let center_default = CGPoint(x: 150.0, y: 150.0)

		// MARK: - color (inputColor)

		///
		/// The color to use for the outer shell of the circular star.
		///
		///   - Attribute key: `inputColor`
		///   - Internal class: `CIColor`
		///   - Default value: `rgba(1 0.8 0.6 1`)
		@objc public var color: CIColor? {
			get {
				return self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		// MARK: - radius (inputRadius)

		///
		/// The radius of the star.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `50`
		///   minValue: 0.0
		///
		public static let radius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StarShineGenerator.radius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - crossScale (inputCrossScale)

		///
		/// The size of the cross pattern.
		///
		///   - Attribute key: `inputCrossScale`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `15`
		///   minValue: 0.0
		///
		public static let crossScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var crossScale: NSNumber? {
			get {
				return self.keyedValue("inputCrossScale")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StarShineGenerator.crossScale_Range), forKey: "inputCrossScale")
			}
		}

		// MARK: - crossAngle (inputCrossAngle)

		///
		/// The angle of the cross pattern.
		///
		///   - Attribute key: `inputCrossAngle`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `0.6`
		@objc public var crossAngle: NSNumber? {
			get {
				return self.keyedValue("inputCrossAngle")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCrossAngle")
			}
		}

		// MARK: - crossOpacity (inputCrossOpacity)

		///
		/// The opacity of the cross pattern.
		///
		///   - Attribute key: `inputCrossOpacity`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `-2`
		///   minValue: -8.0
		///
		public static let crossOpacity_Range: PartialRangeFrom<Float> = Float(-8.0)...
		@objc public var crossOpacity: NSNumber? {
			get {
				return self.keyedValue("inputCrossOpacity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StarShineGenerator.crossOpacity_Range), forKey: "inputCrossOpacity")
			}
		}

		// MARK: - crossWidth (inputCrossWidth)

		///
		/// The width of the cross pattern.
		///
		///   - Attribute key: `inputCrossWidth`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `2.5`
		///   minValue: 0.0
		///
		public static let crossWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var crossWidth: NSNumber? {
			get {
				return self.keyedValue("inputCrossWidth")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StarShineGenerator.crossWidth_Range), forKey: "inputCrossWidth")
			}
		}

		// MARK: - epsilon (inputEpsilon)

		///
		/// The length of the cross spikes.
		///
		///   - Attribute key: `inputEpsilon`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `-2`
		///   minValue: -8.0
		///
		public static let epsilon_Range: PartialRangeFrom<Float> = Float(-8.0)...
		@objc public var epsilon: NSNumber? {
			get {
				return self.keyedValue("inputEpsilon")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: StarShineGenerator.epsilon_Range), forKey: "inputEpsilon")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			center: CGPoint = StarShineGenerator.center_default,
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
