//
//  ColorMap.swift  (AUTOMATICALLY GENERATED FILE)
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
		/// Color Map
		///
		/// Performs a nonlinear transformation of source color values using mapping values provided in a table.
		///
		/// **CIFilter Name**
		/// - CIColorMap
		///
		/// **Availability**
		/// - macOS 10.4, iOS 6, tvOS 6
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
		/// - [CIColorMap Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMap)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolormap)
		/// - [CIFilter.app documentation](https://cifilter.app/CIColorMap/)
		@available(macOS 10.4, iOS 6, tvOS 6, *)
		@objc(CIFFColorMap) class ColorMap: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIColorMap")
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

			// MARK: - gradientImage (inputGradientImage)

			/// The image data from this image transforms the source image values.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputGradientImage`
			/// - Internal class: `CIImage`
			/// - Type: `CIAttributeTypeGradient`
			@objc public var gradientImage: CIImage? {
				get {
					self.keyedValue("inputGradientImage")
				}
				set {
					self.setKeyedValue(newValue, for: "inputGradientImage")
				}
			}

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - inputImage: The image to use as an input for the effect.
			///   - gradientImage: The image data from this image transforms the source image values.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				gradientImage: CIImage? = nil
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				if let gradientImage = gradientImage {
					self.gradientImage = gradientImage
				}
			}
		}
	}

	@available(macOS 10.4, iOS 6, tvOS 6, *)
	public extension CIImage {
		/// Apply the 'Color Map' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - gradientImage: The image data from this image transforms the source image values.
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Performs a nonlinear transformation of source color values using mapping values provided in a table.
		///
		/// **Categories**: BuiltIn, ColorEffect, Interlaced, NonSquarePixels, StillImage, Video
		///
		/// **Documentation Links**
		/// - [CIColorMap Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMap)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolormap)
		/// - [CIFilter.app documentation](https://cifilter.app/CIColorMap/)
		@inlinable func applyingColorMap(
			gradientImage: CIImage,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.ColorMap(
				inputImage: self,
				gradientImage: gradientImage
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
