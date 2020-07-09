//
//  CIRoundedRectangleGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	import UIKit // For access to NSValue.cgAffineTransformValue
#endif

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Rounded Rectangle Generator
	///
	/// Generates a rounded rectangle image with the specified extent, corner radius, and color.
	///
	/// **Links**
	///
	/// [CIRoundedRectangleGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRoundedRectangleGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIRoundedRectangleGenerator/)
	///
	@objc(CIFilterFactory_CIRoundedRectangleGenerator) class CIRoundedRectangleGenerator: Core {
		@objc public init?() {
			super.init(name: "CIRoundedRectangleGenerator")
			filter.setDefaults()
		}

		// MARK: - inputExtent

		///
		/// A rectangle that defines the extent of the effect.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputExtent")
			}
		}

		// MARK: - inputRadius

		///
		/// The distance from the center of the effect.
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

		// MARK: - inputColor

		///
		/// A color.
		///
		@objc public var inputColor: CIColor? {
			get {
				return filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputColor")
			}
		}
	}
}
