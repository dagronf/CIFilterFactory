//
//  CIColorMatrix.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Matrix
	///
	/// Multiplies source color values and adds a bias factor to each color component.
	///
	/// **Links**
	///
	/// [CIColorMatrix Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMatrix)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorMatrix/)
	///
	@objc(CIFilterFactory_CIColorMatrix) class CIColorMatrix: FilterCommon {
		@objc public init?() {
			super.init(name: "CIColorMatrix")
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
		/// The amount of red to multiply the source color values by.
		///
		///   Class:    CIVector
		///   Default:  [1 0 0 0]
		@objc public dynamic var inputRVector: CIVector? {
			get {
				return self.filter.value(forKey: "inputRVector") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRVector")
			}
		}

		///
		/// The amount of green to multiply the source color values by.
		///
		///   Class:    CIVector
		///   Default:  [0 1 0 0]
		@objc public dynamic var inputGVector: CIVector? {
			get {
				return self.filter.value(forKey: "inputGVector") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputGVector")
			}
		}

		///
		/// The amount of blue to multiply the source color values by.
		///
		///   Class:    CIVector
		///   Default:  [0 0 1 0]
		@objc public dynamic var inputBVector: CIVector? {
			get {
				return self.filter.value(forKey: "inputBVector") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBVector")
			}
		}

		///
		/// The amount of alpha to multiply the source color values by.
		///
		///   Class:    CIVector
		///   Default:  [0 0 0 1]
		@objc public dynamic var inputAVector: CIVector? {
			get {
				return self.filter.value(forKey: "inputAVector") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAVector")
			}
		}

		///
		/// A vector that’s added to each color component.
		///
		///   Class:    CIVector
		///   Default:  [0 0 0 0]
		@objc public dynamic var inputBiasVector: CIVector? {
			get {
				return self.filter.value(forKey: "inputBiasVector") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBiasVector")
			}
		}
	}
}
