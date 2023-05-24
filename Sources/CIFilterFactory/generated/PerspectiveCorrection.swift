//
//  PerspectiveCorrection.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Perspective Correction
	///
	/// Apply a perspective correction to an image.
	///
	/// **CIFilter Name**
	/// - CIPerspectiveCorrection
	///
	/// **Availability**
	/// - macOS 10.10, iOS 8, tvOS 8
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - GeometryAdjustment (*CICategoryGeometryAdjustment*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIPerspectiveCorrection Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveCorrection)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPerspectiveCorrection/)
	@available(macOS 10.10, iOS 8, tvOS 8, *)
	@objc(CIFFPerspectiveCorrection) class PerspectiveCorrection: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIPerspectiveCorrection")
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

		// MARK: - topLeft (inputTopLeft)

		/// The top left coordinate to be perspective corrected.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTopLeft`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 118.0, y: 118.0)`
		@objc public var topLeft: CGPoint {
			get {
				self.cgPointValue(forKey: "inputTopLeft", defaultValue: Self.topLeftDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTopLeft")
			}
		}

		/// `topLeft` default value
		@objc public static let topLeftDefault = CGPoint(x: 118.0, y: 484.0)

		// MARK: - topRight (inputTopRight)

		/// The top right coordinate to be perspective corrected.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTopRight`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 646.0, y: 646.0)`
		@objc public var topRight: CGPoint {
			get {
				self.cgPointValue(forKey: "inputTopRight", defaultValue: Self.topRightDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTopRight")
			}
		}

		/// `topRight` default value
		@objc public static let topRightDefault = CGPoint(x: 646.0, y: 507.0)

		// MARK: - bottomRight (inputBottomRight)

		/// The bottom right coordinate to be perspective corrected.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBottomRight`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 548.0, y: 548.0)`
		@objc public var bottomRight: CGPoint {
			get {
				self.cgPointValue(forKey: "inputBottomRight", defaultValue: Self.bottomRightDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBottomRight")
			}
		}

		/// `bottomRight` default value
		@objc public static let bottomRightDefault = CGPoint(x: 548.0, y: 140.0)

		// MARK: - bottomLeft (inputBottomLeft)

		/// The bottom left coordinate to be perspective corrected.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBottomLeft`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 155.0, y: 155.0)`
		@objc public var bottomLeft: CGPoint {
			get {
				self.cgPointValue(forKey: "inputBottomLeft", defaultValue: Self.bottomLeftDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBottomLeft")
			}
		}

		/// `bottomLeft` default value
		@objc public static let bottomLeftDefault = CGPoint(x: 155.0, y: 153.0)

		// MARK: - crop (inputCrop)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCrop`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var crop: Bool {
			get {
				self.boolValue(forKey: "inputCrop", defaultValue: Self.cropDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputCrop")
			}
		}

		/// `crop` default value
		@objc public static let cropDefault: Bool = false

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - topLeft: The top left coordinate to be perspective corrected.
		///   - topRight: The top right coordinate to be perspective corrected.
		///   - bottomRight: The bottom right coordinate to be perspective corrected.
		///   - bottomLeft: The bottom left coordinate to be perspective corrected.
		///   - crop: No Description
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			topLeft: CGPoint = PerspectiveCorrection.topLeftDefault,
			topRight: CGPoint = PerspectiveCorrection.topRightDefault,
			bottomRight: CGPoint = PerspectiveCorrection.bottomRightDefault,
			bottomLeft: CGPoint = PerspectiveCorrection.bottomLeftDefault,
			crop: Bool = PerspectiveCorrection.cropDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.topLeft = topLeft
			self.topRight = topRight
			self.bottomRight = bottomRight
			self.bottomLeft = bottomLeft
			self.crop = crop
		}
	}
}

@available(macOS 10.10, iOS 8, tvOS 8, *)
public extension CIImage {
	/// Apply the 'Perspective Correction' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - topLeft: The top left coordinate to be perspective corrected.
	///   - topRight: The top right coordinate to be perspective corrected.
	///   - bottomRight: The bottom right coordinate to be perspective corrected.
	///   - bottomLeft: The bottom left coordinate to be perspective corrected.
	///   - crop: No Description
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Apply a perspective correction to an image.
	///
	/// **Categories**: BuiltIn, GeometryAdjustment, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIPerspectiveCorrection Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveCorrection)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPerspectiveCorrection/)
	@inlinable func applyingPerspectiveCorrection(
		topLeft: CGPoint = CIFF.PerspectiveCorrection.topLeftDefault,
		topRight: CGPoint = CIFF.PerspectiveCorrection.topRightDefault,
		bottomRight: CGPoint = CIFF.PerspectiveCorrection.bottomRightDefault,
		bottomLeft: CGPoint = CIFF.PerspectiveCorrection.bottomLeftDefault,
		crop: Bool = CIFF.PerspectiveCorrection.cropDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.PerspectiveCorrection(
			inputImage: self,
			topLeft: topLeft,
			topRight: topRight,
			bottomRight: bottomRight,
			bottomLeft: bottomLeft,
			crop: crop
		)?.outputImage ?? CIImage.empty()
	}
}
