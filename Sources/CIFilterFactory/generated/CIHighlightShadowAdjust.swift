//
//  CIHighlightShadowAdjust.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.7, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Highlight and Shadow Adjust
	///
	/// Adjust the tonal mapping of an image while preserving spatial detail
	///
	/// **Links**
	///
	/// [CIHighlightShadowAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHighlightShadowAdjust)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHighlightShadowAdjust/)
	///
	@objc(CIFilterFactory_CIHighlightShadowAdjust) class CIHighlightShadowAdjust: Core {
		@objc public init?() {
			super.init(name: "CIHighlightShadowAdjust")
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

		// MARK: - inputRadius

		///
		/// Shadow Highlight Radius
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - inputShadowAmount

		///
		/// The amount of adjustment to the shadows of the image.
		///
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		let inputShadowAmount_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public var inputShadowAmount: NSNumber? {
			get {
				return filter.value(forKey: "inputShadowAmount") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputShadowAmount_Range), forKey: "inputShadowAmount")
			}
		}

		// MARK: - inputHighlightAmount

		///
		/// The amount of adjustment to the highlights of the image.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputHighlightAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputHighlightAmount: NSNumber? {
			get {
				return filter.value(forKey: "inputHighlightAmount") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputHighlightAmount_Range), forKey: "inputHighlightAmount")
			}
		}
	}
}
