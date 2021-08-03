//
//  CILinearGradient.swift  (AUTOMATICALLY GENERATED FILE)
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
	@inlinable @objc static func LinearGradient() -> CIFilterFactory.CILinearGradient? {
		return CIFilterFactory.CILinearGradient()
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Linear Gradient
	///
	/// Generates a gradient that varies along a linear axis between two defined endpoints.
	///
	/// **Links**
	///
	/// [CILinearGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILinearGradient/)
	///
	@objc(CIFilterFactory_CILinearGradient) class CILinearGradient: FilterCore {
		@objc public init?() {
			super.init(name: "CILinearGradient")
		}

		// MARK: - Inputs

		///
		/// The starting position of the gradient -- where the first color begins.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [0 0]
		@objc public dynamic var inputPoint0: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputPoint0")
			}
			set {
				self.setKeyedValue(newValue?.vector, for: "inputPoint0")
			}
		}

		///
		/// The ending position of the gradient -- where the second color begins.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [200 200]
		@objc public dynamic var inputPoint1: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputPoint1")
			}
			set {
				self.setKeyedValue(newValue?.vector, for: "inputPoint1")
			}
		}

		///
		/// The first color to use in the gradient.
		///
		///   Class:    CIColor
		///   Type:     CIAttributeTypeColor
		///   Default:  rgba(1 1 1 1)
		@objc public dynamic var inputColor0: CIColor? {
			get {
				return self.keyedValue("inputColor0")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor0")
			}
		}

		///
		/// The second color to use in the gradient.
		///
		///   Class:    CIColor
		///   Type:     CIAttributeTypeColor
		///   Default:  rgba(0 0 0 1)
		@objc public dynamic var inputColor1: CIColor? {
			get {
				return self.keyedValue("inputColor1")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor1")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputPoint0: CIFilterFactory.Point = CIFilterFactory.Point(x: 0.0, y: 0.0),
			inputPoint1: CIFilterFactory.Point = CIFilterFactory.Point(x: 200.0, y: 200.0),
			inputColor0: CIColor,
			inputColor1: CIColor
		) {
			self.init()

			self.inputPoint0 = inputPoint0
			self.inputPoint1 = inputPoint1
			self.inputColor0 = inputColor0
			self.inputColor1 = inputColor1
		}
	}
}
