//
//  CIHistogramDisplayFilter.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(iOS 8, tvOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Histogram Display
	///
	/// Generates a displayable histogram image from the output of the “Area Histogram” filter.
	///
	/// **Links**
	///
	/// - [CIHistogramDisplayFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHistogramDisplayFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cihistogramdisplayfilter?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIHistogramDisplayFilter/)
	///
	@objc(CIFilterFactory_HistogramDisplayFilter) class HistogramDisplayFilter: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIHistogramDisplayFilter")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
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
		/// - Default value: `100`
		/// - Minimum value: `1.0`
		/// - Maximum value: `200.0`
		@objc public var height: NSNumber? {
			get {
				return self.keyedValue("inputHeight")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: HistogramDisplayFilter.heightRange), forKey: "inputHeight")
			}
		}

		/// `height` range definition
		public static let heightRange: ClosedRange<Float> = 1.0 ... 200.0

		// MARK: - highLimit (inputHighLimit)

		/// The fraction of the right portion of the histogram image to make lighter.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputHighLimit`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var highLimit: NSNumber? {
			get {
				return self.keyedValue("inputHighLimit")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: HistogramDisplayFilter.highLimitRange), forKey: "inputHighLimit")
			}
		}

		/// `highLimit` range definition
		public static let highLimitRange: ClosedRange<Float> = 0.0 ... 1.0

		// MARK: - lowLimit (inputLowLimit)

		/// The fraction of the left portion of the histogram image to make darker
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLowLimit`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var lowLimit: NSNumber? {
			get {
				return self.keyedValue("inputLowLimit")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: HistogramDisplayFilter.lowLimitRange), forKey: "inputLowLimit")
			}
		}

		/// `lowLimit` range definition
		public static let lowLimitRange: ClosedRange<Float> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			height: NSNumber = 100,
			highLimit: NSNumber = 1,
			lowLimit: NSNumber = 0
		) {
			self.init()

			self.image = image
			self.height = height
			self.highLimit = highLimit
			self.lowLimit = lowLimit
		}
	}
}
