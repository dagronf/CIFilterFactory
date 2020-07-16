//
//  CIHeightFieldFromMask.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Height Field From Mask
	///
	/// Produces a continuous three-dimensional, loft-shaped height field from a grayscale mask. The white values of the mask define those pixels that are inside the height field while the black values define those pixels that are outside. The field varies smoothly and continuously inside the mask, reaching the value 0 at the edge of the mask. You can use this filter with the Shaded Material filter to produce extremely realistic shaded objects.
	///
	/// **Links**
	///
	/// [CIHeightFieldFromMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHeightFieldFromMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHeightFieldFromMask/)
	///
	@objc(CIFilterFactory_CIHeightFieldFromMask) class CIHeightFieldFromMask: FilterCommon {
		@objc public init?() {
			super.init(name: "CIHeightFieldFromMask")
		}

		// MARK: - inputImage

		///
		/// The white values of the mask define those pixels that are inside the height field while the black values define those pixels that are outside. The field varies smoothly and continuously inside the mask, reaching the value 0 at the edge of the mask.
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
		/// The distance from the edge of the mask for the smooth transition is proportional to the input radius. Larger values make the transition smoother and more pronounced. Smaller values make the transition approximate a fillet radius.
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
	}
}
