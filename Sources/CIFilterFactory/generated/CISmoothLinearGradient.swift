//
//  CISmoothLinearGradient.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.10, iOS 6, tvOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Smooth Linear Gradient
	///
	/// Generates a gradient that varies along a linear axis between two defined endpoints.
	///
	/// **Links**
	///
	/// - [CISmoothLinearGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISmoothLinearGradient)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cismoothlineargradient?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISmoothLinearGradient/)
	///
	@objc(CIFilterFactory_SmoothLinearGradient) class SmoothLinearGradient: FilterCore {
		@objc public init?() {
			super.init(name: "CISmoothLinearGradient")
		}

		// MARK: - Inputs

		// MARK: - point0 (inputPoint0)

		///
		/// The starting position of the gradient -- where the first color begins.
		///
		///   - Attribute key: `inputPoint0`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[0 0]`
		@objc public var point0: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint0", defaultValue: Self.point0_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint0")
			}
		}

		/// point0 default value
		@objc public static let point0_default = CGPoint(x: 0.0, y: 0.0)

		// MARK: - point1 (inputPoint1)

		///
		/// The ending position of the gradient -- where the second color begins.
		///
		///   - Attribute key: `inputPoint1`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[200 200]`
		@objc public var point1: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint1", defaultValue: Self.point1_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint1")
			}
		}

		/// point1 default value
		@objc public static let point1_default = CGPoint(x: 200.0, y: 200.0)

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
			point0: CGPoint = SmoothLinearGradient.point0_default,
			point1: CGPoint = SmoothLinearGradient.point1_default,
			color0: CIColor,
			color1: CIColor
		) {
			self.init()

			self.point0 = point0
			self.point1 = point1
			self.color0 = color0
			self.color1 = color1
		}
	}
}
