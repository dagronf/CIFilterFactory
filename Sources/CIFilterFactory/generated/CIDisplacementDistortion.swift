//
//  CIDisplacementDistortion.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Displacement Distortion
	///
	/// Applies the grayscale values of the second image to the first image. The output image has a texture defined by the grayscale values.
	///
	/// **Links**
	///
	/// [CIDisplacementDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisplacementDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDisplacementDistortion/)
	///
	@objc(CIFilterFactory_CIDisplacementDistortion) class CIDisplacementDistortion: FilterCore {
		@objc public init?() {
			super.init(name: "CIDisplacementDistortion")
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
		/// An image whose grayscale values will be applied to the source image.
		///
		///   Class:    CIImage
		@objc public dynamic var inputDisplacementImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputDisplacementImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputDisplacementImage")
			}
		}

		///
		/// The amount of texturing of the resulting image. The larger the value, the greater the texturing.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  50
		///   minValue: 0.0
		///
		static let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDisplacementDistortion.inputScale_Range), forKey: "inputScale")
			}
		}
	}
}
