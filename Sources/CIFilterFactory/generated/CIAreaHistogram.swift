//
//  CIAreaHistogram.swift  (AUTOMATICALLY GENERATED FILE)
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
//  Automatically generated on 2020-07-09 00:57:49 +0000.  Do not edit.

import AVFoundation
import CoreImage
import CoreML
import Foundation

@available(macOS 10.5, iOS 8, tvOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Area Histogram
	///
	/// Calculates histograms of the R, G, B, and A channels of the specified area of an image. The output image is a one pixel tall image containing the histogram data for all four channels.
	///
	/// **Links**
	///
	/// - [CIAreaHistogram Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaHistogram)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciareahistogram?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAreaHistogram/)
	///
	@objc(CIFilterFactory_AreaHistogram) class AreaHistogram: FilterCore {
		@objc public init?() {
			super.init(name: "CIAreaHistogram")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// The image whose histogram you want to calculate.
		///
		///   - Attribute key: `inputImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - extent (inputExtent)

		///
		/// A rectangle that, after intersection with the image extent, specifies the subregion of the image that you want to process.
		///
		///   - Attribute key: `inputExtent`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypeRectangle`
		///   - Default value: `[0 0 640 80]`
		@objc public var extent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extent_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// extent default value
		@objc public static let extent_default = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 640.0)

		// MARK: - scale (inputScale)

		///
		/// The scale value to use for the histogram values. If the scale is 1.0, then the bins in the resulting image will add up to 1.0.
		///
		///   - Attribute key: `inputScale`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///
		public static let scale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var scale: NSNumber? {
			get {
				return self.keyedValue("inputScale")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: AreaHistogram.scale_Range), forKey: "inputScale")
			}
		}

		// MARK: - count (inputCount)

		///
		/// The number of bins for the histogram. This value will determine the width of the output image.
		///
		///   - Attribute key: `inputCount`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `64`
		///   minValue: 1.0
		///   maxValue: 2048.0
		///
		public static let count_Range: ClosedRange<Float> = 1.0 ... 2048.0
		@objc public var count: NSNumber? {
			get {
				return self.keyedValue("inputCount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: AreaHistogram.count_Range), forKey: "inputCount")
			}
		}

		// MARK: - Additional Outputs

		@objc public var outputData: Any? {
			return self.filter.value(forKey: "outputData")
		}

		@objc public var outputImageMPS: Any? {
			return self.filter.value(forKey: "outputImageMPS")
		}

		@objc public var outputImageNonMPS: Any? {
			return self.filter.value(forKey: "outputImageNonMPS")
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			extent: CGRect = AreaHistogram.extent_default,
			scale: NSNumber = 1,
			count: NSNumber = 64
		) {
			self.init()

			self.image = image
			self.extent = extent
			self.scale = scale
			self.count = count
		}
	}
}
