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
	@objc(CIFilterFactory_CILineOverlay) class CILineOverlay: FilterCore {
		@objc public init?() {
			super.init(name: "CILineOverlay")
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
		/// The noise level of the image (used with camera data) that gets removed before tracing the edges of the image. Increasing the noise level helps to clean up the traced edges of the image.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.07000000000000001
		///   minValue: 0.0
		///
		static let inputNRNoiseLevel_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputNRNoiseLevel: NSNumber? {
			get {
				return self.filter.value(forKey: "inputNRNoiseLevel") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CILineOverlay.inputNRNoiseLevel_Range), forKey: "inputNRNoiseLevel")
			}
		}

		///
		/// The amount of sharpening done when removing noise in the image before tracing the edges of the image. This improves the edge acquisition.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.71
		///   minValue: 0.0
		///
		static let inputNRSharpness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputNRSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputNRSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CILineOverlay.inputNRSharpness_Range), forKey: "inputNRSharpness")
			}
		}

		///
		/// The accentuation factor of the Sobel gradient information when tracing the edges of the image. Higher values find more edges, although typically a low value (such as 1.0) is used.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///
		static let inputEdgeIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputEdgeIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputEdgeIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CILineOverlay.inputEdgeIntensity_Range), forKey: "inputEdgeIntensity")
			}
		}

		///
		/// This value determines edge visibility. Larger values thin out the edges.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.1
		///   minValue: 0.0
		///
		static let inputThreshold_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputThreshold: NSNumber? {
			get {
				return self.filter.value(forKey: "inputThreshold") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CILineOverlay.inputThreshold_Range), forKey: "inputThreshold")
			}
		}

		///
		/// The amount of anti-aliasing to use on the edges produced by this filter. Higher values produce higher contrast edges (they are less anti-aliased).
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  50
		///   minValue: 0.25
		///
		static let inputContrast_Range: PartialRangeFrom<Float> = Float(0.25)...
		@objc public dynamic var inputContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CILineOverlay.inputContrast_Range), forKey: "inputContrast")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputNRNoiseLevel: NSNumber = 0.07000000000000001,
			inputNRSharpness: NSNumber = 0.71,
			inputEdgeIntensity: NSNumber = 1,
			inputThreshold: NSNumber = 0.1,
			inputContrast: NSNumber = 50
		) {
			self.init()

			self.inputImage = inputImage
			self.inputNRNoiseLevel = inputNRNoiseLevel
			self.inputNRSharpness = inputNRSharpness
			self.inputEdgeIntensity = inputEdgeIntensity
			self.inputThreshold = inputThreshold
			self.inputContrast = inputContrast
		}
	}
}
