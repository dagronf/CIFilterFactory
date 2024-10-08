//
//  AreaBoundsRed.swift  (AUTOMATICALLY GENERATED FILE)
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
		/// Area Bounds Red
		///
		/// Calculates the approximate bounding box of pixels within the specified area of an image where the red component values are non-zero. The result is 1x1 pixel image where the RGBA values contain the normalized X,Y,W,H dimensions of the bounding box.
		///
		/// **CIFilter Name**
		/// - CIAreaBoundsRed
		///
		/// **Availability**
		/// - macOS 15.0, iOS 18, tvOS 18
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - HighDynamicRange (*CICategoryHighDynamicRange*)
		/// - Reduction (*CICategoryReduction*)
		/// - StillImage (*CICategoryStillImage*)
		/// - Video (*CICategoryVideo*)
		///
		/// **Documentation Links**
		/// - [CIAreaBoundsRed Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaBoundsRed)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciareaboundsred)
		/// - [CIFilter.app documentation](https://cifilter.app/CIAreaBoundsRed/)
		@available(macOS 15.0, iOS 18, tvOS 18, *)
		@objc(CIFFAreaBoundsRed) class AreaBoundsRed: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIAreaBoundsRed")
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

			// MARK: - extent (inputExtent)

			/// A rectangle that specifies the subregion of the image that you want to process.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputExtent`
			/// - Internal class: `CIVector`
			/// - Type: `CIAttributeTypeRectangle`
			/// - Default Value: `CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)`
			@objc public var extent: CGRect {
				get {
					self.cgRectValue(forKey: "inputExtent", defaultValue: Self.extentDefault)
				}
				set {
					self.setKeyedValue(newValue.ciVector, for: "inputExtent")
				}
			}

			/// `extent` default value
			@objc public static let extentDefault = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - inputImage: The image to process.
			///   - extent: A rectangle that specifies the subregion of the image that you want to process.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				extent: CGRect = AreaBoundsRed.extentDefault
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				self.extent = extent
			}
		}
	}

	@available(macOS 15.0, iOS 18, tvOS 18, *)
	public extension CIImage {
		/// Apply the 'Area Bounds Red' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - extent: A rectangle that specifies the subregion of the image that you want to process.
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Calculates the approximate bounding box of pixels within the specified area of an image where the red component values are non-zero. The result is 1x1 pixel image where the RGBA values contain the normalized X,Y,W,H dimensions of the bounding box.
		///
		/// **Categories**: BuiltIn, HighDynamicRange, Reduction, StillImage, Video
		///
		/// **Documentation Links**
		/// - [CIAreaBoundsRed Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaBoundsRed)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciareaboundsred)
		/// - [CIFilter.app documentation](https://cifilter.app/CIAreaBoundsRed/)
		@inlinable func applyingAreaBoundsRed(
			extent: CGRect = CIFF.AreaBoundsRed.extentDefault,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.AreaBoundsRed(
				inputImage: self,
				extent: extent
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
