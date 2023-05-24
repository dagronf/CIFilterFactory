//
//  AreaLogarithmicHistogram.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Area Logarithmic Histogram
	///
	/// Calculates histogram of the R, G, B, and A channels of the specified area of an image. Before binning, the R, G, and B channel values are transformed by the log base two function. The output image is a one pixel tall image containing the histogram data for all four channels.
	///
	/// **CIFilter Name**
	/// - CIAreaLogarithmicHistogram
	///
	/// **Availability**
	/// - macOS 13.0, iOS 16, tvOS 16
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Reduction (*CICategoryReduction*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIAreaLogarithmicHistogram Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaLogarithmicHistogram)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAreaLogarithmicHistogram/)
	/// **Additional output keys**
	/// - outputData
	/// - outputImageMPS
	/// - outputImageNonMPS
	///
	@available(macOS 13.0, iOS 16, tvOS 16, *)
	@objc(CIFFAreaLogarithmicHistogram) class AreaLogarithmicHistogram: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIAreaLogarithmicHistogram")
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

		// MARK: - scale (inputScale)

		/// The amount of the effect.
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
				self.setDoubleValue(newValue, bounds: AreaLogarithmicHistogram.scaleRange, forKey: "inputScale")
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
				self.setDoubleValue(newValue, bounds: AreaLogarithmicHistogram.countRange, forKey: "inputCount")
			}
		}

		/// `count` default value
		@objc public static let countDefault: Double = 64.0

		/// `count` range definition
		public static let countRange: ClosedRange<Double> = 1.0 ... 2048.0

		// MARK: - minimumStop (inputMinimumStop)

		/// The minimum of the range of color channel values to be in the logarithmic histogram image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMinimumStop`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `-10.0`
		@objc public var minimumStop: Double {
			get {
				self.doubleValue(forKey: "inputMinimumStop", defaultValue: Self.minimumStopDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputMinimumStop")
			}
		}

		/// `minimumStop` default value
		@objc public static let minimumStopDefault: Double = -10.0

		// MARK: - maximumStop (inputMaximumStop)

		/// The maximum of the range of color channel values to be in the logarithmic histogram image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaximumStop`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `4.0`
		@objc public var maximumStop: Double {
			get {
				self.doubleValue(forKey: "inputMaximumStop", defaultValue: Self.maximumStopDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputMaximumStop")
			}
		}

		/// `maximumStop` default value
		@objc public static let maximumStopDefault: Double = 4.0

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
		///   - inputImage: The image to use as an input for the effect.
		///   - extent: A rectangle that defines the extent of the effect.
		///   - scale: The amount of the effect.
		///   - count: The number of bins for the histogram. This value will determine the width of the output image.
		///   - minimumStop: The minimum of the range of color channel values to be in the logarithmic histogram image.
		///   - maximumStop: The maximum of the range of color channel values to be in the logarithmic histogram image.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			extent: CGRect = AreaLogarithmicHistogram.extentDefault,
			scale: Double = AreaLogarithmicHistogram.scaleDefault,
			count: Double = AreaLogarithmicHistogram.countDefault,
			minimumStop: Double = AreaLogarithmicHistogram.minimumStopDefault,
			maximumStop: Double = AreaLogarithmicHistogram.maximumStopDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.extent = extent
			self.scale = scale
			self.count = count
			self.minimumStop = minimumStop
			self.maximumStop = maximumStop
		}
	}
}

@available(macOS 13.0, iOS 16, tvOS 16, *)
public extension CIImage {
	/// Apply the 'Area Logarithmic Histogram' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - extent: A rectangle that defines the extent of the effect.
	///   - scale: The amount of the effect. (0.0...)
	///   - count: The number of bins for the histogram. This value will determine the width of the output image. (1.0...2048.0)
	///   - minimumStop: The minimum of the range of color channel values to be in the logarithmic histogram image.
	///   - maximumStop: The maximum of the range of color channel values to be in the logarithmic histogram image.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Calculates histogram of the R, G, B, and A channels of the specified area of an image. Before binning, the R, G, and B channel values are transformed by the log base two function. The output image is a one pixel tall image containing the histogram data for all four channels.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, Reduction, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIAreaLogarithmicHistogram Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaLogarithmicHistogram)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAreaLogarithmicHistogram/)
	@inlinable func applyingAreaLogarithmicHistogram(
		extent: CGRect = CIFF.AreaLogarithmicHistogram.extentDefault,
		scale: Double = CIFF.AreaLogarithmicHistogram.scaleDefault,
		count: Double = CIFF.AreaLogarithmicHistogram.countDefault,
		minimumStop: Double = CIFF.AreaLogarithmicHistogram.minimumStopDefault,
		maximumStop: Double = CIFF.AreaLogarithmicHistogram.maximumStopDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.AreaLogarithmicHistogram(
			inputImage: self,
			extent: extent,
			scale: scale,
			count: count,
			minimumStop: minimumStop,
			maximumStop: maximumStop
		)?.outputImage ?? CIImage.empty()
	}
}
