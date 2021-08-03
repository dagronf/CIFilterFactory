//
//  CIDisparityToDepth.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.13, iOS 11, *)
	@inlinable @objc static func DisparityToDepth() -> CIFilterFactory.CIDisparityToDepth? {
		return CIFilterFactory.CIDisparityToDepth()
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Disparity To Depth
	///
	/// Convert a disparity data image to depth data.
	///
	/// **Links**
	///
	/// [CIDisparityToDepth Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisparityToDepth)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDisparityToDepth/)
	///
	@objc(CIFilterFactory_CIDisparityToDepth) class CIDisparityToDepth: FilterCore {
		@objc public init?() {
			super.init(name: "CIDisparityToDepth")
		}

		// MARK: - Inputs

		///
		/// The input disparity data image to convert to depth data.
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

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage)
		{
			self.init()

			self.inputImage = inputImage
		}
	}
}
