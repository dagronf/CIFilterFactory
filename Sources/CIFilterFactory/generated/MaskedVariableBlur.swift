//
//  MaskedVariableBlur.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Masked Variable Blur
	///
	/// Blurs an image according to the brightness levels in a mask image.
	///
	/// **CIFilter Name**
	/// - CIMaskedVariableBlur
	///
	/// **Availability**
	/// - macOS 10.10, iOS 8, tvOS 8
	///
	/// **Categories**
	/// - Blur (*CICategoryBlur*)
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIMaskedVariableBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaskedVariableBlur)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIMaskedVariableBlur/)
	@available(macOS 10.10, iOS 8, tvOS 8, *)
	@objc(CIFFMaskedVariableBlur) class MaskedVariableBlur: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIMaskedVariableBlur")
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

		// MARK: - mask (inputMask)

		/// The mask image that determines how much to blur the image. The mask’s green channel value from 0.0 to 1.0 determines if the image is not blurred or blurred by the full radius.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMask`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var mask: CIImage? {
			get {
				self.keyedValue("inputMask")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMask")
			}
		}

		// MARK: - radius (inputRadius)

		/// A value that governs the maximum blur radius to apply.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `5.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: MaskedVariableBlur.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 5.0

		/// `radius` range definition
		public static let radiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - mask: The mask image that determines how much to blur the image. The mask’s green channel value from 0.0 to 1.0 determines if the image is not blurred or blurred by the full radius.
		///   - radius: A value that governs the maximum blur radius to apply.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			mask: CIImage? = nil,
			radius: Double = MaskedVariableBlur.radiusDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let mask = mask {
				self.mask = mask
			}
			self.radius = radius
		}
	}
}

@available(macOS 10.10, iOS 8, tvOS 8, *)
public extension CIImage {
	/// Apply the 'Masked Variable Blur' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - mask: The mask image that determines how much to blur the image. The mask’s green channel value from 0.0 to 1.0 determines if the image is not blurred or blurred by the full radius.
	///   - radius: A value that governs the maximum blur radius to apply. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Blurs an image according to the brightness levels in a mask image.
	///
	/// **Categories**: Blur, BuiltIn, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIMaskedVariableBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaskedVariableBlur)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIMaskedVariableBlur/)
	@inlinable func applyingMaskedVariableBlur(
		mask: CIImage,
		radius: Double = CIFF.MaskedVariableBlur.radiusDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.MaskedVariableBlur(
			inputImage: self,
			mask: mask,
			radius: radius
		)?.outputImage ?? CIImage.empty()
	}
}
