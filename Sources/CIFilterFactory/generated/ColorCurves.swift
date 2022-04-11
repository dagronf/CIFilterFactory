//
//  ColorCurves.swift  (AUTOMATICALLY GENERATED FILE)
//  CIFilterFactory
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

@available(macOS 10.13, iOS 11, tvOS 11, *)
@objc public extension CIFF {
	///
	/// Color Curves
	///
	/// Uses a three-channel one-dimensional color table to transform the source image pixels. The color table must be composed of floating-point RGB values.
	///
	/// **Availability**
	/// - macOS 10.13, iOS 11, tvOS 11
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryColorEffect
	/// - CICategoryInterlaced
	/// - CICategoryNonSquarePixels
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIColorCurves Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCurves)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolorcurves?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCurves/)
	///
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFColorCurves) class ColorCurves: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIColorCurves")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - curvesData (inputCurvesData)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCurvesData`
		/// - Internal class: `NSData`
		@objc public var curvesData: Data? {
			get {
				let tmp: NSData? = self.keyedValue("inputCurvesData")
				return tmp as Data?
			}
			set {
				self.setKeyedValue(newValue as NSData?, for: "inputCurvesData")
			}
		}

		// MARK: - curvesDomain (inputCurvesDomain)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCurvesDomain`
		/// - Internal class: `CIVector`
		@objc public var curvesDomain: CIVector? {
			get {
				return self.keyedValue("inputCurvesDomain")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCurvesDomain")
			}
		}

		// MARK: - colorSpace (inputColorSpace)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColorSpace`
		/// - Internal class: `NSObject`
		@objc public var colorSpace: NSObject? {
			get {
				return self.keyedValue("inputColorSpace")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColorSpace")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			curvesData: Data,
			curvesDomain: CIVector,
			colorSpace: NSObject
		) {
			self.init()
			self.inputImage = inputImage
			self.curvesData = curvesData
			self.curvesDomain = curvesDomain
			self.colorSpace = colorSpace
		}
	}
}
