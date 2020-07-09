//
//  CIBlendWithMask.swift  (AUTOMATICALLY GENERATED FILE)
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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Blend With Mask
	///
	/// Uses values from a grayscale mask to interpolate between an image and the background. When a mask green value is 0.0, the result is the background. When the mask green value is 1.0, the result is the image.
	///
	/// **Links**
	///
	/// [CIBlendWithMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBlendWithMask/)
	///
	@objc(CIFilterFactory_CIBlendWithMask) class CIBlendWithMask: Core {
		@objc public init?() {
			super.init(name: "CIBlendWithMask")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as a foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputBackgroundImage

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}

		// MARK: - inputMaskImage

		///
		/// A grayscale mask. When a mask value is 0.0, the result is the background. When the mask value is 1.0, the result is the image.
		///
		@objc public var inputMaskImage: CIImage? {
			get {
				return filter.value(forKey: "inputMaskImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputMaskImage")
			}
		}
	}
}