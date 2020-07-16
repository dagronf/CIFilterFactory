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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Op Tile
	///
	/// Segments an image, applying any specified scaling and rotation, and then assembles the image again to give an op art appearance.
	///
	/// **Links**
	///
	/// [CIOpTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIOpTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIOpTile/)
	///
	@objc(CIFilterFactory_CIOpTile) class CIOpTile: FilterCommon {
		@objc public init?() {
			super.init(name: "CIOpTile")
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class: CIImage, Type: CIAttributeTypeImage
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputCenter

		///
		/// The x and y position to use as the center of the effect
		///
		///   Class: CIVector, Type: CIAttributeTypePosition
		///
		@objc public var inputCenter: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputCenter")
			}
			set {
				self.filter.setValue(newValue?.point, forKey: "inputCenter")
			}
		}

		// MARK: - inputScale

		///
		/// The scale determines the number of tiles in the effect.
		///
		///   Class: NSNumber, Type: CIAttributeTypeScalar
		///
		///   minValue: 0.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputScale_Range), forKey: "inputScale")
			}
		}

		// MARK: - inputAngle

		///
		/// The angle of a tile.
		///
		///   Class: NSNumber, Type: CIAttributeTypeAngle
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		// MARK: - inputWidth

		///
		/// The width of a tile.
		///
		///   Class: NSNumber, Type: CIAttributeTypeDistance
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputWidth_Range), forKey: "inputWidth")
			}
		}
	}
}
