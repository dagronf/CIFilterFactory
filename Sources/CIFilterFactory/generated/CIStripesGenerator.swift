//
//  CIStripesGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

public extension CIFilter {
	@available(macOS 10.4, iOS 5, *)
	@inlinable @objc static func StripesGenerator() -> CIFilterFactory.CIStripesGenerator? {
		return CIFilterFactory.CIStripesGenerator()
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Stripes
	///
	/// Generates a stripe pattern. You can control the color of the stripes, the spacing, and the contrast.
	///
	/// **Links**
	///
	/// [CIStripesGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStripesGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIStripesGenerator/)
	///
	@objc(CIFilterFactory_CIStripesGenerator) class CIStripesGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CIStripesGenerator")
		}

		// MARK: - Inputs

		///
		/// The x and y position to use as the center of the stripe pattern.
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
		/// A color to use for the odd stripes.
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
		/// A color to use for the even stripes.
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
		/// The width of a stripe.
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
		/// The sharpness of the stripe pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0.
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
				self.filter.setValue(newValue?.clamped(bounds: CIStripesGenerator.inputSharpness_Range), forKey: "inputSharpness")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputCenter: CIFilterFactory.Point = CIFilterFactory.Point(x: 150.0, y: 150.0),
			inputColor0: CIColor,
			inputColor1: CIColor,
			inputWidth: NSNumber = 80,
			inputSharpness: NSNumber = 1
		) {
			self.init()

			self.inputCenter = inputCenter
			self.inputColor0 = inputColor0
			self.inputColor1 = inputColor1
			self.inputWidth = inputWidth
			self.inputSharpness = inputSharpness
		}
	}
}
