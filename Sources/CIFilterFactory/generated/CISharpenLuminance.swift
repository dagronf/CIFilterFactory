//
//  CISharpenLuminance.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.4, iOS 6, *)
	@inlinable @objc static func SharpenLuminance() -> CIFilterFactory.CISharpenLuminance? {
		return CIFilterFactory.CISharpenLuminance()
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Sharpen Luminance
	///
	/// Increases image detail by sharpening. It operates on the luminance of the image; the chrominance of the pixels remains unaffected.
	///
	/// **Links**
	///
	/// [CISharpenLuminance Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISharpenLuminance)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISharpenLuminance/)
	///
	@objc(CIFilterFactory_CISharpenLuminance) class CISharpenLuminance: FilterCore {
		@objc public init?() {
			super.init(name: "CISharpenLuminance")
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
		/// The amount of sharpening to apply. Larger values are sharper.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.4
		@objc public dynamic var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputSharpness")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1.69
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputSharpness: NSNumber = 0.4,
			inputRadius: NSNumber = 1.69
		) {
			self.init()

			self.inputImage = inputImage
			self.inputSharpness = inputSharpness
			self.inputRadius = inputRadius
		}
	}
}
