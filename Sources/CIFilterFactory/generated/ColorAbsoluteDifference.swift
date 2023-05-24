//
//  ColorAbsoluteDifference.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Absolute Difference
	///
	/// Produces an image that is the absolute value of the color difference between two images. The alpha channel of the result will be the product of the two image alpha channels.
	///
	/// **CIFilter Name**
	/// - CIColorAbsoluteDifference
	///
	/// **Availability**
	/// - macOS 11.0, iOS 14, tvOS 14
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorAdjustment (*CICategoryColorAdjustment*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIColorAbsoluteDifference Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorAbsoluteDifference)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorAbsoluteDifference/)
	@available(macOS 11.0, iOS 14, tvOS 14, *)
	@objc(CIFFColorAbsoluteDifference) class ColorAbsoluteDifference: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIColorAbsoluteDifference")
		}

		// MARK: - inputImage (inputImage)

		/// The first input image for differencing.
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

		/// The second input image for differencing.
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
		///   - inputImage: The first input image for differencing.
		///   - image2: The second input image for differencing.
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

@available(macOS 11.0, iOS 14, tvOS 14, *)
public extension CIImage {
	/// Apply the 'Color Absolute Difference' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - image2: The second input image for differencing.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Produces an image that is the absolute value of the color difference between two images. The alpha channel of the result will be the product of the two image alpha channels.
	///
	/// **Categories**: BuiltIn, ColorAdjustment, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIColorAbsoluteDifference Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorAbsoluteDifference)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorAbsoluteDifference/)
	@inlinable func applyingColorAbsoluteDifference(
		image2: CIImage,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ColorAbsoluteDifference(
			inputImage: self,
			image2: image2
		)?.outputImage ?? CIImage.empty()
	}
}
