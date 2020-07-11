//
//  CIMorphologyRectangleMaximum.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Morphology Rectangle Maximum
	///
	/// Lightens areas of an image by applying a rectangular morphological maximum operation to the image.
	///
	/// **Links**
	///
	/// [CIMorphologyRectangleMaximum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyRectangleMaximum)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMorphologyRectangleMaximum/)
	///
	@objc(CIFilterFactory_CIMorphologyRectangleMaximum) class CIMorphologyRectangleMaximum: FilterCommon {
		@objc public init?() {
			super.init(name: "CIMorphologyRectangleMaximum")
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputWidth

		///
		/// The width in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///
		///   minValue: 1.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputWidth_Range), forKey: "inputWidth")
			}
		}

		// MARK: - inputHeight

		///
		/// The height in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///
		///   minValue: 1.0
		///
		let inputHeight_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputHeight_Range), forKey: "inputHeight")
			}
		}
	}
}
