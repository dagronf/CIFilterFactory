//
//  PersonSegmentation.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2023 Darren Ford. All rights reserved.
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
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Stylize (*CICategoryStylize*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIPersonSegmentation Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPersonSegmentation)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPersonSegmentation/)
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
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `0`
		/// - Maximum Value: `2`
		/// - Default Value: `0`
		@objc public var qualityLevel: Int {
			get {
				self.intValue(forKey: "inputQualityLevel", defaultValue: Self.qualityLevelDefault)
			}
			set {
				self.setIntValue(newValue, bounds: PersonSegmentation.qualityLevelRange, forKey: "inputQualityLevel")
			}
		}

		/// `qualityLevel` default value
		@objc public static let qualityLevelDefault: Int = 0

		/// `qualityLevel` range definition
		public static let qualityLevelRange: ClosedRange<Int> = 0 ... 2

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - qualityLevel: Determines the size and quality of the resulting segmentation mask. The value can be a number where 0 is accurate, 1 is balanced, and 2 is fast.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			qualityLevel: Int = PersonSegmentation.qualityLevelDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.qualityLevel = qualityLevel
		}
	}
}

@available(macOS 12.0, iOS 15, tvOS 15, *)
public extension CIImage {
	/// Apply the 'Person Segmentation' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - qualityLevel: Determines the size and quality of the resulting segmentation mask. The value can be a number where 0 is accurate, 1 is balanced, and 2 is fast. (0...2)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Returns a segmentation mask that is red in the portions of an image that are likely to be persons. The returned image may have a different size and aspect ratio from the input image.
	///
	/// **Categories**: BuiltIn, StillImage, Stylize, Video
	///
	/// **Documentation Links**
	/// - [CIPersonSegmentation Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPersonSegmentation)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPersonSegmentation/)
	@inlinable func applyingPersonSegmentation(
		qualityLevel: Int = CIFF.PersonSegmentation.qualityLevelDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.PersonSegmentation(
			inputImage: self,
			qualityLevel: qualityLevel
		)?.outputImage ?? CIImage.empty()
	}
}
