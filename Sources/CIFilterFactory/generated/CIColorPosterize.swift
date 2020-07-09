//
//  CIColorPosterize.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Posterize
	///
	/// Remaps red, green, and blue color components to the number of brightness values you specify for each color component. This filter flattens colors to achieve a look similar to that of a silk-screened poster.
	///
	/// **Links**
	///
	/// [CIColorPosterize Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPosterize)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorPosterize/)
	///
	@objc(CIFilterFactory_CIColorPosterize) class CIColorPosterize: Core {
		@objc public init?() {
			super.init(name: "CIColorPosterize")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputLevels

		///
		/// The number of brightness levels to use for each color component. Lower values result in a more extreme poster effect.
		///
		///   minValue: 1.0
		///
		let inputLevels_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputLevels: NSNumber? {
			get {
				return filter.value(forKey: "inputLevels") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputLevels_Range), forKey: "inputLevels")
			}
		}
	}
}