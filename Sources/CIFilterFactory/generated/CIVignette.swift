//
//  CIVignette.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.9, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Vignette
	///
	/// Applies a vignette shading to the corners of an image.
	///
	/// **Links**
	///
	/// [CIVignette Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignette)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIVignette/)
	///
	@objc(CIFilterFactory_CIVignette) class CIVignette: Core {
		@objc public init?() {
			super.init(name: "CIVignette")
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

		// MARK: - inputIntensity

		///
		/// The intensity of the effect.
		///
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		let inputIntensity_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public var inputIntensity: NSNumber? {
			get {
				return filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputIntensity_Range), forKey: "inputIntensity")
			}
		}

		// MARK: - inputRadius

		///
		/// The distance from the center of the effect.
		///
		///   minValue: 0.0
		///   maxValue: 2.0
		///
		let inputRadius_Range: ClosedRange<Float> = 0.0 ... 2.0
		@objc public var inputRadius: NSNumber? {
			get {
				return filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}