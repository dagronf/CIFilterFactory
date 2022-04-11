//
//  AreaHistogram.swift  (AUTOMATICALLY GENERATED FILE)
//  CIFilterFactory
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

@available(macOS 10.5, iOS 8, tvOS 8, *)
@objc public extension CIFF {
	///
	/// Area Histogram
	///
	/// Calculates histograms of the R, G, B, and A channels of the specified area of an image. The output image is a one pixel tall image containing the histogram data for all four channels.
	///
	/// **Availability**
	/// - macOS 10.5, iOS 8, tvOS 8
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryReduction
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIAreaHistogram Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaHistogram)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciareahistogram?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAreaHistogram/)
	///
	/// **Additional output keys**
	/// - outputData
	/// - outputImageMPS
	/// - outputImageNonMPS
	///
	@available(macOS 10.5, iOS 8, tvOS 8, *)
	@objc(CIFFAreaHistogram) class AreaHistogram: Core {
		/// Create an instance of the filter
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
				return self.keyedValue("inputImage")
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
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extentDefault)
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
				let number = self.filter.value(forKey: "inputScale") as? NSNumber
				return number?.doubleValue ?? Self.scaleDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: AreaHistogram.scaleRange)
				self.filter.setValue(number, forKey: "inputScale")
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
				let number = self.filter.value(forKey: "inputCount") as? NSNumber
				return number?.doubleValue ?? Self.countDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: AreaHistogram.countRange)
				self.filter.setValue(number, forKey: "inputCount")
			}
		}

		/// `count` default value
		@objc public static let countDefault: Double = 64.0

		/// `count` range definition
		public static let countRange: ClosedRange<Double> = 1.0 ... 2048.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			extent: CGRect = AreaHistogram.extentDefault,
			scale: Double = AreaHistogram.scaleDefault,
			count: Double = AreaHistogram.countDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.extent = extent
			self.scale = scale
			self.count = count
		}
	}
}
