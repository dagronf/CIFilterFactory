//
//  PersonSegmentation.swift  (AUTOMATICALLY GENERATED FILE)
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

import AVFoundation
import CoreImage
import CoreML
import Foundation

@objc public extension CIFF {
	/// Person Segmentation
	///
	/// Returns a segmentation mask that is red in the portions of an image that are likely to be persons. The returned image may have a different size and aspect ratio from the input image.
	///
	/// **CIFilter Name**
	/// - CIPersonSegmentation
	///
	/// **Availability**
	/// - macOS 12.0, iOS 15, tvOS 15
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryStillImage
	/// - CICategoryStylize
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIPersonSegmentation Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPersonSegmentation)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cipersonsegmentation?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPersonSegmentation/)
	///
	@available(macOS 12.0, iOS 15, tvOS 15, *)
	@objc(CIFFPersonSegmentation) class PersonSegmentation: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIPersonSegmentation")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input for the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
			get {
				self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - qualityLevel (inputQualityLevel)

		/// Determines the size and quality of the resulting segmentation mask. The value can be a number where 0 is accurate, 1 is balanced, and 2 is fast.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputQualityLevel`
		/// - Internal class: `NSNumber`
		@objc public var qualityLevel: NSNumber? {
			get {
				self.keyedValue("inputQualityLevel")
			}
			set {
				self.setKeyedValue(newValue, for: "inputQualityLevel")
			}
		}

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - qualityLevel: Determines the size and quality of the resulting segmentation mask. The value can be a number where 0 is accurate, 1 is balanced, and 2 is fast.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			qualityLevel: NSNumber
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.qualityLevel = qualityLevel
		}
	}
}
