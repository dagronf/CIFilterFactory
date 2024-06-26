//
//  Clamp.swift  (AUTOMATICALLY GENERATED FILE)
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
		/// Clamp
		///
		/// Clamps an image so the pixels with the specified extent are left unchanged but those at the boundary of the extent are extended outwards. This filter produces an image with infinite extent. You can use this filter when you need to blur an image but you want to avoid a soft, black fringe along the edges.
		///
		/// **CIFilter Name**
		/// - CIClamp
		///
		/// **Availability**
		/// - macOS 10.12, iOS 10, tvOS 10
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - HighDynamicRange (*CICategoryHighDynamicRange*)
		/// - StillImage (*CICategoryStillImage*)
		/// - TileEffect (*CICategoryTileEffect*)
		/// - Video (*CICategoryVideo*)
		///
		/// **Documentation Links**
		/// - [CIClamp Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIClamp)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciclamp)
		/// - [CIFilter.app documentation](https://cifilter.app/CIClamp/)
		@available(macOS 10.12, iOS 10, tvOS 10, *)
		@objc(CIFFClamp) class Clamp: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIClamp")
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

			// MARK: - extent (inputExtent)

			/// A rectangle that defines the extent of the effect.
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
			///   - inputImage: The image to use as an input for the effect.
			///   - extent: A rectangle that defines the extent of the effect.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				extent: CGRect = Clamp.extentDefault
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				self.extent = extent
			}
		}
	}

	@available(macOS 10.12, iOS 10, tvOS 10, *)
	public extension CIImage {
		/// Apply the 'Clamp' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - extent: A rectangle that defines the extent of the effect.
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Clamps an image so the pixels with the specified extent are left unchanged but those at the boundary of the extent are extended outwards. This filter produces an image with infinite extent. You can use this filter when you need to blur an image but you want to avoid a soft, black fringe along the edges.
		///
		/// **Categories**: BuiltIn, HighDynamicRange, StillImage, TileEffect, Video
		///
		/// **Documentation Links**
		/// - [CIClamp Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIClamp)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciclamp)
		/// - [CIFilter.app documentation](https://cifilter.app/CIClamp/)
		@inlinable func applyingClamp(
			extent: CGRect = CIFF.Clamp.extentDefault,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.Clamp(
				inputImage: self,
				extent: extent
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
