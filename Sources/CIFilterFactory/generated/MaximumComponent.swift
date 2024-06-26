//
//  MaximumComponent.swift  (AUTOMATICALLY GENERATED FILE)
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
		/// Maximum Component
		///
		/// Converts an image to grayscale using the maximum of the three color components.
		///
		/// **CIFilter Name**
		/// - CIMaximumComponent
		///
		/// **Availability**
		/// - macOS 10.5, iOS 6, tvOS 6
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
		/// - [CIMaximumComponent Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaximumComponent)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cimaximumcomponent)
		/// - [CIFilter.app documentation](https://cifilter.app/CIMaximumComponent/)
		@available(macOS 10.5, iOS 6, tvOS 6, *)
		@objc(CIFFMaximumComponent) class MaximumComponent: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIMaximumComponent")
			}

			// MARK: - inputImage (inputImage)

			/// The image to process.
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
			///   - inputImage: The image to process.
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

	@available(macOS 10.5, iOS 6, tvOS 6, *)
	public extension CIImage {
		/// Apply the 'Maximum Component' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Converts an image to grayscale using the maximum of the three color components.
		///
		/// **Categories**: BuiltIn, ColorEffect, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
		///
		/// **Documentation Links**
		/// - [CIMaximumComponent Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaximumComponent)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cimaximumcomponent)
		/// - [CIFilter.app documentation](https://cifilter.app/CIMaximumComponent/)
		@inlinable func applyingMaximumComponent(
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.MaximumComponent(
				inputImage: self
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
