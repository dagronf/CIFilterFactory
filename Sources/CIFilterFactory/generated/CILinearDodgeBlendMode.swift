//
//  CILinearDodgeBlendMode.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.10, iOS 8, tvOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Linear Dodge Blend Mode
	///
	/// Unpremultiplies the source and background image sample colors, adds them, and then blends the result with the background according to the PDF basic compositing formula. Source image values that are black produces output that is the same as the background. Source image values that are non-black brighten the background color values.
	///
	/// **Links**
	///
	/// - [CILinearDodgeBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearDodgeBlendMode)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cilineardodgeblendmode?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CILinearDodgeBlendMode/)
	///
	@objc(CIFilterFactory_LinearDodgeBlendMode) class LinearDodgeBlendMode: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CILinearDodgeBlendMode")
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

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			backgroundImage: CIImage
		) {
			self.init()

			self.image = image
			self.backgroundImage = backgroundImage
		}
	}
}
