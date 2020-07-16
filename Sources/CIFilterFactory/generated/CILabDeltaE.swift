//
//  CILabDeltaE.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Lab ∆E
	///
	/// Produces an image with the Lab ∆E difference values between two images. The result image will contain ∆E 1994 values between 0.0 and 100.0 where 2.0 is considered a just noticeable difference.
	///
	/// **Links**
	///
	/// [CILabDeltaE Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILabDeltaE)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILabDeltaE/)
	///
	@objc(CIFilterFactory_CILabDeltaE) class CILabDeltaE: FilterCore {
		@objc public init?() {
			super.init(name: "CILabDeltaE")
		}

		///
		/// The first input image for comparison.
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
		/// The second input image for comparison.
		///
		///   Class:    CIImage
		@objc public dynamic var inputImage2: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage2") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage2")
			}
		}
	}
}
