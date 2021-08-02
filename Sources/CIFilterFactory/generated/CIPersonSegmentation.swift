//
//  CIPersonSegmentation.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 12.0, iOS 15, *)
	@inlinable @objc static func PersonSegmentation() -> CIFilterFactory.CIPersonSegmentation? {
		return CIFilterFactory.CIPersonSegmentation()
	}
}

@available(macOS 12.0, iOS 15, *)
@objc public extension CIFilterFactory {
	///
	/// Person Segmentation
	///
	/// Returns a segmentation mask that is red in the portions of an image that are likely to be persons. The returned image may have a different size and aspect ratio from the input image.
	///
	/// **Links**
	///
	/// [CIPersonSegmentation Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPersonSegmentation)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPersonSegmentation/)
	///
	@objc(CIFilterFactory_CIPersonSegmentation) class CIPersonSegmentation: FilterCore {
		@objc public init?() {
			super.init(name: "CIPersonSegmentation")
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
		/// Determines the size and quality of the resulting segmentation mask. The value can be a number where 0 is accurate, 1 is balanced, and 2 is fast.
		///
		///   Class:    NSNumber
		@objc public dynamic var inputQualityLevel: NSNumber? {
			get {
				return self.filter.value(forKey: "inputQualityLevel") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputQualityLevel")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputQualityLevel: NSNumber
		) {
			self.init()

			self.inputImage = inputImage
			self.inputQualityLevel = inputQualityLevel
		}
	}
}
