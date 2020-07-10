//
//  CIEdgePreserveUpsampleFilter.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.12, iOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// Edge Preserve Upsample Filter
	///
	/// Upsamples a small image to the size of the input image using the luminance of the input image as a guide to preserve detail.
	///
	/// **Links**
	///
	/// [CIEdgePreserveUpsampleFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdgePreserveUpsampleFilter)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIEdgePreserveUpsampleFilter/)
	///
	@objc(CIFilterFactory_CIEdgePreserveUpsampleFilter) class CIEdgePreserveUpsampleFilter: FilterCommon {
		@objc public init?() {
			super.init(name: "CIEdgePreserveUpsampleFilter")
			self.filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputSmallImage

		///
		/// No Description
		///
		@objc public var inputSmallImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputSmallImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputSmallImage")
			}
		}

		// MARK: - inputSpatialSigma

		///
		/// No Description
		///
		///   minValue: 0.0
		///   maxValue: 5.0
		///
		let inputSpatialSigma_Range: ClosedRange<Float> = 0.0 ... 5.0
		@objc public var inputSpatialSigma: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSpatialSigma") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputSpatialSigma_Range), forKey: "inputSpatialSigma")
			}
		}

		// MARK: - inputLumaSigma

		///
		/// No Description
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputLumaSigma_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputLumaSigma: NSNumber? {
			get {
				return self.filter.value(forKey: "inputLumaSigma") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputLumaSigma_Range), forKey: "inputLumaSigma")
			}
		}
	}
}
