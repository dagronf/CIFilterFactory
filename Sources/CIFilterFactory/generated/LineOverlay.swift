//
//  LineOverlay.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2023 Darren Ford. All rights reserved.
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

@objc public extension CIFF {
	/// Line Overlay
	///
	/// Creates a sketch that outlines the edges of an image in black, leaving the non-outlined portions of the image transparent. The result has alpha and is rendered in black, so it won’t look like much until you render it over another image using source over compositing.
	///
	/// **CIFilter Name**
	/// - CILineOverlay
	///
	/// **Availability**
	/// - macOS 10.5, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Stylize (*CICategoryStylize*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CILineOverlay Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILineOverlay)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CILineOverlay/)
	@available(macOS 10.5, iOS 9, tvOS 9, *)
	@objc(CIFFLineOverlay) class LineOverlay: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CILineOverlay")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input for the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
			get {
				self.keyedValue("inputImage")
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
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.07`
		@objc public var nRNoiseLevel: Double {
			get {
				self.doubleValue(forKey: "inputNRNoiseLevel", defaultValue: Self.nRNoiseLevelDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: LineOverlay.nRNoiseLevelRange, forKey: "inputNRNoiseLevel")
			}
		}

		/// `nRNoiseLevel` default value
		@objc public static let nRNoiseLevelDefault: Double = 0.07

		/// `nRNoiseLevel` range definition
		public static let nRNoiseLevelRange = PartialRangeFrom<Double>(0.0)

		// MARK: - nRSharpness (inputNRSharpness)

		/// The amount of sharpening done when removing noise in the image before tracing the edges of the image. This improves the edge acquisition.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNRSharpness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.71`
		@objc public var nRSharpness: Double {
			get {
				self.doubleValue(forKey: "inputNRSharpness", defaultValue: Self.nRSharpnessDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: LineOverlay.nRSharpnessRange, forKey: "inputNRSharpness")
			}
		}

		/// `nRSharpness` default value
		@objc public static let nRSharpnessDefault: Double = 0.71

		/// `nRSharpness` range definition
		public static let nRSharpnessRange = PartialRangeFrom<Double>(0.0)

		// MARK: - edgeIntensity (inputEdgeIntensity)

		/// The accentuation factor of the Sobel gradient information when tracing the edges of the image. Higher values find more edges, although typically a low value (such as 1.0) is used.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputEdgeIntensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.0`
		@objc public var edgeIntensity: Double {
			get {
				self.doubleValue(forKey: "inputEdgeIntensity", defaultValue: Self.edgeIntensityDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: LineOverlay.edgeIntensityRange, forKey: "inputEdgeIntensity")
			}
		}

		/// `edgeIntensity` default value
		@objc public static let edgeIntensityDefault: Double = 1.0

		/// `edgeIntensity` range definition
		public static let edgeIntensityRange = PartialRangeFrom<Double>(0.0)

		// MARK: - threshold (inputThreshold)

		/// This value determines edge visibility. Larger values thin out the edges.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputThreshold`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.1`
		@objc public var threshold: Double {
			get {
				self.doubleValue(forKey: "inputThreshold", defaultValue: Self.thresholdDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: LineOverlay.thresholdRange, forKey: "inputThreshold")
			}
		}

		/// `threshold` default value
		@objc public static let thresholdDefault: Double = 0.1

		/// `threshold` range definition
		public static let thresholdRange = PartialRangeFrom<Double>(0.0)

		// MARK: - contrast (inputContrast)

		/// The amount of anti-aliasing to use on the edges produced by this filter. Higher values produce higher contrast edges (they are less anti-aliased).
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputContrast`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.25`
		/// - Default Value: `50.0`
		@objc public var contrast: Double {
			get {
				self.doubleValue(forKey: "inputContrast", defaultValue: Self.contrastDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: LineOverlay.contrastRange, forKey: "inputContrast")
			}
		}

		/// `contrast` default value
		@objc public static let contrastDefault: Double = 50.0

		/// `contrast` range definition
		public static let contrastRange = PartialRangeFrom<Double>(0.25)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - nRNoiseLevel: The noise level of the image (used with camera data) that gets removed before tracing the edges of the image. Increasing the noise level helps to clean up the traced edges of the image.
		///   - nRSharpness: The amount of sharpening done when removing noise in the image before tracing the edges of the image. This improves the edge acquisition.
		///   - edgeIntensity: The accentuation factor of the Sobel gradient information when tracing the edges of the image. Higher values find more edges, although typically a low value (such as 1.0) is used.
		///   - threshold: This value determines edge visibility. Larger values thin out the edges.
		///   - contrast: The amount of anti-aliasing to use on the edges produced by this filter. Higher values produce higher contrast edges (they are less anti-aliased).
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			nRNoiseLevel: Double = LineOverlay.nRNoiseLevelDefault,
			nRSharpness: Double = LineOverlay.nRSharpnessDefault,
			edgeIntensity: Double = LineOverlay.edgeIntensityDefault,
			threshold: Double = LineOverlay.thresholdDefault,
			contrast: Double = LineOverlay.contrastDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.nRNoiseLevel = nRNoiseLevel
			self.nRSharpness = nRSharpness
			self.edgeIntensity = edgeIntensity
			self.threshold = threshold
			self.contrast = contrast
		}
	}
}

@available(macOS 10.5, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Line Overlay' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - nRNoiseLevel: The noise level of the image (used with camera data) that gets removed before tracing the edges of the image. Increasing the noise level helps to clean up the traced edges of the image. (0.0...)
	///   - nRSharpness: The amount of sharpening done when removing noise in the image before tracing the edges of the image. This improves the edge acquisition. (0.0...)
	///   - edgeIntensity: The accentuation factor of the Sobel gradient information when tracing the edges of the image. Higher values find more edges, although typically a low value (such as 1.0) is used. (0.0...)
	///   - threshold: This value determines edge visibility. Larger values thin out the edges. (0.0...)
	///   - contrast: The amount of anti-aliasing to use on the edges produced by this filter. Higher values produce higher contrast edges (they are less anti-aliased). (0.25...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Creates a sketch that outlines the edges of an image in black, leaving the non-outlined portions of the image transparent. The result has alpha and is rendered in black, so it won’t look like much until you render it over another image using source over compositing.
	///
	/// **Categories**: BuiltIn, StillImage, Stylize, Video
	///
	/// **Documentation Links**
	/// - [CILineOverlay Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILineOverlay)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CILineOverlay/)
	@inlinable func applyingLineOverlay(
		nRNoiseLevel: Double = CIFF.LineOverlay.nRNoiseLevelDefault,
		nRSharpness: Double = CIFF.LineOverlay.nRSharpnessDefault,
		edgeIntensity: Double = CIFF.LineOverlay.edgeIntensityDefault,
		threshold: Double = CIFF.LineOverlay.thresholdDefault,
		contrast: Double = CIFF.LineOverlay.contrastDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.LineOverlay(
			inputImage: self,
			nRNoiseLevel: nRNoiseLevel,
			nRSharpness: nRSharpness,
			edgeIntensity: edgeIntensity,
			threshold: threshold,
			contrast: contrast
		)?.outputImage ?? CIImage.empty()
	}
}
