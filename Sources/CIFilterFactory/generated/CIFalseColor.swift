//
//  CIFalseColor.swift  (AUTOMATICALLY GENERATED FILE)
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

public extension CIFilter {
	@available(macOS 10.4, iOS 5, *)
	@inlinable @objc static func FalseColor() -> CIFilterFactory.CIFalseColor? {
		return CIFilterFactory.CIFalseColor()
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// False Color
	///
	/// Maps luminance to a color ramp of two colors. False color is often used to process astronomical and other scientific data, such as ultraviolet and x-ray images.
	///
	/// **Links**
	///
	/// [CIFalseColor Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFalseColor)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIFalseColor/)
	///
	@objc(CIFilterFactory_CIFalseColor) class CIFalseColor: FilterCore {
		@objc public init?() {
			super.init(name: "CIFalseColor")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		///
		/// The first color to use for the color ramp.
		///
		///   Class:    CIColor
		///   Type:     CIAttributeTypeColor
		///   Default:  rgba(0.3 0 0 1)
		@objc public dynamic var inputColor0: CIColor? {
			get {
				return self.keyedValue("inputColor0")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor0")
			}
		}

		///
		/// The second color to use for the color ramp.
		///
		///   Class:    CIColor
		///   Type:     CIAttributeTypeColor
		///   Default:  rgba(1 0.9 0.8 1)
		@objc public dynamic var inputColor1: CIColor? {
			get {
				return self.keyedValue("inputColor1")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor1")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputColor0: CIColor,
			inputColor1: CIColor
		) {
			self.init()

			self.inputImage = inputImage
			self.inputColor0 = inputColor0
			self.inputColor1 = inputColor1
		}
	}
}
