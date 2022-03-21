//
//  ZoomBlur.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 8.3, tvOS 8.3, *)
@objc public extension CIFF {
	///
	/// Zoom Blur
	///
	/// Simulates the effect of zooming the camera while capturing the image.
	///
	/// **Links**
	///
	/// - [CIZoomBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIZoomBlur)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cizoomblur?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIZoomBlur/)
	///
	@available(macOS 10.4, iOS 8.3, tvOS 8.3, *)
	@objc(CIFFZoomBlur) class ZoomBlur: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIZoomBlur")
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

		// MARK: - center (inputCenter)

		/// The center of the effect as x and y coordinates.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[150 150]`
		@objc public var center: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputCenter", defaultValue: Self.centerDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// `center` default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - amount (inputAmount)

		/// The zoom-in amount. Larger values result in more zooming in.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `20`
		@objc public var amount: Double {
			get {
				let number = self.filter.value(forKey: "inputAmount") as? NSNumber
				return number?.doubleValue ?? Self.amountDefault
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputAmount")
			}
		}

		/// `amount` default value
		@objc public static let amountDefault: Double = 20

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			center: CGPoint = ZoomBlur.centerDefault,
			amount: Double = 20
		) {
			self.init()

			self.image = image
			self.center = center
			self.amount = amount
		}
	}
}
