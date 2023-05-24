//
//  CMYKHalftone.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// CMYK Halftone
	///
	/// Creates a color, halftoned rendition of the source image, using cyan, magenta, yellow, and black inks over a white page.
	///
	/// **CIFilter Name**
	/// - CICMYKHalftone
	///
	/// **Availability**
	/// - macOS 10.4, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HalftoneEffect (*CICategoryHalftoneEffect*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CICMYKHalftone Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICMYKHalftone)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICMYKHalftone/)
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFCMYKHalftone) class CMYKHalftone: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CICMYKHalftone")
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

		// MARK: - center (inputCenter)

		/// The center of the effect as x and y pixel coordinates.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var center: CGPoint {
			get {
				self.cgPointValue(forKey: "inputCenter", defaultValue: Self.centerDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// `center` default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - width (inputWidth)

		/// The distance between dots in the pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `-2.0`
		/// - Default Value: `6.0`
		@objc public var width: Double {
			get {
				self.doubleValue(forKey: "inputWidth", defaultValue: Self.widthDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: CMYKHalftone.widthRange, forKey: "inputWidth")
			}
		}

		/// `width` default value
		@objc public static let widthDefault: Double = 6.0

		/// `width` range definition
		public static let widthRange = PartialRangeFrom<Double>(-2.0)

		// MARK: - angle (inputAngle)

		/// The angle in radians of the pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAngle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `0.0`
		@objc public var angle: Double {
			get {
				self.doubleValue(forKey: "inputAngle", defaultValue: Self.angleDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputAngle")
			}
		}

		/// `angle` default value
		@objc public static let angleDefault: Double = 0.0

		// MARK: - sharpness (inputSharpness)

		/// The sharpness of the pattern. The larger the value, the sharper the pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSharpness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.7`
		@objc public var sharpness: Double {
			get {
				self.doubleValue(forKey: "inputSharpness", defaultValue: Self.sharpnessDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: CMYKHalftone.sharpnessRange, forKey: "inputSharpness")
			}
		}

		/// `sharpness` default value
		@objc public static let sharpnessDefault: Double = 0.7

		/// `sharpness` range definition
		public static let sharpnessRange = PartialRangeFrom<Double>(0.0)

		// MARK: - gCR (inputGCR)

		/// The gray component replacement value. The value can vary from 0.0 (none) to 1.0.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGCR`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.0`
		@objc public var gCR: Double {
			get {
				self.doubleValue(forKey: "inputGCR", defaultValue: Self.gCRDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: CMYKHalftone.gCRRange, forKey: "inputGCR")
			}
		}

		/// `gCR` default value
		@objc public static let gCRDefault: Double = 1.0

		/// `gCR` range definition
		public static let gCRRange = PartialRangeFrom<Double>(0.0)

		// MARK: - uCR (inputUCR)

		/// The under color removal value. The value can vary from 0.0 to 1.0.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputUCR`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.5`
		@objc public var uCR: Double {
			get {
				self.doubleValue(forKey: "inputUCR", defaultValue: Self.uCRDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: CMYKHalftone.uCRRange, forKey: "inputUCR")
			}
		}

		/// `uCR` default value
		@objc public static let uCRDefault: Double = 0.5

		/// `uCR` range definition
		public static let uCRRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - width: The distance between dots in the pattern.
		///   - angle: The angle in radians of the pattern.
		///   - sharpness: The sharpness of the pattern. The larger the value, the sharper the pattern.
		///   - gCR: The gray component replacement value. The value can vary from 0.0 (none) to 1.0.
		///   - uCR: The under color removal value. The value can vary from 0.0 to 1.0.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			center: CGPoint = CMYKHalftone.centerDefault,
			width: Double = CMYKHalftone.widthDefault,
			angle: Double = CMYKHalftone.angleDefault,
			sharpness: Double = CMYKHalftone.sharpnessDefault,
			gCR: Double = CMYKHalftone.gCRDefault,
			uCR: Double = CMYKHalftone.uCRDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.center = center
			self.width = width
			self.angle = angle
			self.sharpness = sharpness
			self.gCR = gCR
			self.uCR = uCR
		}
	}
}

@available(macOS 10.4, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'CMYK Halftone' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - width: The distance between dots in the pattern. (-2.0...)
	///   - angle: The angle in radians of the pattern.
	///   - sharpness: The sharpness of the pattern. The larger the value, the sharper the pattern. (0.0...)
	///   - gCR: The gray component replacement value. The value can vary from 0.0 (none) to 1.0. (0.0...)
	///   - uCR: The under color removal value. The value can vary from 0.0 to 1.0.  (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Creates a color, halftoned rendition of the source image, using cyan, magenta, yellow, and black inks over a white page.
	///
	/// **Categories**: BuiltIn, HalftoneEffect, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CICMYKHalftone Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICMYKHalftone)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICMYKHalftone/)
	@inlinable func applyingCMYKHalftone(
		center: CGPoint = CIFF.CMYKHalftone.centerDefault,
		width: Double = CIFF.CMYKHalftone.widthDefault,
		angle: Double = CIFF.CMYKHalftone.angleDefault,
		sharpness: Double = CIFF.CMYKHalftone.sharpnessDefault,
		gCR: Double = CIFF.CMYKHalftone.gCRDefault,
		uCR: Double = CIFF.CMYKHalftone.uCRDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.CMYKHalftone(
			inputImage: self,
			center: center,
			width: width,
			angle: angle,
			sharpness: sharpness,
			gCR: gCR,
			uCR: uCR
		)?.outputImage ?? CIImage.empty()
	}
}
