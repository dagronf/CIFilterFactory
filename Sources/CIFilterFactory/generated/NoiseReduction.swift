//
//  NoiseReduction.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Noise Reduction
	///
	/// Reduces noise using a threshold value to define what is considered noise. Small changes in luminance below that value are considered noise and get a noise reduction treatment, which is a local blur. Changes above the threshold value are considered edges, so they are sharpened.
	///
	/// **CIFilter Name**
	/// - CINoiseReduction
	///
	/// **Availability**
	/// - macOS 10.4, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - Blur (*CICategoryBlur*)
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CINoiseReduction Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINoiseReduction)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CINoiseReduction/)
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFNoiseReduction) class NoiseReduction: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CINoiseReduction")
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

		// MARK: - noiseLevel (inputNoiseLevel)

		/// The amount of noise reduction. The larger the value, the more noise reduction.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNoiseLevel`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.02`
		@objc public var noiseLevel: Double {
			get {
				self.doubleValue(forKey: "inputNoiseLevel", defaultValue: Self.noiseLevelDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: NoiseReduction.noiseLevelRange, forKey: "inputNoiseLevel")
			}
		}

		/// `noiseLevel` default value
		@objc public static let noiseLevelDefault: Double = 0.02

		/// `noiseLevel` range definition
		public static let noiseLevelRange = PartialRangeFrom<Double>(0.0)

		// MARK: - sharpness (inputSharpness)

		/// The sharpness of the final image. The larger the value, the sharper the result.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSharpness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.4`
		@objc public var sharpness: Double {
			get {
				self.doubleValue(forKey: "inputSharpness", defaultValue: Self.sharpnessDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: NoiseReduction.sharpnessRange, forKey: "inputSharpness")
			}
		}

		/// `sharpness` default value
		@objc public static let sharpnessDefault: Double = 0.4

		/// `sharpness` range definition
		public static let sharpnessRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - noiseLevel: The amount of noise reduction. The larger the value, the more noise reduction.
		///   - sharpness: The sharpness of the final image. The larger the value, the sharper the result.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			noiseLevel: Double = NoiseReduction.noiseLevelDefault,
			sharpness: Double = NoiseReduction.sharpnessDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.noiseLevel = noiseLevel
			self.sharpness = sharpness
		}
	}
}

@available(macOS 10.4, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Noise Reduction' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - noiseLevel: The amount of noise reduction. The larger the value, the more noise reduction. (0.0...)
	///   - sharpness: The sharpness of the final image. The larger the value, the sharper the result. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Reduces noise using a threshold value to define what is considered noise. Small changes in luminance below that value are considered noise and get a noise reduction treatment, which is a local blur. Changes above the threshold value are considered edges, so they are sharpened.
	///
	/// **Categories**: Blur, BuiltIn, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CINoiseReduction Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINoiseReduction)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CINoiseReduction/)
	@inlinable func applyingNoiseReduction(
		noiseLevel: Double = CIFF.NoiseReduction.noiseLevelDefault,
		sharpness: Double = CIFF.NoiseReduction.sharpnessDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.NoiseReduction(
			inputImage: self,
			noiseLevel: noiseLevel,
			sharpness: sharpness
		)?.outputImage ?? CIImage.empty()
	}
}
