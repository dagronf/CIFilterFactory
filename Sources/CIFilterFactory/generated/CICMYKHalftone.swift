//
//  CICMYKHalftone.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// CMYK Halftone
	///
	/// Creates a color, halftoned rendition of the source image, using cyan, magenta, yellow, and black inks over a white page.
	///
	/// **Links**
	///
	/// [CICMYKHalftone Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICMYKHalftone)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICMYKHalftone/)
	///
	@objc(CIFilterFactory_CICMYKHalftone) class CICMYKHalftone: FilterCommon {
		@objc public init?() {
			super.init(name: "CICMYKHalftone")
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

		// MARK: - inputCenter

		///
		/// The x and y position to use as the center of the halftone pattern
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		// MARK: - inputWidth

		///
		/// The distance between dots in the pattern.
		///
		///   minValue: -2.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(-2.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputWidth_Range), forKey: "inputWidth")
			}
		}

		// MARK: - inputAngle

		///
		/// The angle of the pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		// MARK: - inputSharpness

		///
		/// The sharpness of the pattern. The larger the value, the sharper the pattern.
		///
		///   minValue: 0.0
		///
		let inputSharpness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputSharpness_Range), forKey: "inputSharpness")
			}
		}

		// MARK: - inputGCR

		///
		/// The gray component replacement value. The value can vary from 0.0 (none) to 1.0.
		///
		///   minValue: 0.0
		///
		let inputGCR_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputGCR: NSNumber? {
			get {
				return self.filter.value(forKey: "inputGCR") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputGCR_Range), forKey: "inputGCR")
			}
		}

		// MARK: - inputUCR

		///
		/// The under color removal value. The value can vary from 0.0 to 1.0.
		///
		///   minValue: 0.0
		///
		let inputUCR_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputUCR: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUCR") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputUCR_Range), forKey: "inputUCR")
			}
		}
	}
}
