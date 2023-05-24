//
//  EdgePreserveUpsampleFilter.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Edge Preserve Upsample Filter
	///
	/// Upsamples a small image to the size of the input image using the luminance of the input image as a guide to preserve detail.
	///
	/// **CIFilter Name**
	/// - CIEdgePreserveUpsampleFilter
	///
	/// **Availability**
	/// - macOS 10.12, iOS 10, tvOS 10
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - GeometryAdjustment (*CICategoryGeometryAdjustment*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIEdgePreserveUpsampleFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdgePreserveUpsampleFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIEdgePreserveUpsampleFilter/)
	@available(macOS 10.12, iOS 10, tvOS 10, *)
	@objc(CIFFEdgePreserveUpsampleFilter) class EdgePreserveUpsampleFilter: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIEdgePreserveUpsampleFilter")
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

		// MARK: - smallImage (inputSmallImage)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSmallImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var smallImage: CIImage? {
			get {
				self.keyedValue("inputSmallImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputSmallImage")
			}
		}

		// MARK: - spatialSigma (inputSpatialSigma)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSpatialSigma`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `5.0`
		/// - Default Value: `3.0`
		@objc public var spatialSigma: Double {
			get {
				self.doubleValue(forKey: "inputSpatialSigma", defaultValue: Self.spatialSigmaDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: EdgePreserveUpsampleFilter.spatialSigmaRange, forKey: "inputSpatialSigma")
			}
		}

		/// `spatialSigma` default value
		@objc public static let spatialSigmaDefault: Double = 3.0

		/// `spatialSigma` range definition
		public static let spatialSigmaRange: ClosedRange<Double> = 0.0 ... 5.0

		// MARK: - lumaSigma (inputLumaSigma)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLumaSigma`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.15`
		@objc public var lumaSigma: Double {
			get {
				self.doubleValue(forKey: "inputLumaSigma", defaultValue: Self.lumaSigmaDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: EdgePreserveUpsampleFilter.lumaSigmaRange, forKey: "inputLumaSigma")
			}
		}

		/// `lumaSigma` default value
		@objc public static let lumaSigmaDefault: Double = 0.15

		/// `lumaSigma` range definition
		public static let lumaSigmaRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - smallImage: No Description
		///   - spatialSigma: No Description
		///   - lumaSigma: No Description
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			smallImage: CIImage? = nil,
			spatialSigma: Double = EdgePreserveUpsampleFilter.spatialSigmaDefault,
			lumaSigma: Double = EdgePreserveUpsampleFilter.lumaSigmaDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let smallImage = smallImage {
				self.smallImage = smallImage
			}
			self.spatialSigma = spatialSigma
			self.lumaSigma = lumaSigma
		}
	}
}

@available(macOS 10.12, iOS 10, tvOS 10, *)
public extension CIImage {
	/// Apply the 'Edge Preserve Upsample Filter' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - smallImage: No Description
	///   - spatialSigma: No Description (0.0...5.0)
	///   - lumaSigma: No Description (0.0...1.0)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Upsamples a small image to the size of the input image using the luminance of the input image as a guide to preserve detail.
	///
	/// **Categories**: BuiltIn, GeometryAdjustment, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIEdgePreserveUpsampleFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdgePreserveUpsampleFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIEdgePreserveUpsampleFilter/)
	@inlinable func applyingEdgePreserveUpsampleFilter(
		smallImage: CIImage,
		spatialSigma: Double = CIFF.EdgePreserveUpsampleFilter.spatialSigmaDefault,
		lumaSigma: Double = CIFF.EdgePreserveUpsampleFilter.lumaSigmaDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.EdgePreserveUpsampleFilter(
			inputImage: self,
			smallImage: smallImage,
			spatialSigma: spatialSigma,
			lumaSigma: lumaSigma
		)?.outputImage ?? CIImage.empty()
	}
}
