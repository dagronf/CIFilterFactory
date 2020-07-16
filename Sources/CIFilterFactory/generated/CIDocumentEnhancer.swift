//
//  CIDocumentEnhancer.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Document Enhancer
	///
	/// Enhance a document image by removing unwanted shadows, whitening the background, and enhancing contrast.
	///
	/// **Links**
	///
	/// [CIDocumentEnhancer Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDocumentEnhancer)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDocumentEnhancer/)
	///
	@objc(CIFilterFactory_CIDocumentEnhancer) class CIDocumentEnhancer: FilterCommon {
		@objc public init?() {
			super.init(name: "CIDocumentEnhancer")
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
		/// The amount of enhancement.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///   maxValue: 10.0
		///
		static let inputAmount_Range: ClosedRange<Float> = 0.0 ... 10.0
		@objc public dynamic var inputAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDocumentEnhancer.inputAmount_Range), forKey: "inputAmount")
			}
		}
	}
}
