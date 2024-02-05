//
//  FourfoldRotatedTile.swift  (AUTOMATICALLY GENERATED FILE)
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
		/// Fourfold Rotated Tile
		///
		/// Produces a tiled image from a source image by rotating the source at increments of 90 degrees.
		///
		/// **CIFilter Name**
		/// - CIFourfoldRotatedTile
		///
		/// **Availability**
		/// - macOS 10.5, iOS 6, tvOS 6
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - HighDynamicRange (*CICategoryHighDynamicRange*)
		/// - StillImage (*CICategoryStillImage*)
		/// - TileEffect (*CICategoryTileEffect*)
		/// - Video (*CICategoryVideo*)
		///
		/// **Documentation Links**
		/// - [CIFourfoldRotatedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldRotatedTile)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cifourfoldrotatedtile)
		@available(macOS 10.5, iOS 6, tvOS 6, *)
		@objc(CIFFFourfoldRotatedTile) class FourfoldRotatedTile: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIFourfoldRotatedTile")
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

			// MARK: - angle (inputAngle)

			/// The angle in radians of the tiled pattern.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputAngle`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeAngle`
			/// - Default Value: `0.0`
			@objc public var angle: Double {
				get {
					self.doubleValue(forKey: "inputAngle", defaultValue: Self.angleDefault)
				}
				set {
					self.setKeyedValue(NSNumber(value: newValue), for: "inputAngle")
				}
			}

			/// `angle` default value
			@objc public static let angleDefault: Double = 0.0

			// MARK: - width (inputWidth)

			/// The width of a tile.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputWidth`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeDistance`
			/// - Minimum Value: `0.0`
			/// - Default Value: `100.0`
			@objc public var width: Double {
				get {
					self.doubleValue(forKey: "inputWidth", defaultValue: Self.widthDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: FourfoldRotatedTile.widthRange, forKey: "inputWidth")
				}
			}

			/// `width` default value
			@objc public static let widthDefault: Double = 100.0

			/// `width` range definition
			public static let widthRange = PartialRangeFrom<Double>(0.0)

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - inputImage: The image to use as an input for the effect.
			///   - center: The center of the effect as x and y pixel coordinates.
			///   - angle: The angle in radians of the tiled pattern.
			///   - width: The width of a tile.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				center: CGPoint = FourfoldRotatedTile.centerDefault,
				angle: Double = FourfoldRotatedTile.angleDefault,
				width: Double = FourfoldRotatedTile.widthDefault
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				self.center = center
				self.angle = angle
				self.width = width
			}
		}
	}

	@available(macOS 10.5, iOS 6, tvOS 6, *)
	public extension CIImage {
		/// Apply the 'Fourfold Rotated Tile' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - angle: The angle in radians of the tiled pattern.
		///   - width: The width of a tile. (0.0...)
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Produces a tiled image from a source image by rotating the source at increments of 90 degrees.
		///
		/// **Categories**: BuiltIn, HighDynamicRange, StillImage, TileEffect, Video
		///
		/// **Documentation Links**
		/// - [CIFourfoldRotatedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldRotatedTile)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cifourfoldrotatedtile)
		@inlinable func applyingFourfoldRotatedTile(
			center: CGPoint = CIFF.FourfoldRotatedTile.centerDefault,
			angle: Double = CIFF.FourfoldRotatedTile.angleDefault,
			width: Double = CIFF.FourfoldRotatedTile.widthDefault,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.FourfoldRotatedTile(
				inputImage: self,
				center: center,
				angle: angle,
				width: width
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
