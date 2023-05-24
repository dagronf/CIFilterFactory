//
//  ColorCurves.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Curves
	///
	/// Uses a three-channel one-dimensional color table to transform the source image pixels.
	///
	/// **CIFilter Name**
	/// - CIColorCurves
	///
	/// **Availability**
	/// - macOS 10.13, iOS 11, tvOS 11
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorEffect (*CICategoryColorEffect*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIColorCurves Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCurves)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCurves/)
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFColorCurves) class ColorCurves: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIColorCurves")
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

		// MARK: - curvesData (inputCurvesData)

		/// Data containing a color table of floating-point RGB values.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCurvesData`
		/// - Internal class: `NSData`
		@objc public var curvesData: Data? {
			get {
				self.dataValue(forKey: "inputCurvesData")
			}
			set {
				self.setKeyedValue(newValue as? NSData, for: "inputCurvesData")
			}
		}

		// MARK: - curvesDomain (inputCurvesDomain)

		/// A two-element vector that defines the minimum and maximum RGB component values that are used to look up result values from the color table.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCurvesDomain`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 1]`
		@objc public var curvesDomain: CIVector? {
			get {
				self.keyedValue("inputCurvesDomain")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCurvesDomain")
			}
		}

		/// `curvesDomain` default value
		@objc public static let curvesDomainDefault = CIVector(values: [0.0, 1.0], count: 2)

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
		///   - curvesData: Data containing a color table of floating-point RGB values.
		///   - curvesDomain: A two-element vector that defines the minimum and maximum RGB component values that are used to look up result values from the color table.
		///   - colorSpace: The CGColorSpace that defines the RGB values in the color table.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			curvesData: Data,
			curvesDomain: CIVector = ColorCurves.curvesDomainDefault,
			colorSpace: NSObject
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.curvesData = curvesData
			self.curvesDomain = curvesDomain
			self.colorSpace = colorSpace
		}
	}
}

@available(macOS 10.13, iOS 11, tvOS 11, *)
public extension CIImage {
	/// Apply the 'Color Curves' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - curvesData: Data containing a color table of floating-point RGB values.
	///   - curvesDomain: A two-element vector that defines the minimum and maximum RGB component values that are used to look up result values from the color table.
	///   - colorSpace: The CGColorSpace that defines the RGB values in the color table.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Uses a three-channel one-dimensional color table to transform the source image pixels.
	///
	/// **Categories**: BuiltIn, ColorEffect, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIColorCurves Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCurves)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCurves/)
	@inlinable func applyingColorCurves(
		curvesData: Data,
		curvesDomain: CIVector = CIFF.ColorCurves.curvesDomainDefault,
		colorSpace: NSObject,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ColorCurves(
			inputImage: self,
			curvesData: curvesData,
			curvesDomain: curvesDomain,
			colorSpace: colorSpace
		)?.outputImage ?? CIImage.empty()
	}
}
