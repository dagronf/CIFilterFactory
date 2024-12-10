//
//  DistanceGradientFromRedMask.swift  (AUTOMATICALLY GENERATED FILE)
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
		/// Distance Gradient From Red Mask
		///
		/// Produces an infinite image where the red channel contains the distance in pixels from each pixel to the mask.
		///
		/// **CIFilter Name**
		/// - CIDistanceGradientFromRedMask
		///
		/// **Availability**
		/// - macOS 15.0, iOS 18, tvOS 18
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - Gradient (*CICategoryGradient*)
		/// - StillImage (*CICategoryStillImage*)
		/// - Video (*CICategoryVideo*)
		///
		/// **Documentation Links**
		/// - [CIDistanceGradientFromRedMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDistanceGradientFromRedMask)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cidistancegradientfromredmask)
		/// - [CIFilter.app documentation](https://cifilter.app/CIDistanceGradientFromRedMask/)
		@available(macOS 15.0, iOS 18, tvOS 18, *)
		@objc(CIFFDistanceGradientFromRedMask) class DistanceGradientFromRedMask: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIDistanceGradientFromRedMask")
			}

			// MARK: - inputImage (inputImage)

			/// The input image whose red channel defines a mask. If the red channel pixel value is greater than 0.5 then the point is considered in the mask and output pixel will be zero. Otherwise the output pixel will be a value between zero and one.
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

			// MARK: - maximumDistance (inputMaximumDistance)

			/// Determines the maximum distance to the mask that can be measured. Distances between zero and the maximum will be normalized to zero and one.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputMaximumDistance`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeDistance`
			/// - Minimum Value: `0.0`
			/// - Maximum Value: `1000.0`
			/// - Default Value: `10.0`
			@objc public var maximumDistance: Double {
				get {
					self.doubleValue(forKey: "inputMaximumDistance", defaultValue: Self.maximumDistanceDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: DistanceGradientFromRedMask.maximumDistanceRange, forKey: "inputMaximumDistance")
				}
			}

			/// `maximumDistance` default value
			@objc public static let maximumDistanceDefault: Double = 10.0

			/// `maximumDistance` range definition
			public static let maximumDistanceRange: ClosedRange<Double> = 0.0 ... 1000.0

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - inputImage: The input image whose red channel defines a mask. If the red channel pixel value is greater than 0.5 then the point is considered in the mask and output pixel will be zero. Otherwise the output pixel will be a value between zero and one.
			///   - maximumDistance: Determines the maximum distance to the mask that can be measured. Distances between zero and the maximum will be normalized to zero and one.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				maximumDistance: Double = DistanceGradientFromRedMask.maximumDistanceDefault
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				self.maximumDistance = maximumDistance
			}
		}
	}

	@available(macOS 15.0, iOS 18, tvOS 18, *)
	public extension CIImage {
		/// Apply the 'Distance Gradient From Red Mask' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - maximumDistance: Determines the maximum distance to the mask that can be measured. Distances between zero and the maximum will be normalized to zero and one. (0.0...1000.0)
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Produces an infinite image where the red channel contains the distance in pixels from each pixel to the mask.
		///
		/// **Categories**: BuiltIn, Gradient, StillImage, Video
		///
		/// **Documentation Links**
		/// - [CIDistanceGradientFromRedMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDistanceGradientFromRedMask)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cidistancegradientfromredmask)
		/// - [CIFilter.app documentation](https://cifilter.app/CIDistanceGradientFromRedMask/)
		@inlinable func applyingDistanceGradientFromRedMask(
			maximumDistance: Double = CIFF.DistanceGradientFromRedMask.maximumDistanceDefault,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.DistanceGradientFromRedMask(
				inputImage: self,
				maximumDistance: maximumDistance
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
