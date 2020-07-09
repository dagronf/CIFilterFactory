//
//  CINinePartStretched.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.12, iOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// Nine Part Stretched
	///
	/// Distorts an image by stretching an image based on two input breakpoints
	///
	/// **Links**
	///
	/// [CINinePartStretched Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINinePartStretched)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CINinePartStretched/)
	///
	@objc(CIFilterFactory_CINinePartStretched) class CINinePartStretched: Core {
		@objc public init?() {
			super.init(name: "CINinePartStretched")
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

		// MARK: - inputBreakpoint0

		///
		/// Lower left corner of image to retain before stretching begins.
		///
		@objc public var inputBreakpoint0: CIVector? {
			get {
				return filter.value(forKey: "inputBreakpoint0") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputBreakpoint0")
			}
		}

		// MARK: - inputBreakpoint1

		///
		/// Upper right corner of image to retain after stretching ends.
		///
		@objc public var inputBreakpoint1: CIVector? {
			get {
				return filter.value(forKey: "inputBreakpoint1") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputBreakpoint1")
			}
		}

		// MARK: - inputGrowAmount

		///
		/// No Description
		///
		@objc public var inputGrowAmount: CIVector? {
			get {
				return filter.value(forKey: "inputGrowAmount") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputGrowAmount")
			}
		}
	}
}
