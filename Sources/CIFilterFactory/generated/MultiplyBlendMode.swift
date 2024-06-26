//
//  MultiplyBlendMode.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2024 Darren Ford. All rights reserved.
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

#if canImport(CoreImage)

	import AVFoundation
	import CoreImage
	import CoreML
	import Foundation

	@objc public extension CIFF {
		/// Multiply Blend Mode
		///
		/// Multiplies the source image samples with the background image samples. This results in colors that are at least as dark as either of the two contributing sample colors.
		///
		/// **CIFilter Name**
		/// - CIMultiplyBlendMode
		///
		/// **Availability**
		/// - macOS 10.4, iOS 5, tvOS 5
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - CompositeOperation (*CICategoryCompositeOperation*)
		/// - Interlaced (*CICategoryInterlaced*)
		/// - NonSquarePixels (*CICategoryNonSquarePixels*)
		/// - StillImage (*CICategoryStillImage*)
		/// - Video (*CICategoryVideo*)
		///
		/// **Documentation Links**
		/// - [CIMultiplyBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMultiplyBlendMode)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cimultiplyblendmode)
		/// - [CIFilter.app documentation](https://cifilter.app/CIMultiplyBlendMode/)
		@available(macOS 10.4, iOS 5, tvOS 5, *)
		@objc(CIFFMultiplyBlendMode) class MultiplyBlendMode: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIMultiplyBlendMode")
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

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - inputImage: The image to use as a foreground image.
			///   - backgroundImage: The image to use as a background image.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				backgroundImage: CIImage? = nil
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				if let backgroundImage = backgroundImage {
					self.backgroundImage = backgroundImage
				}
			}
		}
	}

	@available(macOS 10.4, iOS 5, tvOS 5, *)
	public extension CIImage {
		/// Apply the 'Multiply Blend Mode' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - backgroundImage: The image to use as a background image.
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Multiplies the source image samples with the background image samples. This results in colors that are at least as dark as either of the two contributing sample colors.
		///
		/// **Categories**: BuiltIn, CompositeOperation, Interlaced, NonSquarePixels, StillImage, Video
		///
		/// **Documentation Links**
		/// - [CIMultiplyBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMultiplyBlendMode)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cimultiplyblendmode)
		/// - [CIFilter.app documentation](https://cifilter.app/CIMultiplyBlendMode/)
		@inlinable func applyingMultiplyBlendMode(
			backgroundImage: CIImage,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.MultiplyBlendMode(
				inputImage: self,
				backgroundImage: backgroundImage
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
