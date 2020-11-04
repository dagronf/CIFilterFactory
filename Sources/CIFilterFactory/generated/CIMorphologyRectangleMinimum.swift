//
//  CIMorphologyRectangleMinimum.swift  (AUTOMATICALLY GENERATED FILE)
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

public extension CIFilter {
	@available(macOS 10.15, iOS 13, *)
	@inlinable @objc static func MorphologyRectangleMinimum() -> CIFilterFactory.CIMorphologyRectangleMinimum? {
		return CIFilterFactory.CIMorphologyRectangleMinimum()
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Morphology Rectangle Minimum
	///
	/// Darkens areas of an image by applying a rectangular morphological maximum operation to the image.
	///
	/// **Links**
	///
	/// [CIMorphologyRectangleMinimum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyRectangleMinimum)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMorphologyRectangleMinimum/)
	///
	@objc(CIFilterFactory_CIMorphologyRectangleMinimum) class CIMorphologyRectangleMinimum: FilterCore {
		@objc public init?() {
			super.init(name: "CIMorphologyRectangleMinimum")
		}

		// MARK: - Inputs

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
		/// The width in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeInteger
		///   Default:  5
		///   minValue: 1.0
		///
		static let inputWidth_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public dynamic var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIMorphologyRectangleMinimum.inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The height in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeInteger
		///   Default:  5
		///   minValue: 1.0
		///
		static let inputHeight_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public dynamic var inputHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIMorphologyRectangleMinimum.inputHeight_Range), forKey: "inputHeight")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputWidth: NSNumber = 5,
			inputHeight: NSNumber = 5
		) {
			self.init()

			self.inputImage = inputImage
			self.inputWidth = inputWidth
			self.inputHeight = inputHeight
		}
	}
}
