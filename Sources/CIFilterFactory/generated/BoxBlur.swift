//
//  BoxBlur.swift  (AUTOMATICALLY GENERATED FILE)
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
		/// Box Blur
		///
		/// Smooths or sharpens an image using a box-shaped convolution kernel.
		///
		/// **CIFilter Name**
		/// - CIBoxBlur
		///
		/// **Availability**
		/// - macOS 10.5, iOS 9, tvOS 9
		///
		/// **Categories**
		/// - Blur (*CICategoryBlur*)
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - HighDynamicRange (*CICategoryHighDynamicRange*)
		/// - StillImage (*CICategoryStillImage*)
		/// - Video (*CICategoryVideo*)
		///
		/// **Documentation Links**
		/// - [CIBoxBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBoxBlur)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciboxblur)
		/// - [CIFilter.app documentation](https://cifilter.app/CIBoxBlur/)
		@available(macOS 10.5, iOS 9, tvOS 9, *)
		@objc(CIFFBoxBlur) class BoxBlur: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIBoxBlur")
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

			// MARK: - radius (inputRadius)

			/// The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputRadius`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeDistance`
			/// - Minimum Value: `1.0`
			/// - Default Value: `10.0`
			@objc public var radius: Double {
				get {
					self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: BoxBlur.radiusRange, forKey: "inputRadius")
				}
			}

			/// `radius` default value
			@objc public static let radiusDefault: Double = 10.0

			/// `radius` range definition
			public static let radiusRange = PartialRangeFrom<Double>(1.0)

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - inputImage: The image to use as an input for the effect.
			///   - radius: The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				radius: Double = BoxBlur.radiusDefault
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				self.radius = radius
			}
		}
	}

	@available(macOS 10.5, iOS 9, tvOS 9, *)
	public extension CIImage {
		/// Apply the 'Box Blur' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - radius: The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result. (1.0...)
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Smooths or sharpens an image using a box-shaped convolution kernel.
		///
		/// **Categories**: Blur, BuiltIn, HighDynamicRange, StillImage, Video
		///
		/// **Documentation Links**
		/// - [CIBoxBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBoxBlur)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciboxblur)
		/// - [CIFilter.app documentation](https://cifilter.app/CIBoxBlur/)
		@inlinable func applyingBoxBlur(
			radius: Double = CIFF.BoxBlur.radiusDefault,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.BoxBlur(
				inputImage: self,
				radius: radius
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
