//
//  ColorCubeWithColorSpace.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Cube with ColorSpace
	///
	/// Uses a three-dimensional color table in a specified colorspace to transform the source image pixels.
	///
	/// **CIFilter Name**
	/// - CIColorCubeWithColorSpace
	///
	/// **Availability**
	/// - macOS 10.9, iOS 7, tvOS 7
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
	/// - [CIColorCubeWithColorSpace Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubeWithColorSpace)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCubeWithColorSpace/)
	@available(macOS 10.9, iOS 7, tvOS 7, *)
	@objc(CIFFColorCubeWithColorSpace) class ColorCubeWithColorSpace: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIColorCubeWithColorSpace")
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

		// MARK: - cubeDimension (inputCubeDimension)

		/// The dimension of the color cube.
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
				self.setUIntValue(newValue, bounds: ColorCubeWithColorSpace.cubeDimensionRange, forKey: "inputCubeDimension")
			}
		}

		/// `cubeDimension` default value
		@objc public static let cubeDimensionDefault: UInt = 2

		/// `cubeDimension` range definition
		public static let cubeDimensionRange: ClosedRange<UInt> = 2 ... 128

		// MARK: - cubeData (inputCubeData)

		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCubeData`
		/// - Internal class: `NSData`
		@objc public var cubeData: Data? {
			get {
				self.dataValue(forKey: "inputCubeData")
			}
			set {
				self.setKeyedValue(newValue as? NSData, for: "inputCubeData")
			}
		}

		// MARK: - extrapolate (inputExtrapolate)

		/// If true, then the color cube will be extrapolated if the input image contains RGB component values outside the range 0.0 to 1.0.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputExtrapolate`
		/// - Internal class: `NSNumber`
		@objc public var extrapolate: NSNumber? {
			get {
				self.keyedValue("inputExtrapolate")
			}
			set {
				self.setKeyedValue(newValue, for: "inputExtrapolate")
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

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - cubeDimension: The dimension of the color cube.
		///   - cubeData: Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///   - extrapolate: If true, then the color cube will be extrapolated if the input image contains RGB component values outside the range 0.0 to 1.0.
		///   - colorSpace: The CGColorSpace that defines the RGB values in the color table.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			cubeDimension: UInt = ColorCubeWithColorSpace.cubeDimensionDefault,
			cubeData: Data,
			extrapolate: NSNumber,
			colorSpace: NSObject
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.cubeDimension = cubeDimension
			self.cubeData = cubeData
			self.extrapolate = extrapolate
			self.colorSpace = colorSpace
		}
	}
}

@available(macOS 10.9, iOS 7, tvOS 7, *)
public extension CIImage {
	/// Apply the 'Color Cube with ColorSpace' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - cubeDimension: The dimension of the color cube. (2...128)
	///   - cubeData: Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
	///   - extrapolate: If true, then the color cube will be extrapolated if the input image contains RGB component values outside the range 0.0 to 1.0.
	///   - colorSpace: The CGColorSpace that defines the RGB values in the color table.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Uses a three-dimensional color table in a specified colorspace to transform the source image pixels.
	///
	/// **Categories**: BuiltIn, ColorEffect, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIColorCubeWithColorSpace Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubeWithColorSpace)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCubeWithColorSpace/)
	@inlinable func applyingColorCubeWithColorSpace(
		cubeDimension: UInt = CIFF.ColorCubeWithColorSpace.cubeDimensionDefault,
		cubeData: Data,
		extrapolate: NSNumber,
		colorSpace: NSObject,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ColorCubeWithColorSpace(
			inputImage: self,
			cubeDimension: cubeDimension,
			cubeData: cubeData,
			extrapolate: extrapolate,
			colorSpace: colorSpace
		)?.outputImage ?? CIImage.empty()
	}
}
