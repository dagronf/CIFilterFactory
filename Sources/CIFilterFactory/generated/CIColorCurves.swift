//
//  CIColorCurves.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Color Curves
	///
	/// Uses a three-channel one-dimensional color table to transform the source image pixels. The color table must be composed of floating-point RGB values.
	///
	/// **Links**
	///
	/// [CIColorCurves Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCurves)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorCurves/)
	///
	@objc(CIFilterFactory_CIColorCurves) class CIColorCurves: FilterCommon {
		@objc public init?() {
			super.init(name: "CIColorCurves")
			self.filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputCurvesData

		///
		/// No Description
		///
		@objc public var inputCurvesData: NSData? {
			get {
				return self.filter.value(forKey: "inputCurvesData") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCurvesData")
			}
		}

		// MARK: - inputCurvesDomain

		///
		/// No Description
		///
		@objc public var inputCurvesDomain: CIVector? {
			get {
				return self.filter.value(forKey: "inputCurvesDomain") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCurvesDomain")
			}
		}

		// MARK: - inputColorSpace

		///
		/// No Description
		///
		@objc public var inputColorSpace: NSObject? {
			get {
				return self.filter.value(forKey: "inputColorSpace") as? NSObject
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColorSpace")
			}
		}
	}
}
