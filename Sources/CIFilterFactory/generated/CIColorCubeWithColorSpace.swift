//
//  CIColorCubeWithColorSpace.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.9, iOS 7, *)
	@inlinable @objc static func ColorCubeWithColorSpace() -> CIFilterFactory.CIColorCubeWithColorSpace? {
		return CIFilterFactory.CIColorCubeWithColorSpace()
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Color Cube with ColorSpace
	///
	/// Uses a three-dimensional color table in a specified colorspace to transform the source image pixels.
	///
	/// **Links**
	///
	/// [CIColorCubeWithColorSpace Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubeWithColorSpace)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorCubeWithColorSpace/)
	///
	@objc(CIFilterFactory_CIColorCubeWithColorSpace) class CIColorCubeWithColorSpace: FilterCore {
		@objc public init?() {
			super.init(name: "CIColorCubeWithColorSpace")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeCount
		///   Default:  2
		///   minValue: 2.0
		///   maxValue: 128.0
		///
		static let inputCubeDimension_Range: ClosedRange<Float> = 2.0 ... 128.0
		@objc public dynamic var inputCubeDimension: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCubeDimension") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIColorCubeWithColorSpace.inputCubeDimension_Range), forKey: "inputCubeDimension")
			}
		}

		///
		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		///   Class:    NSData
		///   Default:  {length = 128, bytes = 0x00000000 00000000 00000000 0000803f ... 0000803f 0000803f }
		@objc public dynamic var inputCubeData: NSData? {
			get {
				return self.filter.value(forKey: "inputCubeData") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCubeData")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSObject
		@objc public dynamic var inputColorSpace: NSObject? {
			get {
				return self.filter.value(forKey: "inputColorSpace") as? NSObject
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColorSpace")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputCubeDimension: NSNumber = 2,
			inputCubeData: NSData,
			inputColorSpace: NSObject
		) {
			self.init()

			self.inputImage = inputImage
			self.inputCubeDimension = inputCubeDimension
			self.inputCubeData = inputCubeData
			self.inputColorSpace = inputColorSpace
		}
	}
}
