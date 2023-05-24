//
//  LabDeltaE.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Lab ∆E
	///
	/// Produces an image with the Lab ∆E difference values between two images. The result image will contain ∆E 1994 values between 0.0 and 100.0 where 2.0 is considered a just noticeable difference.
	///
	/// **CIFilter Name**
	/// - CILabDeltaE
	///
	/// **Availability**
	/// - macOS 10.13, iOS 11, tvOS 11
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorEffect (*CICategoryColorEffect*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CILabDeltaE Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILabDeltaE)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CILabDeltaE/)
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFLabDeltaE) class LabDeltaE: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CILabDeltaE")
		}

		// MARK: - inputImage (inputImage)

		/// The first input image for comparison.
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

		// MARK: - image2 (inputImage2)

		/// The second input image for comparison.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage2`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image2: CIImage? {
			get {
				self.keyedValue("inputImage2")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage2")
			}
		}

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The first input image for comparison.
		///   - image2: The second input image for comparison.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			image2: CIImage? = nil
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let image2 = image2 {
				self.image2 = image2
			}
		}
	}
}

@available(macOS 10.13, iOS 11, tvOS 11, *)
public extension CIImage {
	/// Apply the 'Lab ∆E' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - image2: The second input image for comparison.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Produces an image with the Lab ∆E difference values between two images. The result image will contain ∆E 1994 values between 0.0 and 100.0 where 2.0 is considered a just noticeable difference.
	///
	/// **Categories**: BuiltIn, ColorEffect, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CILabDeltaE Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILabDeltaE)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CILabDeltaE/)
	@inlinable func applyingLabDeltaE(
		image2: CIImage,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.LabDeltaE(
			inputImage: self,
			image2: image2
		)?.outputImage ?? CIImage.empty()
	}
}
