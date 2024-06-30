//
//  AreaAlphaWeightedHistogram.swift  (AUTOMATICALLY GENERATED FILE)
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
		/// Area Alpha Weighted Histogram
		///
		/// Calculates alpha-weighted histograms of the unpremultiplied R, G, B channels for the specified area of an image. The output image is a one pixel tall image containing the histogram data for the RGB channels.
		///
		/// **CIFilter Name**
		/// - CIAreaAlphaWeightedHistogram
		///
		/// **Availability**
		/// - macOS 15.0, iOS 18, tvOS 18
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - Reduction (*CICategoryReduction*)
		/// - StillImage (*CICategoryStillImage*)
		/// - Video (*CICategoryVideo*)
		///
		/// **Documentation Links**
		/// - [CIAreaAlphaWeightedHistogram Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaAlphaWeightedHistogram)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciareaalphaweightedhistogram)
		/// - [CIFilter.app documentation](https://cifilter.app/CIAreaAlphaWeightedHistogram/)
		/// **Additional output keys**
		/// - outputImageMPS
		/// - outputImageNonMPS
		/// - outputData
		///
		@available(macOS 15.0, iOS 18, tvOS 18, *)
		@objc(CIFFAreaAlphaWeightedHistogram) class AreaAlphaWeightedHistogram: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIAreaAlphaWeightedHistogram")
			}

			// MARK: - inputImage (inputImage)

			/// The image whose histogram you want to calculate.
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

			// MARK: - scale (inputScale)

			/// The scale value to use for the histogram values. If the scale is 1.0 and the image is opaque, then the bins in the resulting image will add up to 1.0.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputScale`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeScalar`
			/// - Minimum Value: `0.0`
			/// - Default Value: `1.0`
			@objc public var scale: Double {
				get {
					self.doubleValue(forKey: "inputScale", defaultValue: Self.scaleDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: AreaAlphaWeightedHistogram.scaleRange, forKey: "inputScale")
				}
			}

			/// `scale` default value
			@objc public static let scaleDefault: Double = 1.0

			/// `scale` range definition
			public static let scaleRange = PartialRangeFrom<Double>(0.0)

			// MARK: - count (inputCount)

			/// The number of bins for the histogram. This value will determine the width of the output image.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputCount`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeScalar`
			/// - Minimum Value: `1.0`
			/// - Maximum Value: `2048.0`
			/// - Default Value: `64.0`
			@objc public var count: Double {
				get {
					self.doubleValue(forKey: "inputCount", defaultValue: Self.countDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: AreaAlphaWeightedHistogram.countRange, forKey: "inputCount")
				}
			}

			/// `count` default value
			@objc public static let countDefault: Double = 64.0

			/// `count` range definition
			public static let countRange: ClosedRange<Double> = 1.0 ... 2048.0

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - inputImage: The image whose histogram you want to calculate.
			///   - extent: A rectangle that defines the extent of the effect.
			///   - scale: The scale value to use for the histogram values. If the scale is 1.0 and the image is opaque, then the bins in the resulting image will add up to 1.0.
			///   - count: The number of bins for the histogram. This value will determine the width of the output image.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				extent: CGRect = AreaAlphaWeightedHistogram.extentDefault,
				scale: Double = AreaAlphaWeightedHistogram.scaleDefault,
				count: Double = AreaAlphaWeightedHistogram.countDefault
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				self.extent = extent
				self.scale = scale
				self.count = count
			}
		}
	}

	@available(macOS 15.0, iOS 18, tvOS 18, *)
	public extension CIImage {
		/// Apply the 'Area Alpha Weighted Histogram' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - extent: A rectangle that defines the extent of the effect.
		///   - scale: The scale value to use for the histogram values. If the scale is 1.0 and the image is opaque, then the bins in the resulting image will add up to 1.0. (0.0...)
		///   - count: The number of bins for the histogram. This value will determine the width of the output image. (1.0...2048.0)
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Calculates alpha-weighted histograms of the unpremultiplied R, G, B channels for the specified area of an image. The output image is a one pixel tall image containing the histogram data for the RGB channels.
		///
		/// **Categories**: BuiltIn, Reduction, StillImage, Video
		///
		/// **Documentation Links**
		/// - [CIAreaAlphaWeightedHistogram Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaAlphaWeightedHistogram)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciareaalphaweightedhistogram)
		/// - [CIFilter.app documentation](https://cifilter.app/CIAreaAlphaWeightedHistogram/)
		@inlinable func applyingAreaAlphaWeightedHistogram(
			extent: CGRect = CIFF.AreaAlphaWeightedHistogram.extentDefault,
			scale: Double = CIFF.AreaAlphaWeightedHistogram.scaleDefault,
			count: Double = CIFF.AreaAlphaWeightedHistogram.countDefault,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.AreaAlphaWeightedHistogram(
				inputImage: self,
				extent: extent,
				scale: scale,
				count: count
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
