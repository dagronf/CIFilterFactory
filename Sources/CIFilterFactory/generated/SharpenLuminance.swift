//
//  SharpenLuminance.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Sharpen Luminance
	///
	/// Increases image detail by sharpening. It operates on the luminance of the image; the chrominance of the pixels remains unaffected.
	///
	/// **CIFilter Name**
	/// - CISharpenLuminance
	///
	/// **Availability**
	/// - macOS 10.4, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Sharpen (*CICategorySharpen*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CISharpenLuminance Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISharpenLuminance)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISharpenLuminance/)
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFSharpenLuminance) class SharpenLuminance: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CISharpenLuminance")
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

		// MARK: - sharpness (inputSharpness)

		/// The amount of sharpening to apply. Larger values are sharper.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSharpness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `0.4`
		@objc public var sharpness: Double {
			get {
				self.doubleValue(forKey: "inputSharpness", defaultValue: Self.sharpnessDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputSharpness")
			}
		}

		/// `sharpness` default value
		@objc public static let sharpnessDefault: Double = 0.4

		// MARK: - radius (inputRadius)

		/// The distance from the center of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `1.69`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 1.69

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - sharpness: The amount of sharpening to apply. Larger values are sharper.
		///   - radius: The distance from the center of the effect.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			sharpness: Double = SharpenLuminance.sharpnessDefault,
			radius: Double = SharpenLuminance.radiusDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.sharpness = sharpness
			self.radius = radius
		}
	}
}

@available(macOS 10.4, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Sharpen Luminance' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - sharpness: The amount of sharpening to apply. Larger values are sharper.
	///   - radius: The distance from the center of the effect.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Increases image detail by sharpening. It operates on the luminance of the image; the chrominance of the pixels remains unaffected.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, Sharpen, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CISharpenLuminance Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISharpenLuminance)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISharpenLuminance/)
	@inlinable func applyingSharpenLuminance(
		sharpness: Double = CIFF.SharpenLuminance.sharpnessDefault,
		radius: Double = CIFF.SharpenLuminance.radiusDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.SharpenLuminance(
			inputImage: self,
			sharpness: sharpness,
			radius: radius
		)?.outputImage ?? CIImage.empty()
	}
}
