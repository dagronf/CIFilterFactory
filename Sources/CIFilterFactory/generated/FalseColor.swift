//
//  FalseColor.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// False Color
	///
	/// Maps luminance to a color ramp of two colors. False color is often used to process astronomical and other scientific data, such as ultraviolet and X-ray images.
	///
	/// **CIFilter Name**
	/// - CIFalseColor
	///
	/// **Availability**
	/// - macOS 10.4, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorEffect (*CICategoryColorEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIFalseColor Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFalseColor)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIFalseColor/)
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFFalseColor) class FalseColor: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIFalseColor")
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

		// MARK: - color0 (inputColor0)

		/// The first color to use for the color ramp.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor0`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var color0: CIColor? {
			get {
				self.keyedValue("inputColor0")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor0")
			}
		}

		// MARK: - color1 (inputColor1)

		/// The second color to use for the color ramp.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor1`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var color1: CIColor? {
			get {
				self.keyedValue("inputColor1")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor1")
			}
		}

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - color0: The first color to use for the color ramp.
		///   - color1: The second color to use for the color ramp.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			color0: CIColor,
			color1: CIColor
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.color0 = color0
			self.color1 = color1
		}
	}
}

@available(macOS 10.4, iOS 5, tvOS 5, *)
public extension CIImage {
	/// Apply the 'False Color' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - color0: The first color to use for the color ramp.
	///   - color1: The second color to use for the color ramp.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Maps luminance to a color ramp of two colors. False color is often used to process astronomical and other scientific data, such as ultraviolet and X-ray images.
	///
	/// **Categories**: BuiltIn, ColorEffect, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIFalseColor Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFalseColor)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIFalseColor/)
	@inlinable func applyingFalseColor(
		color0: CIColor,
		color1: CIColor,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.FalseColor(
			inputImage: self,
			color0: color0,
			color1: color1
		)?.outputImage ?? CIImage.empty()
	}
}
