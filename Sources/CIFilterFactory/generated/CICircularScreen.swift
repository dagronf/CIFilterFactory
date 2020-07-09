//
//  CICircularScreen.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Circular Screen
	///
	/// Simulates a circular-shaped halftone screen.
	///
	/// **Links**
	///
	/// [CICircularScreen Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircularScreen)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICircularScreen/)
	///
	@objc(CIFilterFactory_CICircularScreen) class CICircularScreen: Core {
		@objc public init?() {
			super.init(name: "CICircularScreen")
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

		// MARK: - inputCenter

		///
		/// The x and y position to use as the center of the circular screen pattern
		///
		@objc public var inputCenter: CIVector? {
			get {
				return filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		// MARK: - inputWidth

		///
		/// The distance between each circle in the pattern.
		///
		///   minValue: 1.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		// MARK: - inputSharpness

		///
		/// The sharpness of the circles. The larger the value, the sharper the circles.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputSharpness_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputSharpness: NSNumber? {
			get {
				return filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}
