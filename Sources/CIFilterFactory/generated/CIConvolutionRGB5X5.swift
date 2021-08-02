//
//  CIConvolutionRGB5X5.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 12.0, iOS 15, *)
	@inlinable @objc static func ConvolutionRGB5X5() -> CIFilterFactory.CIConvolutionRGB5X5? {
		return CIFilterFactory.CIConvolutionRGB5X5()
	}
}

@available(macOS 12.0, iOS 15, *)
@objc public extension CIFilterFactory {
	///
	/// 5 by 5 RGB Convolution
	///
	/// Convolution of RGB channels with 5 by 5 matrix
	///
	/// **Links**
	///
	/// [CIConvolutionRGB5X5 Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolutionRGB5X5)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIConvolutionRGB5X5/)
	///
	@objc(CIFilterFactory_CIConvolutionRGB5X5) class CIConvolutionRGB5X5: FilterCore {
		@objc public init?() {
			super.init(name: "CIConvolutionRGB5X5")
		}

		// MARK: - Inputs

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
		/// No Description
		///
		///   Class:    CIVector
		///   Default:  [0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]
		@objc public dynamic var inputWeights: CIVector? {
			get {
				return self.filter.value(forKey: "inputWeights") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWeights")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Default:  0
		@objc public dynamic var inputBias: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBias") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBias")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputWeights: CIVector = CIVector([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]),
			inputBias: NSNumber = 0
		) {
			self.init()

			self.inputImage = inputImage
			self.inputWeights = inputWeights
			self.inputBias = inputBias
		}
	}
}
