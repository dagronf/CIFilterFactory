//
//  ColorMap.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, tvOS 6, *)
@objc public extension CIFF {
	///
	/// Color Map
	///
	/// Performs a nonlinear transformation of source color values using mapping values provided in a table.
	///
	/// **Links**
	///
	/// - [CIColorMap Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMap)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolormap?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorMap/)
	///
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFColorMap) class ColorMap: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIColorMap")
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

		// MARK: - gradientImage (inputGradientImage)

		/// The image data from this image transforms the source image values.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGradientImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeGradient`
		@objc public var gradientImage: CIImage? {
			get {
				return self.keyedValue("inputGradientImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGradientImage")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			gradientImage: CIImage
		) {
			self.init()

			self.image = image
			self.gradientImage = gradientImage
		}
	}
}
