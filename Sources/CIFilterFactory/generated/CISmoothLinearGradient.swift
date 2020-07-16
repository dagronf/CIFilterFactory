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

@available(macOS 10.10, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Smooth Linear Gradient
	///
	/// Generates a gradient that varies along a linear axis between two defined endpoints.
	///
	/// **Links**
	///
	/// [CISmoothLinearGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISmoothLinearGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISmoothLinearGradient/)
	///
	@objc(CIFilterFactory_CISmoothLinearGradient) class CISmoothLinearGradient: FilterCore {
		@objc public init?() {
			super.init(name: "CISmoothLinearGradient")
		}

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
				self.filter.setValue(newValue?.vector, forKey: "inputPoint0")
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
				self.filter.setValue(newValue?.vector, forKey: "inputPoint1")
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
				return self.filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor0")
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
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}
	}
}
