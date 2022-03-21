//
//  LineOverlay.swift  (AUTOMATICALLY GENERATED FILE)
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

import AVFoundation
import CoreImage
import CoreML
import Foundation

@available(macOS 10.5, iOS 9, tvOS 9, *)
@objc public extension CIFF {
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
	@available(macOS 10.5, iOS 9, tvOS 9, *)
	@objc(CIFFLineOverlay) class LineOverlay: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CILineOverlay")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - nRNoiseLevel (inputNRNoiseLevel)

		/// The noise level of the image (used with camera data) that gets removed before tracing the edges of the image. Increasing the noise level helps to clean up the traced edges of the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNRNoiseLevel`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.07000000000000001`
		/// - Minimum value: `0.0`
		@objc public var nRNoiseLevel: Double {
			get {
				let number = self.filter.value(forKey: "inputNRNoiseLevel") as? NSNumber
				return number?.doubleValue ?? 0.07000000000000001
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: LineOverlay.nRNoiseLevelRange)
				self.filter.setValue(number, forKey: "inputNRNoiseLevel")
			}
		}

		/// `nRNoiseLevel` range definition
		public static let nRNoiseLevelRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - nRSharpness (inputNRSharpness)

		/// The amount of sharpening done when removing noise in the image before tracing the edges of the image. This improves the edge acquisition.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNRSharpness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.71`
		/// - Minimum value: `0.0`
		@objc public var nRSharpness: Double {
			get {
				let number = self.filter.value(forKey: "inputNRSharpness") as? NSNumber
				return number?.doubleValue ?? 0.71
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: LineOverlay.nRSharpnessRange)
				self.filter.setValue(number, forKey: "inputNRSharpness")
			}
		}

		/// `nRSharpness` range definition
		public static let nRSharpnessRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - edgeIntensity (inputEdgeIntensity)

		/// The accentuation factor of the Sobel gradient information when tracing the edges of the image. Higher values find more edges, although typically a low value (such as 1.0) is used.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputEdgeIntensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		@objc public var edgeIntensity: Double {
			get {
				let number = self.filter.value(forKey: "inputEdgeIntensity") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: LineOverlay.edgeIntensityRange)
				self.filter.setValue(number, forKey: "inputEdgeIntensity")
			}
		}

		/// `edgeIntensity` range definition
		public static let edgeIntensityRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - threshold (inputThreshold)

		/// This value determines edge visibility. Larger values thin out the edges.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputThreshold`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.1`
		/// - Minimum value: `0.0`
		@objc public var threshold: Double {
			get {
				let number = self.filter.value(forKey: "inputThreshold") as? NSNumber
				return number?.doubleValue ?? 0.1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: LineOverlay.thresholdRange)
				self.filter.setValue(number, forKey: "inputThreshold")
			}
		}

		/// `threshold` range definition
		public static let thresholdRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - contrast (inputContrast)

		/// The amount of anti-aliasing to use on the edges produced by this filter. Higher values produce higher contrast edges (they are less anti-aliased).
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputContrast`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `50`
		/// - Minimum value: `0.25`
		@objc public var contrast: Double {
			get {
				let number = self.filter.value(forKey: "inputContrast") as? NSNumber
				return number?.doubleValue ?? 50
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: LineOverlay.contrastRange)
				self.filter.setValue(number, forKey: "inputContrast")
			}
		}

		/// `contrast` range definition
		public static let contrastRange: PartialRangeFrom<Double> = Double(0.25)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			nRNoiseLevel: Double = 0.07000000000000001,
			nRSharpness: Double = 0.71,
			edgeIntensity: Double = 1,
			threshold: Double = 0.1,
			contrast: Double = 50
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
