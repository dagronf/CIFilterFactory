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

@available(macOS 10.4, iOS 5, tvOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Radial Gradient
	///
	/// Generates a gradient that varies radially between two circles having the same center. It is valid for one of the two circles to have a radius of 0.
	///
	/// **Links**
	///
	/// - [CIRadialGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRadialGradient)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciradialgradient?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIRadialGradient/)
	///
	@objc(CIFilterFactory_RadialGradient) class RadialGradient: FilterCore {
		@objc public init?() {
			super.init(name: "CIRadialGradient")
		}

		// MARK: - Inputs

		// MARK: - center (inputCenter)

		///
		/// The center of the effect as x and y coordinates.
		///
		///   - Attribute key: `inputCenter`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[150 150]`
		@objc public var center: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputCenter", defaultValue: Self.center_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// center default value
		@objc public static let center_default = CGPoint(x: 150.0, y: 150.0)

		// MARK: - radius0 (inputRadius0)

		///
		/// The radius of the starting circle to use in the gradient.
		///
		///   - Attribute key: `inputRadius0`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `5`
		///   minValue: 0.0
		///
		public static let radius0_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var radius0: NSNumber? {
			get {
				return self.keyedValue("inputRadius0")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: RadialGradient.radius0_Range), forKey: "inputRadius0")
			}
		}

		// MARK: - radius1 (inputRadius1)

		///
		/// The radius of the ending circle to use in the gradient.
		///
		///   - Attribute key: `inputRadius1`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `100`
		///   minValue: 0.0
		///
		public static let radius1_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var radius1: NSNumber? {
			get {
				return self.keyedValue("inputRadius1")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: RadialGradient.radius1_Range), forKey: "inputRadius1")
			}
		}

		// MARK: - color0 (inputColor0)

		///
		/// The first color to use in the gradient.
		///
		///   - Attribute key: `inputColor0`
		///   - Internal class: `CIColor`
		///   - Type: `CIAttributeTypeColor`
		///   - Default value: `rgba(1 1 1 1`)
		@objc public var color0: CIColor? {
			get {
				return self.keyedValue("inputColor0")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor0")
			}
		}

		// MARK: - color1 (inputColor1)

		///
		/// The second color to use in the gradient.
		///
		///   - Attribute key: `inputColor1`
		///   - Internal class: `CIColor`
		///   - Type: `CIAttributeTypeColor`
		///   - Default value: `rgba(0 0 0 1`)
		@objc public var color1: CIColor? {
			get {
				return self.keyedValue("inputColor1")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor1")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			center: CGPoint = RadialGradient.center_default,
			radius0: NSNumber = 5,
			radius1: NSNumber = 100,
			color0: CIColor,
			color1: CIColor
		) {
			self.init()

			self.center = center
			self.radius0 = radius0
			self.radius1 = radius1
			self.color0 = color0
			self.color1 = color1
		}
	}
}
