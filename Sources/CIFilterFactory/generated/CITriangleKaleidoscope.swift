//
//  CITriangleKaleidoscope.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.10, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Triangle Kaleidoscope
	///
	/// Maps a triangular portion of image to a triangular area and then generates a kaleidoscope effect.
	///
	/// **Links**
	///
	/// [CITriangleKaleidoscope Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITriangleKaleidoscope)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CITriangleKaleidoscope/)
	///
	@objc(CIFilterFactory_CITriangleKaleidoscope) class CITriangleKaleidoscope: FilterCommon {
		@objc public init?() {
			super.init(name: "CITriangleKaleidoscope")
			self.filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// Input image to generate kaleidoscope effect from.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputPoint

		///
		/// The x and y position to use as the center of the triangular area in the input image.
		///
		@objc public var inputPoint: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint")
			}
		}

		// MARK: - inputSize

		///
		/// The size in pixels of the triangle.
		///
		@objc public var inputSize: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSize") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputSize")
			}
		}

		// MARK: - inputRotation

		///
		/// Rotation angle of the triangle.
		///
		@objc public var inputRotation: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRotation") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRotation")
			}
		}

		// MARK: - inputDecay

		///
		/// The decay determines how fast the color fades from the center triangle.
		///
		@objc public var inputDecay: NSNumber? {
			get {
				return self.filter.value(forKey: "inputDecay") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputDecay")
			}
		}
	}
}
