//
//  EdgePreserveUpsampleFilter.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.12, iOS 10, tvOS 10, *)
@objc public extension CIFF {
	///
	/// Edge Preserve Upsample Filter
	///
	/// Upsamples a small image to the size of the input image using the luminance of the input image as a guide to preserve detail.
	///
	/// **Availability**
	/// - macOS 10.12, iOS 10, tvOS 10
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryGeometryAdjustment
	/// - CICategoryInterlaced
	/// - CICategoryNonSquarePixels
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Links**
	/// - [CIEdgePreserveUpsampleFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdgePreserveUpsampleFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciedgepreserveupsamplefilter?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIEdgePreserveUpsampleFilter/)
	///
	@available(macOS 10.12, iOS 10, tvOS 10, *)
	@objc(CIFFEdgePreserveUpsampleFilter) class EdgePreserveUpsampleFilter: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIEdgePreserveUpsampleFilter")
		}

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

		// MARK: - smallImage (inputSmallImage)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSmallImage`
		/// - Internal class: `CIImage`
		@objc public var smallImage: CIImage? {
			get {
				return self.keyedValue("inputSmallImage")
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
				let number = self.filter.value(forKey: "inputSpatialSigma") as? NSNumber
				return number?.doubleValue ?? Self.spatialSigmaDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: EdgePreserveUpsampleFilter.spatialSigmaRange)
				self.filter.setValue(number, forKey: "inputSpatialSigma")
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
				let number = self.filter.value(forKey: "inputLumaSigma") as? NSNumber
				return number?.doubleValue ?? Self.lumaSigmaDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: EdgePreserveUpsampleFilter.lumaSigmaRange)
				self.filter.setValue(number, forKey: "inputLumaSigma")
			}
		}

		/// `lumaSigma` default value
		@objc public static let lumaSigmaDefault: Double = 0.15

		/// `lumaSigma` range definition
		public static let lumaSigmaRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			smallImage: CIImage,
			spatialSigma: Double = EdgePreserveUpsampleFilter.spatialSigmaDefault,
			lumaSigma: Double = EdgePreserveUpsampleFilter.lumaSigmaDefault
		) {
			self.init()
			self.image = image
			self.smallImage = smallImage
			self.spatialSigma = spatialSigma
			self.lumaSigma = lumaSigma
		}
	}
}
