//
//  ExposureAdjust.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 5, tvOS 5, *)
@objc public extension CIFF {
	///
	/// Exposure Adjust
	///
	/// Adjusts the exposure setting for an image similar to the way you control exposure for a camera when you change the F-stop.
	///
	/// **Links**
	///
	/// - [CIExposureAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExposureAdjust)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciexposureadjust?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIExposureAdjust/)
	///
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFExposureAdjust) class ExposureAdjust: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIExposureAdjust")
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

		// MARK: - eV (inputEV)

		/// The amount to adjust the exposure of the image by. The larger the value, the brighter the exposure.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputEV`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0`
		@objc public var eV: Double {
			get {
				let number = self.filter.value(forKey: "inputEV") as? NSNumber
				return number?.doubleValue ?? 0
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputEV")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			eV: Double = 0
		) {
			self.init()

			self.image = image
			self.eV = eV
		}
	}
}
