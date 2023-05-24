//
//  AreaHistogram.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Area Histogram
	///
	/// Calculates histograms of the R, G, B, and A channels of the specified area of an image. The output image is a one pixel tall image containing the histogram data for all four channels.
	///
	/// **CIFilter Name**
	/// - CIAreaHistogram
	///
	/// **Availability**
	/// - macOS 10.5, iOS 8, tvOS 8
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Reduction (*CICategoryReduction*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIAreaHistogram Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaHistogram)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAreaHistogram/)
	/// **Additional output keys**
	/// - outputData
	/// - outputImageMPS
	/// - outputImageNonMPS
	///
	@available(macOS 10.5, iOS 8, tvOS 8, *)
	@objc(CIFFAreaHistogram) class AreaHistogram: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIAreaHistogram")
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

		/// A rectangle that, after intersection with the image extent, specifies the subregion of the image that you want to process.
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

		/// The scale value to use for the histogram values. If the scale is 1.0, then the bins in the resulting image will add up to 1.0.
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
				self.setDoubleValue(newValue, bounds: AreaHistogram.scaleRange, forKey: "inputScale")
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
				self.setDoubleValue(newValue, bounds: AreaHistogram.countRange, forKey: "inputCount")
			}
		}

		/// `count` default value
		@objc public static let countDefault: Double = 64.0

		/// `count` range definition
		public static let countRange: ClosedRange<Double> = 1.0 ... 2048.0

		// MARK: - Additional output keys

		@objc public var outputData: Unmanaged<CFData>? {
			let value = self.filter.perform(#selector(getter: AdditionalOutputsFilterDescriptor.outputData))
			if let obj = value?.takeUnretainedValue() {
				return Unmanaged.passUnretained(obj as! CFData)
			}
			return nil
		}

		@objc public var outputImageMPS: Unmanaged<CIImage>? {
			let value = self.filter.perform(#selector(getter: AdditionalOutputsFilterDescriptor.outputImageMPS))
			if let obj = value?.takeUnretainedValue() {
				return Unmanaged.passUnretained(obj as! CIImage)
			}
			return nil
		}

		@objc public var outputImageNonMPS: Unmanaged<CIImage>? {
			let value = self.filter.perform(#selector(getter: AdditionalOutputsFilterDescriptor.outputImageNonMPS))
			if let obj = value?.takeUnretainedValue() {
				return Unmanaged.passUnretained(obj as! CIImage)
			}
			return nil
		}

		// A hidden class for extracting any additional output objects
		private final class AdditionalOutputsFilterDescriptor: NSObject {
			@objc var outputData: Unmanaged<AnyObject>?
			@objc var outputImageMPS: Unmanaged<AnyObject>?
			@objc var outputImageNonMPS: Unmanaged<AnyObject>?
		}

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image whose histogram you want to calculate.
		///   - extent: A rectangle that, after intersection with the image extent, specifies the subregion of the image that you want to process.
		///   - scale: The scale value to use for the histogram values. If the scale is 1.0, then the bins in the resulting image will add up to 1.0.
		///   - count: The number of bins for the histogram. This value will determine the width of the output image.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			extent: CGRect = AreaHistogram.extentDefault,
			scale: Double = AreaHistogram.scaleDefault,
			count: Double = AreaHistogram.countDefault
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

@available(macOS 10.5, iOS 8, tvOS 8, *)
public extension CIImage {
	/// Apply the 'Area Histogram' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - extent: A rectangle that, after intersection with the image extent, specifies the subregion of the image that you want to process.
	///   - scale: The scale value to use for the histogram values. If the scale is 1.0, then the bins in the resulting image will add up to 1.0. (0.0...)
	///   - count: The number of bins for the histogram. This value will determine the width of the output image. (1.0...2048.0)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Calculates histograms of the R, G, B, and A channels of the specified area of an image. The output image is a one pixel tall image containing the histogram data for all four channels.
	///
	/// **Categories**: BuiltIn, Reduction, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIAreaHistogram Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaHistogram)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAreaHistogram/)
	@inlinable func applyingAreaHistogram(
		extent: CGRect = CIFF.AreaHistogram.extentDefault,
		scale: Double = CIFF.AreaHistogram.scaleDefault,
		count: Double = CIFF.AreaHistogram.countDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.AreaHistogram(
			inputImage: self,
			extent: extent,
			scale: scale,
			count: count
		)?.outputImage ?? CIImage.empty()
	}
}
