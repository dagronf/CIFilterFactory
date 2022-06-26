//
//  ConvertLabToRGB.swift  (AUTOMATICALLY GENERATED FILE)
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

@objc public extension CIFF {
	/// Convert Lab to RGB
	///
	/// Converts an image from La*b* color space to the Core Image RGB working space.
	///
	/// **CIFilter Name**
	/// - CIConvertLabToRGB
	///
	/// **Availability**
	/// - macOS 13.0, iOS 16, tvOS 16
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryColorEffect
	/// - CICategoryHighDynamicRange
	/// - CICategoryInterlaced
	/// - CICategoryNonSquarePixels
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIConvertLabToRGB Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvertLabToRGB)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciconvertlabtorgb?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIConvertLabToRGB/)
	///
	@available(macOS 13.0, iOS 16, tvOS 16, *)
	@objc(CIFFConvertLabToRGB) class ConvertLabToRGB: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIConvertLabToRGB")
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

		// MARK: - normalize (inputNormalize)

		/// If nomalize is false then the L channel is in the range 0 to 100 and the a*b* channels are the range -128 to 128. If nomalize is true then the La*b* channels are the range 0 to 1.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNormalize`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var normalize: Bool {
			get {
				self.boolValue(forKey: "inputNormalize", defaultValue: Self.normalizeDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputNormalize")
			}
		}

		/// `normalize` default value
		@objc public static let normalizeDefault: Bool = false

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			normalize: Bool = ConvertLabToRGB.normalizeDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.normalize = normalize
		}
	}
}
