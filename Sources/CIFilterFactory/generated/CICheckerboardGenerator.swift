//
//  CICheckerboardGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Checkerboard
	///
	/// Generates a pattern of squares of alternating colors. You can specify the size, colors, and the sharpness of the pattern.
	///
	/// **Links**
	///
	/// [CICheckerboardGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICheckerboardGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICheckerboardGenerator/)
	///
	@objc(CIFilterFactory_CICheckerboardGenerator) class CICheckerboardGenerator: FilterCommon {
		@objc public init?() {
			super.init(name: "CICheckerboardGenerator")
			self.filter.setDefaults()
		}

		// MARK: - inputCenter

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		// MARK: - inputColor0

		///
		/// A color to use for the first set of squares.
		///
		@objc public var inputColor0: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor0")
			}
		}

		// MARK: - inputColor1

		///
		/// A color to use for the second set of squares.
		///
		@objc public var inputColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}

		// MARK: - inputWidth

		///
		/// The width of the squares in the pattern.
		///
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWidth")
			}
		}

		// MARK: - inputSharpness

		///
		/// The sharpness of the edges in pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputSharpness_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}
