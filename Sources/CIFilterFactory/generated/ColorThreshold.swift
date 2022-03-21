//
//  ColorThreshold.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 11.0, iOS 14, tvOS 14, *)
@objc public extension CIFF {
	///
	/// Color Threshold
	///
	/// Produces a binarized image from an image and a threshold value. The red, green and blue channels of the resulting image will be one if its value is greater than the threshold and zero otherwise.
	///
	/// **Links**
	///
	/// - [CIColorThreshold Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorThreshold)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolorthreshold?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorThreshold/)
	///
	@available(macOS 11.0, iOS 14, tvOS 14, *)
	@objc(CIFFColorThreshold) class ColorThreshold: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIColorThreshold")
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

		// MARK: - threshold (inputThreshold)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputThreshold`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.5`
		@objc public var threshold: Double {
			get {
				let number = self.filter.value(forKey: "inputThreshold") as? NSNumber
				return number?.doubleValue ?? Self.thresholdDefault
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputThreshold")
			}
		}

		/// `threshold` default value
		@objc public static let thresholdDefault: Double = 0.5

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			threshold: Double = 0.5
		) {
			self.init()

			self.image = image
			self.threshold = threshold
		}
	}
}
