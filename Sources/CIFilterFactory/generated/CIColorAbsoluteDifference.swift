//
//  CIColorAbsoluteDifference.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 11.0, iOS 14, *)
	@inlinable @objc static func ColorAbsoluteDifference() -> CIFilterFactory.CIColorAbsoluteDifference? {
		return CIFilterFactory.CIColorAbsoluteDifference()
	}
}

@available(macOS 11.0, iOS 14, *)
@objc public extension CIFilterFactory {
	///
	/// Color Absolute Difference
	///
	/// Produces an image that is the absolute value of the color difference between two images. The alpha channel of the result will be the product of the two image alpha channels.
	///
	/// **Links**
	///
	/// [CIColorAbsoluteDifference Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorAbsoluteDifference)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorAbsoluteDifference/)
	///
	@objc(CIFilterFactory_CIColorAbsoluteDifference) class CIColorAbsoluteDifference: FilterCore {
		@objc public init?() {
			super.init(name: "CIColorAbsoluteDifference")
		}

		// MARK: - Inputs

		///
		/// The first input image for differencing.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		///
		/// The second input image for differencing.
		///
		///   Class:    CIImage
		@objc public dynamic var inputImage2: CIImage? {
			get {
				return self.keyedValue("inputImage2")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage2")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputImage2: CIImage
		) {
			self.init()

			self.inputImage = inputImage
			self.inputImage2 = inputImage2
		}
	}
}
