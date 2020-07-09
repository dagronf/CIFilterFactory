//
//  CIPerspectiveTile.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Perspective Tile
	///
	/// Applies a perspective transform to an image and then tiles the result.
	///
	/// **Links**
	///
	/// [CIPerspectiveTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPerspectiveTile/)
	///
	@objc(CIFilterFactory_CIPerspectiveTile) class CIPerspectiveTile: Core {
		@objc public init?() {
			super.init(name: "CIPerspectiveTile")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputTopLeft

		///
		/// The top left coordinate of a tile.
		///
		@objc public var inputTopLeft: CIVector? {
			get {
				return filter.value(forKey: "inputTopLeft") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputTopLeft")
			}
		}

		// MARK: - inputTopRight

		///
		/// The top right coordinate of a tile.
		///
		@objc public var inputTopRight: CIVector? {
			get {
				return filter.value(forKey: "inputTopRight") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputTopRight")
			}
		}

		// MARK: - inputBottomRight

		///
		/// The bottom right coordinate of a tile.
		///
		@objc public var inputBottomRight: CIVector? {
			get {
				return filter.value(forKey: "inputBottomRight") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputBottomRight")
			}
		}

		// MARK: - inputBottomLeft

		///
		/// The bottom left coordinate of a tile.
		///
		@objc public var inputBottomLeft: CIVector? {
			get {
				return filter.value(forKey: "inputBottomLeft") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputBottomLeft")
			}
		}
	}
}
