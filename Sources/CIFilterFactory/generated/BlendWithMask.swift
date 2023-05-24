//
//  BlendWithMask.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Blend With Mask
	///
	/// Uses values from a grayscale mask to interpolate between an image and the background. When a mask green value is 0.0, the result is the background. When the mask green value is 1.0, the result is the image.
	///
	/// **CIFilter Name**
	/// - CIBlendWithMask
	///
	/// **Availability**
	/// - macOS 10.4, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Stylize (*CICategoryStylize*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIBlendWithMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithMask)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBlendWithMask/)
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFBlendWithMask) class BlendWithMask: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIBlendWithMask")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as a foreground image.
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

		// MARK: - backgroundImage (inputBackgroundImage)

		/// The image to use as a background image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBackgroundImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var backgroundImage: CIImage? {
			get {
				self.keyedValue("inputBackgroundImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBackgroundImage")
			}
		}

		// MARK: - maskImage (inputMaskImage)

		/// A grayscale mask. When a mask value is 0.0, the result is the background. When the mask value is 1.0, the result is the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaskImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var maskImage: CIImage? {
			get {
				self.keyedValue("inputMaskImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMaskImage")
			}
		}

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as a foreground image.
		///   - backgroundImage: The image to use as a background image.
		///   - maskImage: A grayscale mask. When a mask value is 0.0, the result is the background. When the mask value is 1.0, the result is the image.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			backgroundImage: CIImage? = nil,
			maskImage: CIImage? = nil
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let backgroundImage = backgroundImage {
				self.backgroundImage = backgroundImage
			}
			if let maskImage = maskImage {
				self.maskImage = maskImage
			}
		}
	}
}

@available(macOS 10.4, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Blend With Mask' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - backgroundImage: The image to use as a background image.
	///   - maskImage: A grayscale mask. When a mask value is 0.0, the result is the background. When the mask value is 1.0, the result is the image.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Uses values from a grayscale mask to interpolate between an image and the background. When a mask green value is 0.0, the result is the background. When the mask green value is 1.0, the result is the image.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Stylize, Video
	///
	/// **Documentation Links**
	/// - [CIBlendWithMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithMask)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBlendWithMask/)
	@inlinable func applyingBlendWithMask(
		backgroundImage: CIImage,
		maskImage: CIImage,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.BlendWithMask(
			inputImage: self,
			backgroundImage: backgroundImage,
			maskImage: maskImage
		)?.outputImage ?? CIImage.empty()
	}
}
