//
//  BlurredRectangleGenerator.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2024 Darren Ford. All rights reserved.
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
		/// Blurred Rectangle Generator
		///
		/// Generates a blurred rectangle image with the specified extent, blur sigma, and color.
		///
		/// **CIFilter Name**
		/// - CIBlurredRectangleGenerator
		///
		/// **Availability**
		/// - macOS 14.0, iOS 17, tvOS 17
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - Generator (*CICategoryGenerator*)
		/// - HighDynamicRange (*CICategoryHighDynamicRange*)
		/// - StillImage (*CICategoryStillImage*)
		///
		/// **Documentation Links**
		/// - [CIBlurredRectangleGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlurredRectangleGenerator)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciblurredrectanglegenerator)
		/// - [CIFilter.app documentation](https://cifilter.app/CIBlurredRectangleGenerator/)
		@available(macOS 14.0, iOS 17, tvOS 17, *)
		@objc(CIFFBlurredRectangleGenerator) class BlurredRectangleGenerator: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIBlurredRectangleGenerator")
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
					self.setDoubleValue(newValue, bounds: BlurredRectangleGenerator.sigmaRange, forKey: "inputSigma")
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
			///   - sigma: The sigma for a gaussian blur.
			///   - color: A color.
			@objc public convenience init?(
				extent: CGRect = BlurredRectangleGenerator.extentDefault,
				sigma: Double = BlurredRectangleGenerator.sigmaDefault,
				color: CIColor
			) {
				self.init()
				self.extent = extent
				self.sigma = sigma
				self.color = color
			}
		}
	}

	@available(macOS 14.0, iOS 17, tvOS 17, *)
	public extension CIImage {
		/// Create a new CIImage using the 'Blurred Rectangle Generator' filter
		///
		/// - Parameters:
		///   - extent: A rectangle that defines the extent of the effect.
		///   - sigma: The sigma for a gaussian blur. (0.0...)
		///   - color: A color.
		/// - Returns: A new image by running the filter, or nil if the image could not be created
		///
		/// Generates a blurred rectangle image with the specified extent, blur sigma, and color.
		///
		/// **Categories**: BuiltIn, Generator, HighDynamicRange, StillImage
		///
		/// **Documentation Links**
		/// - [CIBlurredRectangleGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlurredRectangleGenerator)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciblurredrectanglegenerator)
		/// - [CIFilter.app documentation](https://cifilter.app/CIBlurredRectangleGenerator/)
		@inlinable static func createUsingBlurredRectangleGenerator(
			extent: CGRect = CIFF.BlurredRectangleGenerator.extentDefault,
			sigma: Double = CIFF.BlurredRectangleGenerator.sigmaDefault,
			color: CIColor
		) -> CIImage? {
			return CIFF.BlurredRectangleGenerator(
				extent: extent,
				sigma: sigma,
				color: color
			)?.outputImage
		}
	}

#endif // canImport(CoreImage)
