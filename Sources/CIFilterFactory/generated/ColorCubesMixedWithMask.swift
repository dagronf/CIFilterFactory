//
//  ColorCubesMixedWithMask.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Cubes Mixed With Mask
	///
	/// Uses two three-dimensional color tables in a specified colorspace to transform the source image pixels. The mask image is used as an interpolant to mix the output of the two cubes.
	///
	/// **CIFilter Name**
	/// - CIColorCubesMixedWithMask
	///
	/// **Availability**
	/// - macOS 10.13, iOS 11, tvOS 11
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorEffect (*CICategoryColorEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIColorCubesMixedWithMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubesMixedWithMask)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCubesMixedWithMask/)
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFColorCubesMixedWithMask) class ColorCubesMixedWithMask: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIColorCubesMixedWithMask")
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

		// MARK: - maskImage (inputMaskImage)

		/// A masking image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaskImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var maskImage: CIImage? {
			get {
				self.keyedValue("inputMaskImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMaskImage")
			}
		}

		// MARK: - cubeDimension (inputCubeDimension)

		/// The dimension of the color cubes.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCubeDimension`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeCount`
		/// - Minimum Value: `2`
		/// - Maximum Value: `128`
		/// - Default Value: `2`
		@objc public var cubeDimension: UInt {
			get {
				self.uintValue(forKey: "inputCubeDimension", defaultValue: Self.cubeDimensionDefault)
			}
			set {
				self.setUIntValue(newValue, bounds: ColorCubesMixedWithMask.cubeDimensionRange, forKey: "inputCubeDimension")
			}
		}

		/// `cubeDimension` default value
		@objc public static let cubeDimensionDefault: UInt = 2

		/// `cubeDimension` range definition
		public static let cubeDimensionRange: ClosedRange<UInt> = 2 ... 128

		// MARK: - cube0Data (inputCube0Data)

		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCube0Data`
		/// - Internal class: `NSData`
		@objc public var cube0Data: Data? {
			get {
				self.dataValue(forKey: "inputCube0Data")
			}
			set {
				self.setKeyedValue(newValue as? NSData, for: "inputCube0Data")
			}
		}

		// MARK: - cube1Data (inputCube1Data)

		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCube1Data`
		/// - Internal class: `NSData`
		@objc public var cube1Data: Data? {
			get {
				self.dataValue(forKey: "inputCube1Data")
			}
			set {
				self.setKeyedValue(newValue as? NSData, for: "inputCube1Data")
			}
		}

		// MARK: - colorSpace (inputColorSpace)

		/// The CGColorSpace that defines the RGB values in the color table.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColorSpace`
		/// - Internal class: `NSObject`
		@objc public var colorSpace: NSObject? {
			get {
				self.keyedValue("inputColorSpace")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColorSpace")
			}
		}

		// MARK: - extrapolate (inputExtrapolate)

		/// If true, then the color cube will be extrapolated if the input image contains RGB component values outside the range 0 to 1.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputExtrapolate`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var extrapolate: Bool {
			get {
				self.boolValue(forKey: "inputExtrapolate", defaultValue: Self.extrapolateDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputExtrapolate")
			}
		}

		/// `extrapolate` default value
		@objc public static let extrapolateDefault: Bool = false

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - maskImage: A masking image.
		///   - cubeDimension: The dimension of the color cubes.
		///   - cube0Data: Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///   - cube1Data: Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///   - colorSpace: The CGColorSpace that defines the RGB values in the color table.
		///   - extrapolate: If true, then the color cube will be extrapolated if the input image contains RGB component values outside the range 0 to 1.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			maskImage: CIImage? = nil,
			cubeDimension: UInt = ColorCubesMixedWithMask.cubeDimensionDefault,
			cube0Data: Data,
			cube1Data: Data,
			colorSpace: NSObject,
			extrapolate: Bool = ColorCubesMixedWithMask.extrapolateDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let maskImage = maskImage {
				self.maskImage = maskImage
			}
			self.cubeDimension = cubeDimension
			self.cube0Data = cube0Data
			self.cube1Data = cube1Data
			self.colorSpace = colorSpace
			self.extrapolate = extrapolate
		}
	}
}

@available(macOS 10.13, iOS 11, tvOS 11, *)
public extension CIImage {
	/// Apply the 'Color Cubes Mixed With Mask' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - maskImage: A masking image.
	///   - cubeDimension: The dimension of the color cubes. (2...128)
	///   - cube0Data: Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
	///   - cube1Data: Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
	///   - colorSpace: The CGColorSpace that defines the RGB values in the color table.
	///   - extrapolate: If true, then the color cube will be extrapolated if the input image contains RGB component values outside the range 0 to 1.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Uses two three-dimensional color tables in a specified colorspace to transform the source image pixels. The mask image is used as an interpolant to mix the output of the two cubes.
	///
	/// **Categories**: BuiltIn, ColorEffect, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIColorCubesMixedWithMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubesMixedWithMask)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCubesMixedWithMask/)
	@inlinable func applyingColorCubesMixedWithMask(
		maskImage: CIImage,
		cubeDimension: UInt = CIFF.ColorCubesMixedWithMask.cubeDimensionDefault,
		cube0Data: Data,
		cube1Data: Data,
		colorSpace: NSObject,
		extrapolate: Bool = CIFF.ColorCubesMixedWithMask.extrapolateDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ColorCubesMixedWithMask(
			inputImage: self,
			maskImage: maskImage,
			cubeDimension: cubeDimension,
			cube0Data: cube0Data,
			cube1Data: cube1Data,
			colorSpace: colorSpace,
			extrapolate: extrapolate
		)?.outputImage ?? CIImage.empty()
	}
}
