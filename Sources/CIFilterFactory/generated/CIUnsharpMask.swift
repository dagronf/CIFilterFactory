//
//  CIUnsharpMask.swift  (AUTOMATICALLY GENERATED FILE)
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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Unsharp Mask
	///
	/// Increases the contrast of the edges between pixels of different colors in an image.
	///
	/// **Links**
	///
	/// [CIUnsharpMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIUnsharpMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIUnsharpMask/)
	///
	@objc(CIFilterFactory_CIUnsharpMask) class CIUnsharpMask: FilterCommon {
		@objc public init?() {
			super.init(name: "CIUnsharpMask")
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class: CIImage, Type: CIAttributeTypeImage
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputRadius

		///
		/// The radius around a given pixel to apply the unsharp mask. The larger the radius, the more of the image is affected.
		///
		///   Class: NSNumber, Type: CIAttributeTypeDistance
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputRadius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - inputIntensity

		///
		/// The intensity of the effect. The larger the value, the more contrast in the affected area.
		///
		///   Class: NSNumber, Type: CIAttributeTypeScalar
		///
		///   minValue: 0.0
		///
		let inputIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputIntensity_Range), forKey: "inputIntensity")
			}
		}
	}
}
