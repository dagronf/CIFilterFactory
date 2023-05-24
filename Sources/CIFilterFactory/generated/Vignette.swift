//
//  Vignette.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Vignette
	///
	/// Applies a vignette shading to the corners of an image.
	///
	/// **CIFilter Name**
	/// - CIVignette
	///
	/// **Availability**
	/// - macOS 10.9, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorEffect (*CICategoryColorEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIVignette Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignette)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIVignette/)
	@available(macOS 10.9, iOS 5, tvOS 5, *)
	@objc(CIFFVignette) class Vignette: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIVignette")
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

		/// The intensity of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputIntensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `-1.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.0`
		@objc public var intensity: Double {
			get {
				self.doubleValue(forKey: "inputIntensity", defaultValue: Self.intensityDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: Vignette.intensityRange, forKey: "inputIntensity")
			}
		}

		/// `intensity` default value
		@objc public static let intensityDefault: Double = 0.0

		/// `intensity` range definition
		public static let intensityRange: ClosedRange<Double> = -1.0 ... 1.0

		// MARK: - radius (inputRadius)

		/// The distance from the center of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `2.0`
		/// - Default Value: `1.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: Vignette.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 1.0

		/// `radius` range definition
		public static let radiusRange: ClosedRange<Double> = 0.0 ... 2.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - intensity: The intensity of the effect.
		///   - radius: The distance from the center of the effect.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			intensity: Double = Vignette.intensityDefault,
			radius: Double = Vignette.radiusDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.intensity = intensity
			self.radius = radius
		}
	}
}

@available(macOS 10.9, iOS 5, tvOS 5, *)
public extension CIImage {
	/// Apply the 'Vignette' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - intensity: The intensity of the effect. (-1.0...1.0)
	///   - radius: The distance from the center of the effect. (0.0...2.0)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Applies a vignette shading to the corners of an image.
	///
	/// **Categories**: BuiltIn, ColorEffect, HighDynamicRange, Interlaced, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIVignette Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignette)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIVignette/)
	@inlinable func applyingVignette(
		intensity: Double = CIFF.Vignette.intensityDefault,
		radius: Double = CIFF.Vignette.radiusDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.Vignette(
			inputImage: self,
			intensity: intensity,
			radius: radius
		)?.outputImage ?? CIImage.empty()
	}
}
