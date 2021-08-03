//
//  CIColorCurves.swift  (AUTOMATICALLY GENERATED FILE)
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
//  Automatically generated on 2020-07-09 00:57:49 +0000.  Do not edit.

import AVFoundation
import CoreImage
import CoreML
import Foundation

public extension CIFilter {
	@available(macOS 10.13, iOS 11, *)
	@inlinable @objc static func ColorCurves() -> CIFilterFactory.CIColorCurves? {
		return CIFilterFactory.CIColorCurves()
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Color Curves
	///
	/// Uses a three-channel one-dimensional color table to transform the source image pixels. The color table must be composed of floating-point RGB values.
	///
	/// **Links**
	///
	/// [CIColorCurves Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCurves)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorCurves/)
	///
	@objc(CIFilterFactory_CIColorCurves) class CIColorCurves: FilterCore {
		@objc public init?() {
			super.init(name: "CIColorCurves")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSData
		///   Default:  {length = 36, bytes = 0x00000000 00000000 00000000 0000003f ... 0000803f 0000803f }
		@objc public dynamic var inputCurvesData: NSData? {
			get {
				return self.keyedValue("inputCurvesData")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCurvesData")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Default:  [0 1]
		@objc public dynamic var inputCurvesDomain: CIVector? {
			get {
				return self.keyedValue("inputCurvesDomain")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCurvesDomain")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSObject
		@objc public dynamic var inputColorSpace: NSObject? {
			get {
				return self.keyedValue("inputColorSpace")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColorSpace")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputCurvesData: NSData,
			inputCurvesDomain: CIVector = CIVector([0.0, 1.0]),
			inputColorSpace: NSObject
		) {
			self.init()

			self.inputImage = inputImage
			self.inputCurvesData = inputCurvesData
			self.inputCurvesDomain = inputCurvesDomain
			self.inputColorSpace = inputColorSpace
		}
	}
}
