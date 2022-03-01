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

@available(macOS 10.5, iOS 9, tvOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Line Overlay
	///
	/// Creates a sketch that outlines the edges of an image in black, leaving the non-outlined portions of the image transparent. The result has alpha and is rendered in black, so it won’t look like much until you render it over another image using source over compositing.
	///
	/// **Links**
	///
	/// - [CILineOverlay Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILineOverlay)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cilineoverlay?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CILineOverlay/)
	///
	@objc(CIFilterFactory_LineOverlay) class LineOverlay: FilterCore {
		@objc public init?() {
			super.init(name: "CILineOverlay")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   - Attribute key: `inputImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - nRNoiseLevel (inputNRNoiseLevel)

		///
		/// The noise level of the image (used with camera data) that gets removed before tracing the edges of the image. Increasing the noise level helps to clean up the traced edges of the image.
		///
		///   - Attribute key: `inputNRNoiseLevel`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.07000000000000001`
		///   minValue: 0.0
		///
		public static let nRNoiseLevel_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var nRNoiseLevel: NSNumber? {
			get {
				return self.keyedValue("inputNRNoiseLevel")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: LineOverlay.nRNoiseLevel_Range), forKey: "inputNRNoiseLevel")
			}
		}

		// MARK: - nRSharpness (inputNRSharpness)

		///
		/// The amount of sharpening done when removing noise in the image before tracing the edges of the image. This improves the edge acquisition.
		///
		///   - Attribute key: `inputNRSharpness`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.71`
		///   minValue: 0.0
		///
		public static let nRSharpness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var nRSharpness: NSNumber? {
			get {
				return self.keyedValue("inputNRSharpness")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: LineOverlay.nRSharpness_Range), forKey: "inputNRSharpness")
			}
		}

		// MARK: - edgeIntensity (inputEdgeIntensity)

		///
		/// The accentuation factor of the Sobel gradient information when tracing the edges of the image. Higher values find more edges, although typically a low value (such as 1.0) is used.
		///
		///   - Attribute key: `inputEdgeIntensity`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///
		public static let edgeIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var edgeIntensity: NSNumber? {
			get {
				return self.keyedValue("inputEdgeIntensity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: LineOverlay.edgeIntensity_Range), forKey: "inputEdgeIntensity")
			}
		}

		// MARK: - threshold (inputThreshold)

		///
		/// This value determines edge visibility. Larger values thin out the edges.
		///
		///   - Attribute key: `inputThreshold`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.1`
		///   minValue: 0.0
		///
		public static let threshold_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var threshold: NSNumber? {
			get {
				return self.keyedValue("inputThreshold")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: LineOverlay.threshold_Range), forKey: "inputThreshold")
			}
		}

		// MARK: - contrast (inputContrast)

		///
		/// The amount of anti-aliasing to use on the edges produced by this filter. Higher values produce higher contrast edges (they are less anti-aliased).
		///
		///   - Attribute key: `inputContrast`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `50`
		///   minValue: 0.25
		///
		public static let contrast_Range: PartialRangeFrom<Float> = Float(0.25)...
		@objc public var contrast: NSNumber? {
			get {
				return self.keyedValue("inputContrast")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: LineOverlay.contrast_Range), forKey: "inputContrast")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			nRNoiseLevel: NSNumber = 0.07000000000000001,
			nRSharpness: NSNumber = 0.71,
			edgeIntensity: NSNumber = 1,
			threshold: NSNumber = 0.1,
			contrast: NSNumber = 50
		) {
			self.init()

			self.image = image
			self.nRNoiseLevel = nRNoiseLevel
			self.nRSharpness = nRSharpness
			self.edgeIntensity = edgeIntensity
			self.threshold = threshold
			self.contrast = contrast
		}
	}
}
