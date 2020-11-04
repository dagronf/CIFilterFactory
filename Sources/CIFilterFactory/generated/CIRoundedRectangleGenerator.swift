//
//  CIRoundedRectangleGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.15, iOS 13, *)
	@inlinable @objc static func RoundedRectangleGenerator() -> CIFilterFactory.CIRoundedRectangleGenerator? {
		return CIFilterFactory.CIRoundedRectangleGenerator()
	}
}

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
	@objc(CIFilterFactory_CIRoundedRectangleGenerator) class CIRoundedRectangleGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CIRoundedRectangleGenerator")
		}

		// MARK: - Inputs

		///
		/// A rectangle that defines the extent of the effect.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeRectangle
		///   Default:  [0 0 100 100]
		@objc public dynamic var inputExtent: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputExtent")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputExtent")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  10
		///   minValue: 0.0
		///
		static let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIRoundedRectangleGenerator.inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// A color.
		///
		///   Class:    CIColor
		///   Type:     CIAttributeTypeColor
		///   Default:  rgba(1 1 1 1)
		@objc public dynamic var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputExtent: CIFilterFactory.Rect = CIFilterFactory.Rect(x: 0.0, y: 0.0, width: 100.0, height: 100.0),
			inputRadius: NSNumber = 10,
			inputColor: CIColor
		) {
			self.init()

			self.inputExtent = inputExtent
			self.inputRadius = inputRadius
			self.inputColor = inputColor
		}
	}
}
