//
//  CIOpTile.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, tvOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Op Tile
	///
	/// Segments an image, applying any specified scaling and rotation, and then assembles the image again to give an op art appearance.
	///
	/// **Links**
	///
	/// - [CIOpTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIOpTile)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cioptile?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIOpTile/)
	///
	@objc(CIFilterFactory_OpTile) class OpTile: FilterCore {
		@objc public init?() {
			super.init(name: "CIOpTile")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   - Attribute key: `inputImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - center (inputCenter)

		///
		/// The x and y position to use as the center of the effect
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

		// MARK: - scale (inputScale)

		///
		/// The scale determines the number of tiles in the effect.
		///
		///   - Attribute key: `inputScale`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `2.8`
		///   minValue: 0.0
		///
		public static let scale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var scale: NSNumber? {
			get {
				return self.keyedValue("inputScale")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: OpTile.scale_Range), forKey: "inputScale")
			}
		}

		// MARK: - angle (inputAngle)

		///
		/// The angle of a tile.
		///
		///   - Attribute key: `inputAngle`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `0`
		@objc public var angle: NSNumber? {
			get {
				return self.keyedValue("inputAngle")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAngle")
			}
		}

		// MARK: - width (inputWidth)

		///
		/// The width of a tile.
		///
		///   - Attribute key: `inputWidth`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `65`
		///   minValue: 0.0
		///
		public static let width_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var width: NSNumber? {
			get {
				return self.keyedValue("inputWidth")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: OpTile.width_Range), forKey: "inputWidth")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			center: CGPoint = OpTile.center_default,
			scale: NSNumber = 2.8,
			angle: NSNumber = 0,
			width: NSNumber = 65
		) {
			self.init()

			self.image = image
			self.center = center
			self.scale = scale
			self.angle = angle
			self.width = width
		}
	}
}
