//
//  NoiseReduction.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, tvOS 9, *)
@objc public extension CIFF {
	///
	/// Noise Reduction
	///
	/// Reduces noise using a threshold value to define what is considered noise. Small changes in luminance below that value are considered noise and get a noise reduction treatment, which is a local blur. Changes above the threshold value are considered edges, so they are sharpened.
	///
	/// **Links**
	///
	/// - [CINoiseReduction Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINoiseReduction)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cinoisereduction?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CINoiseReduction/)
	///
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFNoiseReduction) class NoiseReduction: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CINoiseReduction")
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

		// MARK: - noiseLevel (inputNoiseLevel)

		/// The amount of noise reduction. The larger the value, the more noise reduction.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNoiseLevel`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.02`
		/// - Minimum value: `0.0`
		@objc public var noiseLevel: Double {
			get {
				let number = self.filter.value(forKey: "inputNoiseLevel") as? NSNumber
				return number?.doubleValue ?? 0.02
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: NoiseReduction.noiseLevelRange)
				self.filter.setValue(number, forKey: "inputNoiseLevel")
			}
		}

		/// `noiseLevel` range definition
		public static let noiseLevelRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - sharpness (inputSharpness)

		/// The sharpness of the final image. The larger the value, the sharper the result.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSharpness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.4`
		/// - Minimum value: `0.0`
		@objc public var sharpness: Double {
			get {
				let number = self.filter.value(forKey: "inputSharpness") as? NSNumber
				return number?.doubleValue ?? 0.4
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: NoiseReduction.sharpnessRange)
				self.filter.setValue(number, forKey: "inputSharpness")
			}
		}

		/// `sharpness` range definition
		public static let sharpnessRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			noiseLevel: Double = 0.02,
			sharpness: Double = 0.4
		) {
			self.init()

			self.image = image
			self.noiseLevel = noiseLevel
			self.sharpness = sharpness
		}
	}
}
