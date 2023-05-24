//
//  GammaAdjust.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Gamma Adjust
	///
	/// Adjusts midtone brightness. This filter is typically used to compensate for nonlinear effects of displays. Adjusting the gamma effectively changes the slope of the transition between black and white.
	///
	/// **CIFilter Name**
	/// - CIGammaAdjust
	///
	/// **Availability**
	/// - macOS 10.4, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorAdjustment (*CICategoryColorAdjustment*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIGammaAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGammaAdjust)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGammaAdjust/)
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFGammaAdjust) class GammaAdjust: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIGammaAdjust")
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

		// MARK: - power (inputPower)

		/// A gamma value to use to correct image brightness. The larger the value, the darker the result.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPower`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `1.0`
		@objc public var power: Double {
			get {
				self.doubleValue(forKey: "inputPower", defaultValue: Self.powerDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputPower")
			}
		}

		/// `power` default value
		@objc public static let powerDefault: Double = 1.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - power: A gamma value to use to correct image brightness. The larger the value, the darker the result.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			power: Double = GammaAdjust.powerDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.power = power
		}
	}
}

@available(macOS 10.4, iOS 5, tvOS 5, *)
public extension CIImage {
	/// Apply the 'Gamma Adjust' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - power: A gamma value to use to correct image brightness. The larger the value, the darker the result.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Adjusts midtone brightness. This filter is typically used to compensate for nonlinear effects of displays. Adjusting the gamma effectively changes the slope of the transition between black and white.
	///
	/// **Categories**: BuiltIn, ColorAdjustment, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIGammaAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGammaAdjust)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGammaAdjust/)
	@inlinable func applyingGammaAdjust(
		power: Double = CIFF.GammaAdjust.powerDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.GammaAdjust(
			inputImage: self,
			power: power
		)?.outputImage ?? CIImage.empty()
	}
}
