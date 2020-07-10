//
//  CILineOverlay.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Line Overlay
	///
	/// Creates a sketch that outlines the edges of an image in black, leaving the non-outlined portions of the image transparent. The result has alpha and is rendered in black, so it won’t look like much until you render it over another image using source over compositing.
	///
	/// **Links**
	///
	/// [CILineOverlay Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILineOverlay)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILineOverlay/)
	///
	@objc(CIFilterFactory_CILineOverlay) class CILineOverlay: FilterCommon {
		@objc public init?() {
			super.init(name: "CILineOverlay")
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

		// MARK: - inputNRNoiseLevel

		///
		/// The noise level of the image (used with camera data) that gets removed before tracing the edges of the image. Increasing the noise level helps to clean up the traced edges of the image.
		///
		///   minValue: 0.0
		///
		let inputNRNoiseLevel_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputNRNoiseLevel: NSNumber? {
			get {
				return self.filter.value(forKey: "inputNRNoiseLevel") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputNRNoiseLevel_Range), forKey: "inputNRNoiseLevel")
			}
		}

		// MARK: - inputNRSharpness

		///
		/// The amount of sharpening done when removing noise in the image before tracing the edges of the image. This improves the edge acquisition.
		///
		///   minValue: 0.0
		///
		let inputNRSharpness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputNRSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputNRSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputNRSharpness_Range), forKey: "inputNRSharpness")
			}
		}

		// MARK: - inputEdgeIntensity

		///
		/// The accentuation factor of the Sobel gradient information when tracing the edges of the image. Higher values find more edges, although typically a low value (such as 1.0) is used.
		///
		///   minValue: 0.0
		///
		let inputEdgeIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputEdgeIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputEdgeIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputEdgeIntensity_Range), forKey: "inputEdgeIntensity")
			}
		}

		// MARK: - inputThreshold

		///
		/// This value determines edge visibility. Larger values thin out the edges.
		///
		///   minValue: 0.0
		///
		let inputThreshold_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputThreshold: NSNumber? {
			get {
				return self.filter.value(forKey: "inputThreshold") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputThreshold_Range), forKey: "inputThreshold")
			}
		}

		// MARK: - inputContrast

		///
		/// The amount of anti-aliasing to use on the edges produced by this filter. Higher values produce higher contrast edges (they are less anti-aliased).
		///
		///   minValue: 0.25
		///
		let inputContrast_Range: PartialRangeFrom<Float> = Float(0.25)...
		@objc public var inputContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputContrast_Range), forKey: "inputContrast")
			}
		}
	}
}
