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

@available(macOS 10.15, iOS 13, tvOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Rounded Rectangle Generator
	///
	/// Generates a rounded rectangle image with the specified extent, corner radius, and color.
	///
	/// **Links**
	///
	/// - [CIRoundedRectangleGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRoundedRectangleGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciroundedrectanglegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIRoundedRectangleGenerator/)
	///
	@objc(CIFilterFactory_RoundedRectangleGenerator) class RoundedRectangleGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CIRoundedRectangleGenerator")
		}

		// MARK: - Inputs

		// MARK: - extent (inputExtent)

		///
		/// A rectangle that defines the extent of the effect.
		///
		///   - Attribute key: `inputExtent`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypeRectangle`
		///   - Default value: `[0 0 100 100]`
		@objc public var extent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extent_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// extent default value
		@objc public static let extent_default = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)

		// MARK: - radius (inputRadius)

		///
		/// The distance from the center of the effect.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `10`
		///   minValue: 0.0
		///
		public static let radius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: RoundedRectangleGenerator.radius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - color (inputColor)

		///
		/// A color.
		///
		///   - Attribute key: `inputColor`
		///   - Internal class: `CIColor`
		///   - Type: `CIAttributeTypeColor`
		///   - Default value: `rgba(1 1 1 1`)
		@objc public var color: CIColor? {
			get {
				return self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			extent: CGRect = RoundedRectangleGenerator.extent_default,
			radius: NSNumber = 10,
			color: CIColor
		) {
			self.init()

			self.extent = extent
			self.radius = radius
			self.color = color
		}
	}
}
