//
//  HistogramDisplayFilter.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Histogram Display
	///
	/// Generates a displayable histogram image from the output of the “Area Histogram” filter.
	///
	/// **CIFilter Name**
	/// - CIHistogramDisplayFilter
	///
	/// **Availability**
	/// - iOS 8, tvOS 8
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Reduction (*CICategoryReduction*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIHistogramDisplayFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHistogramDisplayFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIHistogramDisplayFilter/)
	@available(iOS 8, tvOS 8, *)
	@objc(CIFFHistogramDisplayFilter) class HistogramDisplayFilter: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIHistogramDisplayFilter")
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

		// MARK: - height (inputHeight)

		/// The height of the displayable histogram image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputHeight`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `1.0`
		/// - Maximum Value: `200.0`
		/// - Default Value: `100.0`
		@objc public var height: Double {
			get {
				self.doubleValue(forKey: "inputHeight", defaultValue: Self.heightDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: HistogramDisplayFilter.heightRange, forKey: "inputHeight")
			}
		}

		/// `height` default value
		@objc public static let heightDefault: Double = 100.0

		/// `height` range definition
		public static let heightRange: ClosedRange<Double> = 1.0 ... 200.0

		// MARK: - highLimit (inputHighLimit)

		/// The fraction of the right portion of the histogram image to make lighter.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputHighLimit`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `1.0`
		@objc public var highLimit: Double {
			get {
				self.doubleValue(forKey: "inputHighLimit", defaultValue: Self.highLimitDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: HistogramDisplayFilter.highLimitRange, forKey: "inputHighLimit")
			}
		}

		/// `highLimit` default value
		@objc public static let highLimitDefault: Double = 1.0

		/// `highLimit` range definition
		public static let highLimitRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - lowLimit (inputLowLimit)

		/// The fraction of the left portion of the histogram image to make darker.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLowLimit`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.0`
		@objc public var lowLimit: Double {
			get {
				self.doubleValue(forKey: "inputLowLimit", defaultValue: Self.lowLimitDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: HistogramDisplayFilter.lowLimitRange, forKey: "inputLowLimit")
			}
		}

		/// `lowLimit` default value
		@objc public static let lowLimitDefault: Double = 0.0

		/// `lowLimit` range definition
		public static let lowLimitRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - height: The height of the displayable histogram image.
		///   - highLimit: The fraction of the right portion of the histogram image to make lighter.
		///   - lowLimit: The fraction of the left portion of the histogram image to make darker.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			height: Double = HistogramDisplayFilter.heightDefault,
			highLimit: Double = HistogramDisplayFilter.highLimitDefault,
			lowLimit: Double = HistogramDisplayFilter.lowLimitDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.height = height
			self.highLimit = highLimit
			self.lowLimit = lowLimit
		}
	}
}

@available(iOS 8, tvOS 8, *)
public extension CIImage {
	/// Apply the 'Histogram Display' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - height: The height of the displayable histogram image. (1.0...200.0)
	///   - highLimit: The fraction of the right portion of the histogram image to make lighter. (0.0...1.0)
	///   - lowLimit: The fraction of the left portion of the histogram image to make darker. (0.0...1.0)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Generates a displayable histogram image from the output of the “Area Histogram” filter.
	///
	/// **Categories**: BuiltIn, Reduction, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIHistogramDisplayFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHistogramDisplayFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIHistogramDisplayFilter/)
	@inlinable func applyingHistogramDisplayFilter(
		height: Double = CIFF.HistogramDisplayFilter.heightDefault,
		highLimit: Double = CIFF.HistogramDisplayFilter.highLimitDefault,
		lowLimit: Double = CIFF.HistogramDisplayFilter.lowLimitDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.HistogramDisplayFilter(
			inputImage: self,
			height: height,
			highLimit: highLimit,
			lowLimit: lowLimit
		)?.outputImage ?? CIImage.empty()
	}
}
