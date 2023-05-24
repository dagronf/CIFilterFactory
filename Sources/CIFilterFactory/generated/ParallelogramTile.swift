//
//  ParallelogramTile.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Parallelogram Tile
	///
	/// Warps an image by reflecting it in a parallelogram, and then tiles the result.
	///
	/// **CIFilter Name**
	/// - CIParallelogramTile
	///
	/// **Availability**
	/// - macOS 10.4, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - TileEffect (*CICategoryTileEffect*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIParallelogramTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIParallelogramTile)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIParallelogramTile/)
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFParallelogramTile) class ParallelogramTile: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIParallelogramTile")
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

		// MARK: - acuteAngle (inputAcuteAngle)

		/// The primary angle for the repeating parallelogram tile. Small values create thin diamond tiles, and higher values create fatter parallelogram tiles.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAcuteAngle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `1.5707963267948966`
		@objc public var acuteAngle: Double {
			get {
				self.doubleValue(forKey: "inputAcuteAngle", defaultValue: Self.acuteAngleDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputAcuteAngle")
			}
		}

		/// `acuteAngle` default value
		@objc public static let acuteAngleDefault: Double = 1.5707963267948966

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
				self.setDoubleValue(newValue, bounds: ParallelogramTile.widthRange, forKey: "inputWidth")
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
		///   - acuteAngle: The primary angle for the repeating parallelogram tile. Small values create thin diamond tiles, and higher values create fatter parallelogram tiles.
		///   - width: The width of a tile.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			center: CGPoint = ParallelogramTile.centerDefault,
			angle: Double = ParallelogramTile.angleDefault,
			acuteAngle: Double = ParallelogramTile.acuteAngleDefault,
			width: Double = ParallelogramTile.widthDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.center = center
			self.angle = angle
			self.acuteAngle = acuteAngle
			self.width = width
		}
	}
}

@available(macOS 10.4, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Parallelogram Tile' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - angle: The angle in radians of the tiled pattern.
	///   - acuteAngle: The primary angle for the repeating parallelogram tile. Small values create thin diamond tiles, and higher values create fatter parallelogram tiles.
	///   - width: The width of a tile. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Warps an image by reflecting it in a parallelogram, and then tiles the result.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, TileEffect, Video
	///
	/// **Documentation Links**
	/// - [CIParallelogramTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIParallelogramTile)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIParallelogramTile/)
	@inlinable func applyingParallelogramTile(
		center: CGPoint = CIFF.ParallelogramTile.centerDefault,
		angle: Double = CIFF.ParallelogramTile.angleDefault,
		acuteAngle: Double = CIFF.ParallelogramTile.acuteAngleDefault,
		width: Double = CIFF.ParallelogramTile.widthDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ParallelogramTile(
			inputImage: self,
			center: center,
			angle: angle,
			acuteAngle: acuteAngle,
			width: width
		)?.outputImage ?? CIImage.empty()
	}
}
