//
//  CIAffineTransform.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Affine Transform
	///
	/// Applies an affine transformation to an image. You can scale, translate, or rotate the input image. You can also apply a combination of these operations.
	///
	/// **Links**
	///
	/// [CIAffineTransform Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineTransform)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAffineTransform/)
	///
	@objc(CIFilterFactory_CIAffineTransform) class CIAffineTransform: FilterCore {
		@objc public init?() {
			super.init(name: "CIAffineTransform")
		}

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// A transform to apply to the image.
		///
		///   Class:    NSAffineTransform
		///   Type:     CIAttributeTypeTransform
		///   Default:  {m11:1.0, m12:0.0, m21:0.0, m22:1.0, tX:0.0, tY:0.0}
		@objc public dynamic var inputTransform: CIFilterFactory.AffineTransform? {
			get {
				return AffineTransform(filter: self.filter, key: "inputTransform")
			}
			set {
				self.filter.setValue(newValue?.embeddedValue(), forKey: "inputTransform")
			}
		}
	}
}
