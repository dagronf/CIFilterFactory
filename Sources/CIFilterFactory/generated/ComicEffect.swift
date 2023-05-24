//
//  ComicEffect.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Comic Effect
	///
	/// Simulates a comic book drawing by outlining edges and applying a color halftone effect.
	///
	/// **CIFilter Name**
	/// - CIComicEffect
	///
	/// **Availability**
	/// - macOS 10.5, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Stylize (*CICategoryStylize*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIComicEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIComicEffect)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIComicEffect/)
	@available(macOS 10.5, iOS 9, tvOS 9, *)
	@objc(CIFFComicEffect) class ComicEffect: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIComicEffect")
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

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		@objc public convenience init?(
			inputImage: CIImage? = nil
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
		}
	}
}

@available(macOS 10.5, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Comic Effect' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Simulates a comic book drawing by outlining edges and applying a color halftone effect.
	///
	/// **Categories**: BuiltIn, StillImage, Stylize, Video
	///
	/// **Documentation Links**
	/// - [CIComicEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIComicEffect)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIComicEffect/)
	@inlinable func applyingComicEffect(
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ComicEffect(
			inputImage: self
		)?.outputImage ?? CIImage.empty()
	}
}
