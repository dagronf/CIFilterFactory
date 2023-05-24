//
//  ColorThreshold.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Threshold
	///
	/// Produces a binarized image from an image and a threshold value. The red, green and blue channels of the resulting image will be one if its value is greater than the threshold and zero otherwise.
	///
	/// **CIFilter Name**
	/// - CIColorThreshold
	///
	/// **Availability**
	/// - macOS 11.0, iOS 14, tvOS 14
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorAdjustment (*CICategoryColorAdjustment*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIColorThreshold Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorThreshold)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorThreshold/)
	@available(macOS 11.0, iOS 14, tvOS 14, *)
	@objc(CIFFColorThreshold) class ColorThreshold: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIColorThreshold")
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

		// MARK: - threshold (inputThreshold)

		/// The threshold value that governs if the RGB channels of the resulting image will be zero or one.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputThreshold`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `0.5`
		@objc public var threshold: Double {
			get {
				self.doubleValue(forKey: "inputThreshold", defaultValue: Self.thresholdDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputThreshold")
			}
		}

		/// `threshold` default value
		@objc public static let thresholdDefault: Double = 0.5

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - threshold: The threshold value that governs if the RGB channels of the resulting image will be zero or one.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			threshold: Double = ColorThreshold.thresholdDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.threshold = threshold
		}
	}
}

@available(macOS 11.0, iOS 14, tvOS 14, *)
public extension CIImage {
	/// Apply the 'Color Threshold' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - threshold: The threshold value that governs if the RGB channels of the resulting image will be zero or one.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Produces a binarized image from an image and a threshold value. The red, green and blue channels of the resulting image will be one if its value is greater than the threshold and zero otherwise.
	///
	/// **Categories**: BuiltIn, ColorAdjustment, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIColorThreshold Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorThreshold)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorThreshold/)
	@inlinable func applyingColorThreshold(
		threshold: Double = CIFF.ColorThreshold.thresholdDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ColorThreshold(
			inputImage: self,
			threshold: threshold
		)?.outputImage ?? CIImage.empty()
	}
}
