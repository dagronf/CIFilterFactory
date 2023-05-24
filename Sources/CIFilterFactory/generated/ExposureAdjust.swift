//
//  ExposureAdjust.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Exposure Adjust
	///
	/// Adjusts the exposure setting for an image similar to the way you control exposure for a camera when you change the F-stop.
	///
	/// **CIFilter Name**
	/// - CIExposureAdjust
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
	/// - XMPSerializable (*CICategoryXMPSerializable*)
	///
	/// **Documentation Links**
	/// - [CIExposureAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExposureAdjust)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIExposureAdjust/)
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFExposureAdjust) class ExposureAdjust: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIExposureAdjust")
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

		// MARK: - eV (inputEV)

		/// The amount to adjust the exposure of the image by. The larger the value, the brighter the exposure.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputEV`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `0.0`
		@objc public var eV: Double {
			get {
				self.doubleValue(forKey: "inputEV", defaultValue: Self.eVDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputEV")
			}
		}

		/// `eV` default value
		@objc public static let eVDefault: Double = 0.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - eV: The amount to adjust the exposure of the image by. The larger the value, the brighter the exposure.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			eV: Double = ExposureAdjust.eVDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.eV = eV
		}
	}
}

@available(macOS 10.4, iOS 5, tvOS 5, *)
public extension CIImage {
	/// Apply the 'Exposure Adjust' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - eV: The amount to adjust the exposure of the image by. The larger the value, the brighter the exposure.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Adjusts the exposure setting for an image similar to the way you control exposure for a camera when you change the F-stop.
	///
	/// **Categories**: BuiltIn, ColorAdjustment, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video, XMPSerializable
	///
	/// **Documentation Links**
	/// - [CIExposureAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExposureAdjust)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIExposureAdjust/)
	@inlinable func applyingExposureAdjust(
		eV: Double = CIFF.ExposureAdjust.eVDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ExposureAdjust(
			inputImage: self,
			eV: eV
		)?.outputImage ?? CIImage.empty()
	}
}
