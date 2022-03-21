//
//  Mix.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.14, iOS 12, tvOS 12, *)
@objc public extension CIFF {
	///
	/// Mix
	///
	/// Uses an amount parameter to interpolate between an image and a background image. When value is 0.0 or less, the result is the background image. When the value is 1.0 or more, the result is the image.
	///
	/// **Links**
	///
	/// - [CIMix Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMix)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cimix?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIMix/)
	///
	@available(macOS 10.14, iOS 12, tvOS 12, *)
	@objc(CIFFMix) class Mix: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIMix")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as a foreground image.
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

		// MARK: - backgroundImage (inputBackgroundImage)

		/// The image to use as a background image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBackgroundImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var backgroundImage: CIImage? {
			get {
				return self.keyedValue("inputBackgroundImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBackgroundImage")
			}
		}

		// MARK: - amount (inputAmount)

		/// The amount of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
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
		@objc public static let amountDefault: Double = 1

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			backgroundImage: CIImage,
			amount: Double = 1
		) {
			self.init()

			self.image = image
			self.backgroundImage = backgroundImage
			self.amount = amount
		}
	}
}
