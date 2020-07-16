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
	@objc(CIFilterFactory_CITriangleKaleidoscope) class CITriangleKaleidoscope: FilterCore {
		@objc public init?() {
			super.init(name: "CITriangleKaleidoscope")
		}

		// MARK: - Inputs

		///
		/// Input image to generate kaleidoscope effect from.
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
		/// The x and y position to use as the center of the triangular area in the input image.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [150 150]
		@objc public dynamic var inputPoint: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputPoint")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputPoint")
			}
		}

		///
		/// The size in pixels of the triangle.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  700
		@objc public dynamic var inputSize: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSize") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputSize")
			}
		}

		///
		/// Rotation angle of the triangle.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  5.924285296593801
		@objc public dynamic var inputRotation: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRotation") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRotation")
			}
		}

		///
		/// The decay determines how fast the color fades from the center triangle.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.85
		@objc public dynamic var inputDecay: NSNumber? {
			get {
				return self.filter.value(forKey: "inputDecay") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputDecay")
			}
		}
	}
}
