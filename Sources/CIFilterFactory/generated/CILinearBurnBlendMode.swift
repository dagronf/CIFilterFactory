//
//  CILinearBurnBlendMode.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.10, iOS 8, *)
	@inlinable @objc static func LinearBurnBlendMode() -> CIFilterFactory.CILinearBurnBlendMode? {
		return CIFilterFactory.CILinearBurnBlendMode()
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Linear Burn Blend Mode
	///
	/// Inverts the unpremultiplied source and background image sample color, inverts the sum, and then blends the result with the background according to the PDF basic compositing formula. Source image values that are white produce no change. Source image values that are black invert the background color values.
	///
	/// **Links**
	///
	/// [CILinearBurnBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearBurnBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILinearBurnBlendMode/)
	///
	@objc(CIFilterFactory_CILinearBurnBlendMode) class CILinearBurnBlendMode: FilterCore {
		@objc public init?() {
			super.init(name: "CILinearBurnBlendMode")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The image to use as a background image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputBackgroundImage: CIImage
		) {
			self.init()

			self.inputImage = inputImage
			self.inputBackgroundImage = inputBackgroundImage
		}
	}
}
