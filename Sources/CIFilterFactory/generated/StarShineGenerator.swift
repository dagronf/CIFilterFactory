//
//  StarShineGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Star Shine
	///
	/// Generates a starburst pattern. The output image is typically used as input to another filter.
	///
	/// **CIFilter Name**
	/// - CIStarShineGenerator
	///
	/// **Availability**
	/// - macOS 10.4, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Generator (*CICategoryGenerator*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIStarShineGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStarShineGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIStarShineGenerator/)
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFStarShineGenerator) class StarShineGenerator: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIStarShineGenerator")
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

		/// The color to use for the outer shell of the circular star.
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

		// MARK: - radius (inputRadius)

		/// The radius of the star.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `50.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: StarShineGenerator.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 50.0

		/// `radius` range definition
		public static let radiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - crossScale (inputCrossScale)

		/// The size of the cross pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCrossScale`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `15.0`
		@objc public var crossScale: Double {
			get {
				self.doubleValue(forKey: "inputCrossScale", defaultValue: Self.crossScaleDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: StarShineGenerator.crossScaleRange, forKey: "inputCrossScale")
			}
		}

		/// `crossScale` default value
		@objc public static let crossScaleDefault: Double = 15.0

		/// `crossScale` range definition
		public static let crossScaleRange = PartialRangeFrom<Double>(0.0)

		// MARK: - crossAngle (inputCrossAngle)

		/// The angle in radians of the cross pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCrossAngle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `0.6`
		@objc public var crossAngle: Double {
			get {
				self.doubleValue(forKey: "inputCrossAngle", defaultValue: Self.crossAngleDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputCrossAngle")
			}
		}

		/// `crossAngle` default value
		@objc public static let crossAngleDefault: Double = 0.6

		// MARK: - crossOpacity (inputCrossOpacity)

		/// The opacity of the cross pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCrossOpacity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `-8.0`
		/// - Default Value: `-2.0`
		@objc public var crossOpacity: Double {
			get {
				self.doubleValue(forKey: "inputCrossOpacity", defaultValue: Self.crossOpacityDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: StarShineGenerator.crossOpacityRange, forKey: "inputCrossOpacity")
			}
		}

		/// `crossOpacity` default value
		@objc public static let crossOpacityDefault: Double = -2.0

		/// `crossOpacity` range definition
		public static let crossOpacityRange = PartialRangeFrom<Double>(-8.0)

		// MARK: - crossWidth (inputCrossWidth)

		/// The width of the cross pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCrossWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `2.5`
		@objc public var crossWidth: Double {
			get {
				self.doubleValue(forKey: "inputCrossWidth", defaultValue: Self.crossWidthDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: StarShineGenerator.crossWidthRange, forKey: "inputCrossWidth")
			}
		}

		/// `crossWidth` default value
		@objc public static let crossWidthDefault: Double = 2.5

		/// `crossWidth` range definition
		public static let crossWidthRange = PartialRangeFrom<Double>(0.0)

		// MARK: - epsilon (inputEpsilon)

		/// The length of the cross spikes.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputEpsilon`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `-8.0`
		/// - Default Value: `-2.0`
		@objc public var epsilon: Double {
			get {
				self.doubleValue(forKey: "inputEpsilon", defaultValue: Self.epsilonDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: StarShineGenerator.epsilonRange, forKey: "inputEpsilon")
			}
		}

		/// `epsilon` default value
		@objc public static let epsilonDefault: Double = -2.0

		/// `epsilon` range definition
		public static let epsilonRange = PartialRangeFrom<Double>(-8.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - color: The color to use for the outer shell of the circular star.
		///   - radius: The radius of the star.
		///   - crossScale: The size of the cross pattern.
		///   - crossAngle: The angle in radians of the cross pattern.
		///   - crossOpacity: The opacity of the cross pattern.
		///   - crossWidth: The width of the cross pattern.
		///   - epsilon: The length of the cross spikes.
		@objc public convenience init?(
			center: CGPoint = StarShineGenerator.centerDefault,
			color: CIColor,
			radius: Double = StarShineGenerator.radiusDefault,
			crossScale: Double = StarShineGenerator.crossScaleDefault,
			crossAngle: Double = StarShineGenerator.crossAngleDefault,
			crossOpacity: Double = StarShineGenerator.crossOpacityDefault,
			crossWidth: Double = StarShineGenerator.crossWidthDefault,
			epsilon: Double = StarShineGenerator.epsilonDefault
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

@available(macOS 10.4, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Create a new CIImage using the 'Star Shine' filter
	///
	/// - Parameters:
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - color: The color to use for the outer shell of the circular star.
	///   - radius: The radius of the star. (0.0...)
	///   - crossScale: The size of the cross pattern. (0.0...)
	///   - crossAngle: The angle in radians of the cross pattern.
	///   - crossOpacity: The opacity of the cross pattern. (-8.0...)
	///   - crossWidth: The width of the cross pattern. (0.0...)
	///   - epsilon: The length of the cross spikes. (-8.0...)
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generates a starburst pattern. The output image is typically used as input to another filter.
	///
	/// **Categories**: BuiltIn, Generator, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIStarShineGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStarShineGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIStarShineGenerator/)
	@inlinable static func createUsingStarShineGenerator(
		center: CGPoint = CIFF.StarShineGenerator.centerDefault,
		color: CIColor,
		radius: Double = CIFF.StarShineGenerator.radiusDefault,
		crossScale: Double = CIFF.StarShineGenerator.crossScaleDefault,
		crossAngle: Double = CIFF.StarShineGenerator.crossAngleDefault,
		crossOpacity: Double = CIFF.StarShineGenerator.crossOpacityDefault,
		crossWidth: Double = CIFF.StarShineGenerator.crossWidthDefault,
		epsilon: Double = CIFF.StarShineGenerator.epsilonDefault
	) -> CIImage? {
		return CIFF.StarShineGenerator(
			center: center,
			color: color,
			radius: radius,
			crossScale: crossScale,
			crossAngle: crossAngle,
			crossOpacity: crossOpacity,
			crossWidth: crossWidth,
			epsilon: epsilon
		)?.outputImage
	}
}
