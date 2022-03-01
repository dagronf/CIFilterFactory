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

@available(macOS 12.0, iOS 15, tvOS 15, *)
@objc public extension CIFilterFactory {
	///
	/// Person Segmentation
	///
	/// Returns a segmentation mask that is red in the portions of an image that are likely to be persons. The returned image may have a different size and aspect ratio from the input image.
	///
	/// **Links**
	///
	/// - [CIPersonSegmentation Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPersonSegmentation)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cipersonsegmentation?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPersonSegmentation/)
	///
	@objc(CIFilterFactory_PersonSegmentation) class PersonSegmentation: FilterCore {
		@objc public init?() {
			super.init(name: "CIPersonSegmentation")
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

		// MARK: - qualityLevel (inputQualityLevel)

		///
		/// Determines the size and quality of the resulting segmentation mask. The value can be a number where 0 is accurate, 1 is balanced, and 2 is fast.
		///
		///   - Attribute key: `inputQualityLevel`
		///   - Internal class: `NSNumber`
		@objc public var qualityLevel: NSNumber? {
			get {
				return self.keyedValue("inputQualityLevel")
			}
			set {
				self.setKeyedValue(newValue, for: "inputQualityLevel")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			qualityLevel: NSNumber
		) {
			self.init()

			self.image = image
			self.qualityLevel = qualityLevel
		}
	}
}
