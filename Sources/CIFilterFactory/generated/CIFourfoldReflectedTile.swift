//
//  CIFourfoldReflectedTile.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Fourfold Reflected Tile
	///
	/// Produces a tiled image from a source image by applying a 4-way reflected symmetry.
	///
	/// **Links**
	///
	/// [CIFourfoldReflectedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldReflectedTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIFourfoldReflectedTile/)
	///
	@objc(CIFilterFactory_CIFourfoldReflectedTile) class CIFourfoldReflectedTile: FilterCommon {
		@objc public init?() {
			super.init(name: "CIFourfoldReflectedTile")
		}

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The x and y position to use as the center of the effect
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [150 150]
		@objc public dynamic var inputCenter: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputCenter")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  0
		@objc public dynamic var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  100
		///   minValue: 0.0
		///
		static let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIFourfoldReflectedTile.inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The primary angle for the repeating reflected tile. Small values create thin diamond tiles, and higher values create fatter reflected tiles.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  1.570796326794897
		@objc public dynamic var inputAcuteAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAcuteAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAcuteAngle")
			}
		}
	}
}
