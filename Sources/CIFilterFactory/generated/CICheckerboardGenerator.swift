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
	@objc(CIFilterFactory_CICheckerboardGenerator) class CICheckerboardGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CICheckerboardGenerator")
		}

		///
		/// The center of the effect as x and y coordinates.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [150 150]
		@objc public dynamic var inputCenter: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputCenter")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputCenter")
			}
		}

		///
		/// A color to use for the first set of squares.
		///
		///   Class:    CIColor
		///   Default:  rgba(1 1 1 1)
		@objc public dynamic var inputColor0: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor0")
			}
		}

		///
		/// A color to use for the second set of squares.
		///
		///   Class:    CIColor
		///   Default:  rgba(0 0 0 1)
		@objc public dynamic var inputColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}

		///
		/// The width of the squares in the pattern.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  80
		@objc public dynamic var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWidth")
			}
		}

		///
		/// The sharpness of the edges in pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputSharpness_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CICheckerboardGenerator.inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}
