//
//  BlurredRoundedRectangleGenerator.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2026 Darren Ford. All rights reserved.
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

#if canImport(CoreImage)

	import AVFoundation
	import CoreImage
	import CoreML
	import Foundation

	@objc public extension CIFF {
		/// Blurred Rounded Rectangle Generator
		///
		/// Generates a blurred rounded rectangle image with the specified extent, corner radius, blur sigma, and color.
		///
		/// **CIFilter Name**
		/// - CIBlurredRoundedRectangleGenerator
		///
		/// **Availability**
		/// - macOS 16.0, iOS 19, tvOS 19
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - Generator (*CICategoryGenerator*)
		/// - HighDynamicRange (*CICategoryHighDynamicRange*)
		/// - StillImage (*CICategoryStillImage*)
		///
		/// **Documentation Links**
		/// - [CIBlurredRoundedRectangleGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlurredRoundedRectangleGenerator)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciblurredroundedrectanglegenerator)
		/// - [CIFilter.app documentation](https://cifilter.app/CIBlurredRoundedRectangleGenerator/)
		@available(macOS 16.0, iOS 19, tvOS 19, *)
		@objc(CIFFBlurredRoundedRectangleGenerator) class BlurredRoundedRectangleGenerator: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIBlurredRoundedRectangleGenerator")
			}

			// MARK: - extent (inputExtent)

			/// A rectangle that defines the extent of the effect.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputExtent`
			/// - Internal class: `CIVector`
			/// - Type: `CIAttributeTypeRectangle`
			/// - Default Value: `CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)`
			@objc public var extent: CGRect {
				get {
					self.cgRectValue(forKey: "inputExtent", defaultValue: Self.extentDefault)
				}
				set {
					self.setKeyedValue(newValue.ciVector, for: "inputExtent")
				}
			}

			/// `extent` default value
			@objc public static let extentDefault = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)

			// MARK: - radius (inputRadius)

			/// The distance from the center of the effect.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputRadius`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeDistance`
			/// - Minimum Value: `0.0`
			/// - Default Value: `10.0`
			@objc public var radius: Double {
				get {
					self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: BlurredRoundedRectangleGenerator.radiusRange, forKey: "inputRadius")
				}
			}

			/// `radius` default value
			@objc public static let radiusDefault: Double = 10.0

			/// `radius` range definition
			public static let radiusRange = PartialRangeFrom<Double>(0.0)

			// MARK: - smoothness (inputSmoothness)

			/// A value to control the smoothness of the transition between the curved and linear edges of the shape.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputSmoothness`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeDistance`
			/// - Minimum Value: `0.0`
			/// - Maximum Value: `1.0`
			/// - Default Value: `0.0`
			@objc public var smoothness: Double {
				get {
					self.doubleValue(forKey: "inputSmoothness", defaultValue: Self.smoothnessDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: BlurredRoundedRectangleGenerator.smoothnessRange, forKey: "inputSmoothness")
				}
			}

			/// `smoothness` default value
			@objc public static let smoothnessDefault: Double = 0.0

			/// `smoothness` range definition
			public static let smoothnessRange: ClosedRange<Double> = 0.0 ... 1.0

			// MARK: - sigma (inputSigma)

			/// The sigma for a gaussian blur.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputSigma`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeDistance`
			/// - Minimum Value: `0.0`
			/// - Default Value: `10.0`
			@objc public var sigma: Double {
				get {
					self.doubleValue(forKey: "inputSigma", defaultValue: Self.sigmaDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: BlurredRoundedRectangleGenerator.sigmaRange, forKey: "inputSigma")
				}
			}

			/// `sigma` default value
			@objc public static let sigmaDefault: Double = 10.0

			/// `sigma` range definition
			public static let sigmaRange = PartialRangeFrom<Double>(0.0)

			// MARK: - color (inputColor)

			/// A color.
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

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - extent: A rectangle that defines the extent of the effect.
			///   - radius: The distance from the center of the effect.
			///   - smoothness: A value to control the smoothness of the transition between the curved and linear edges of the shape.
			///   - sigma: The sigma for a gaussian blur.
			///   - color: A color.
			@objc public convenience init?(
				extent: CGRect = BlurredRoundedRectangleGenerator.extentDefault,
				radius: Double = BlurredRoundedRectangleGenerator.radiusDefault,
				smoothness: Double = BlurredRoundedRectangleGenerator.smoothnessDefault,
				sigma: Double = BlurredRoundedRectangleGenerator.sigmaDefault,
				color: CIColor
			) {
				self.init()
				self.extent = extent
				self.radius = radius
				self.smoothness = smoothness
				self.sigma = sigma
				self.color = color
			}
		}
	}

	@available(macOS 16.0, iOS 19, tvOS 19, *)
	public extension CIImage {
		/// Create a new CIImage using the 'Blurred Rounded Rectangle Generator' filter
		///
		/// - Parameters:
		///   - extent: A rectangle that defines the extent of the effect.
		///   - radius: The distance from the center of the effect. (0.0...)
		///   - smoothness: A value to control the smoothness of the transition between the curved and linear edges of the shape. (0.0...1.0)
		///   - sigma: The sigma for a gaussian blur. (0.0...)
		///   - color: A color.
		/// - Returns: A new image by running the filter, or nil if the image could not be created
		///
		/// Generates a blurred rounded rectangle image with the specified extent, corner radius, blur sigma, and color.
		///
		/// **Categories**: BuiltIn, Generator, HighDynamicRange, StillImage
		///
		/// **Documentation Links**
		/// - [CIBlurredRoundedRectangleGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlurredRoundedRectangleGenerator)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciblurredroundedrectanglegenerator)
		/// - [CIFilter.app documentation](https://cifilter.app/CIBlurredRoundedRectangleGenerator/)
		@inlinable static func createUsingBlurredRoundedRectangleGenerator(
			extent: CGRect = CIFF.BlurredRoundedRectangleGenerator.extentDefault,
			radius: Double = CIFF.BlurredRoundedRectangleGenerator.radiusDefault,
			smoothness: Double = CIFF.BlurredRoundedRectangleGenerator.smoothnessDefault,
			sigma: Double = CIFF.BlurredRoundedRectangleGenerator.sigmaDefault,
			color: CIColor
		) -> CIImage? {
			return CIFF.BlurredRoundedRectangleGenerator(
				extent: extent,
				radius: radius,
				smoothness: smoothness,
				sigma: sigma,
				color: color
			)?.outputImage
		}
	}

#endif // canImport(CoreImage)
