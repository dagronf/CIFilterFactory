//
//  Edges.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Edges
	///
	/// Finds all edges in an image and displays them in color.
	///
	/// **CIFilter Name**
	/// - CIEdges
	///
	/// **Availability**
	/// - macOS 10.4, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Stylize (*CICategoryStylize*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIEdges Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdges)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIEdges/)
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFEdges) class Edges: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIEdges")
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

		// MARK: - intensity (inputIntensity)

		/// The intensity of the edges. The larger the value, the higher the intensity.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputIntensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.0`
		@objc public var intensity: Double {
			get {
				self.doubleValue(forKey: "inputIntensity", defaultValue: Self.intensityDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: Edges.intensityRange, forKey: "inputIntensity")
			}
		}

		/// `intensity` default value
		@objc public static let intensityDefault: Double = 1.0

		/// `intensity` range definition
		public static let intensityRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - intensity: The intensity of the edges. The larger the value, the higher the intensity.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			intensity: Double = Edges.intensityDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.intensity = intensity
		}
	}
}

@available(macOS 10.4, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Edges' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - intensity: The intensity of the edges. The larger the value, the higher the intensity. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Finds all edges in an image and displays them in color.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Stylize, Video
	///
	/// **Documentation Links**
	/// - [CIEdges Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdges)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIEdges/)
	@inlinable func applyingEdges(
		intensity: Double = CIFF.Edges.intensityDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.Edges(
			inputImage: self,
			intensity: intensity
		)?.outputImage ?? CIImage.empty()
	}
}
