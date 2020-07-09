//
//  CILinearGradient.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Linear Gradient
	///
	/// Generates a gradient that varies along a linear axis between two defined endpoints.
	///
	/// **Links**
	///
	/// [CILinearGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILinearGradient/)
	///
	@objc(CIFilterFactory_CILinearGradient) class CILinearGradient: Core {
		@objc public init?() {
			super.init(name: "CILinearGradient")
			filter.setDefaults()
		}

		// MARK: - inputPoint0

		///
		/// The starting position of the gradient -- where the first color begins.
		///
		@objc public var inputPoint0: CIVector? {
			get {
				return filter.value(forKey: "inputPoint0") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputPoint0")
			}
		}

		// MARK: - inputPoint1

		///
		/// The ending position of the gradient -- where the second color begins.
		///
		@objc public var inputPoint1: CIVector? {
			get {
				return filter.value(forKey: "inputPoint1") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputPoint1")
			}
		}

		// MARK: - inputColor0

		///
		/// The first color to use in the gradient.
		///
		@objc public var inputColor0: CIColor? {
			get {
				return filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputColor0")
			}
		}

		// MARK: - inputColor1

		///
		/// The second color to use in the gradient.
		///
		@objc public var inputColor1: CIColor? {
			get {
				return filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputColor1")
			}
		}
	}
}
