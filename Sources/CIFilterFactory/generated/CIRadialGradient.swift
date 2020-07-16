//
//  CIRadialGradient.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Radial Gradient
	///
	/// Generates a gradient that varies radially between two circles having the same center. It is valid for one of the two circles to have a radius of 0.
	///
	/// **Links**
	///
	/// [CIRadialGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRadialGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIRadialGradient/)
	///
	@objc(CIFilterFactory_CIRadialGradient) class CIRadialGradient: FilterCommon {
		@objc public init?() {
			super.init(name: "CIRadialGradient")
		}

		// MARK: - inputCenter

		///
		/// The center of the effect as x and y coordinates.
		///
		///   Class: CIVector, Type: CIAttributeTypePosition
		///
		@objc public var inputCenter: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputCenter")
			}
			set {
				self.filter.setValue(newValue?.point, forKey: "inputCenter")
			}
		}

		// MARK: - inputRadius0

		///
		/// The radius of the starting circle to use in the gradient.
		///
		///   Class: NSNumber, Type: CIAttributeTypeDistance
		///
		///   minValue: 0.0
		///
		let inputRadius0_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius0: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius0") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputRadius0_Range), forKey: "inputRadius0")
			}
		}

		// MARK: - inputRadius1

		///
		/// The radius of the ending circle to use in the gradient.
		///
		///   Class: NSNumber, Type: CIAttributeTypeDistance
		///
		///   minValue: 0.0
		///
		let inputRadius1_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius1: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius1") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputRadius1_Range), forKey: "inputRadius1")
			}
		}

		// MARK: - inputColor0

		///
		/// The first color to use in the gradient.
		///
		///   Class: CIColor, Type: CIAttributeTypeColor
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
		/// The second color to use in the gradient.
		///
		///   Class: CIColor, Type: CIAttributeTypeColor
		///
		@objc public var inputColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}
	}
}
