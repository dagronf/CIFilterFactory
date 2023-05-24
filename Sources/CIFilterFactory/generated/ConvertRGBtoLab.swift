//
//  ConvertRGBtoLab.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Convert RGB to Lab
	///
	/// Converts an image from the Core Image RGB working space to La*b* color space.
	///
	/// **CIFilter Name**
	/// - CIConvertRGBtoLab
	///
	/// **Availability**
	/// - macOS 13.0, iOS 16, tvOS 16
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
	/// - [CIConvertRGBtoLab Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvertRGBtoLab)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIConvertRGBtoLab/)
	@available(macOS 13.0, iOS 16, tvOS 16, *)
	@objc(CIFFConvertRGBtoLab) class ConvertRGBtoLab: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIConvertRGBtoLab")
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

		// MARK: - normalize (inputNormalize)

		/// If normalize is false then the L channel is in the range 0 to 100 and the a*b* channels are in the range -128 to 128. If normalize is true then the La*b* channels are in the range 0 to 1.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNormalize`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var normalize: Bool {
			get {
				self.boolValue(forKey: "inputNormalize", defaultValue: Self.normalizeDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputNormalize")
			}
		}

		/// `normalize` default value
		@objc public static let normalizeDefault: Bool = false

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - normalize: If normalize is false then the L channel is in the range 0 to 100 and the a*b* channels are in the range -128 to 128. If normalize is true then the La*b* channels are in the range 0 to 1.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			normalize: Bool = ConvertRGBtoLab.normalizeDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.normalize = normalize
		}
	}
}

@available(macOS 13.0, iOS 16, tvOS 16, *)
public extension CIImage {
	/// Apply the 'Convert RGB to Lab' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - normalize: If normalize is false then the L channel is in the range 0 to 100 and the a*b* channels are in the range -128 to 128. If normalize is true then the La*b* channels are in the range 0 to 1.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Converts an image from the Core Image RGB working space to La*b* color space.
	///
	/// **Categories**: BuiltIn, ColorEffect, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIConvertRGBtoLab Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvertRGBtoLab)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIConvertRGBtoLab/)
	@inlinable func applyingConvertRGBtoLab(
		normalize: Bool = CIFF.ConvertRGBtoLab.normalizeDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ConvertRGBtoLab(
			inputImage: self,
			normalize: normalize
		)?.outputImage ?? CIImage.empty()
	}
}
