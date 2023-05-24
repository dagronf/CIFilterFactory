//
//  KeystoneCorrectionVertical.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Vertical Keystone Correction
	///
	/// Apply vertical keystone correction to an image with guides.
	///
	/// **CIFilter Name**
	/// - CIKeystoneCorrectionVertical
	///
	/// **Availability**
	/// - macOS 10.15, iOS 13, tvOS 13
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - GeometryAdjustment (*CICategoryGeometryAdjustment*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIKeystoneCorrectionVertical Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKeystoneCorrectionVertical)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIKeystoneCorrectionVertical/)
	/// **Additional output keys**
	/// - outputTransform
	/// - outputRotationFilter
	///
	@available(macOS 10.15, iOS 13, tvOS 13, *)
	@objc(CIFFKeystoneCorrectionVertical) class KeystoneCorrectionVertical: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIKeystoneCorrectionVertical")
		}

		// MARK: - inputImage (inputImage)

		/// The image to process.
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

		// MARK: - focalLength (inputFocalLength)

		/// 35mm equivalent focal length of the input image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFocalLength`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `28.0`
		@objc public var focalLength: Double {
			get {
				self.doubleValue(forKey: "inputFocalLength", defaultValue: Self.focalLengthDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputFocalLength")
			}
		}

		/// `focalLength` default value
		@objc public static let focalLengthDefault: Double = 28.0

		// MARK: - topLeft (inputTopLeft)

		/// The top left coordinate of the guide.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTopLeft`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		@objc public var topLeft: CGPoint {
			get {
				self.cgPointValue(forKey: "inputTopLeft", defaultValue: Self.topLeftDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTopLeft")
			}
		}

		/// `topLeft` default value
		@objc public static let topLeftDefault = CGPoint(x: 0.0, y: 0.0)

		// MARK: - topRight (inputTopRight)

		/// The top right coordinate of the guide.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTopRight`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		@objc public var topRight: CGPoint {
			get {
				self.cgPointValue(forKey: "inputTopRight", defaultValue: Self.topRightDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTopRight")
			}
		}

		/// `topRight` default value
		@objc public static let topRightDefault = CGPoint(x: 0.0, y: 0.0)

		// MARK: - bottomRight (inputBottomRight)

		/// The bottom right coordinate of the guide.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBottomRight`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		@objc public var bottomRight: CGPoint {
			get {
				self.cgPointValue(forKey: "inputBottomRight", defaultValue: Self.bottomRightDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBottomRight")
			}
		}

		/// `bottomRight` default value
		@objc public static let bottomRightDefault = CGPoint(x: 0.0, y: 0.0)

		// MARK: - bottomLeft (inputBottomLeft)

		/// The bottom left coordinate of the guide.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBottomLeft`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		@objc public var bottomLeft: CGPoint {
			get {
				self.cgPointValue(forKey: "inputBottomLeft", defaultValue: Self.bottomLeftDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBottomLeft")
			}
		}

		/// `bottomLeft` default value
		@objc public static let bottomLeftDefault = CGPoint(x: 0.0, y: 0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to process.
		///   - focalLength: 35mm equivalent focal length of the input image.
		///   - topLeft: The top left coordinate of the guide.
		///   - topRight: The top right coordinate of the guide.
		///   - bottomRight: The bottom right coordinate of the guide.
		///   - bottomLeft: The bottom left coordinate of the guide.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			focalLength: Double = KeystoneCorrectionVertical.focalLengthDefault,
			topLeft: CGPoint,
			topRight: CGPoint,
			bottomRight: CGPoint,
			bottomLeft: CGPoint
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.focalLength = focalLength
			self.topLeft = topLeft
			self.topRight = topRight
			self.bottomRight = bottomRight
			self.bottomLeft = bottomLeft
		}
	}
}

@available(macOS 10.15, iOS 13, tvOS 13, *)
public extension CIImage {
	/// Apply the 'Vertical Keystone Correction' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - focalLength: 35mm equivalent focal length of the input image.
	///   - topLeft: The top left coordinate of the guide.
	///   - topRight: The top right coordinate of the guide.
	///   - bottomRight: The bottom right coordinate of the guide.
	///   - bottomLeft: The bottom left coordinate of the guide.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Apply vertical keystone correction to an image with guides.
	///
	/// **Categories**: BuiltIn, GeometryAdjustment, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIKeystoneCorrectionVertical Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKeystoneCorrectionVertical)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIKeystoneCorrectionVertical/)
	@inlinable func applyingKeystoneCorrectionVertical(
		focalLength: Double = CIFF.KeystoneCorrectionVertical.focalLengthDefault,
		topLeft: CGPoint,
		topRight: CGPoint,
		bottomRight: CGPoint,
		bottomLeft: CGPoint,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.KeystoneCorrectionVertical(
			inputImage: self,
			focalLength: focalLength,
			topLeft: topLeft,
			topRight: topRight,
			bottomRight: bottomRight,
			bottomLeft: bottomLeft
		)?.outputImage ?? CIImage.empty()
	}
}
