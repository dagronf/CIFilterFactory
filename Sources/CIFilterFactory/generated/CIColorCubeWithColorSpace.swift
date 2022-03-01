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

@available(macOS 10.9, iOS 7, tvOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Color Cube with ColorSpace
	///
	/// Uses a three-dimensional color table in a specified colorspace to transform the source image pixels.
	///
	/// **Links**
	///
	/// - [CIColorCubeWithColorSpace Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubeWithColorSpace)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolorcubewithcolorspace?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCubeWithColorSpace/)
	///
	@objc(CIFilterFactory_ColorCubeWithColorSpace) class ColorCubeWithColorSpace: FilterCore {
		@objc public init?() {
			super.init(name: "CIColorCubeWithColorSpace")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   - Attribute key: `inputImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - cubeDimension (inputCubeDimension)

		///
		/// No Description
		///
		///   - Attribute key: `inputCubeDimension`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeCount`
		///   - Default value: `2`
		///   minValue: 2.0
		///   maxValue: 128.0
		///
		public static let cubeDimension_Range: ClosedRange<Float> = 2.0 ... 128.0
		@objc public var cubeDimension: NSNumber? {
			get {
				return self.keyedValue("inputCubeDimension")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: ColorCubeWithColorSpace.cubeDimension_Range), forKey: "inputCubeDimension")
			}
		}

		// MARK: - cubeData (inputCubeData)

		///
		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		///   - Attribute key: `inputCubeData`
		///   - Internal class: `NSData`
		///   - Default value: `{length = 128, bytes = 0x00000000 00000000 00000000 0000803f ... 0000803f 0000803f }`
		@objc public var cubeData: Data? {
			get {
				let tmp: NSData? = self.keyedValue("inputCubeData")
				return tmp as Data?
			}
			set {
				self.setKeyedValue(newValue as NSData?, for: "inputCubeData")
			}
		}

		// MARK: - colorSpace (inputColorSpace)

		///
		/// No Description
		///
		///   - Attribute key: `inputColorSpace`
		///   - Internal class: `NSObject`
		@objc public var colorSpace: NSObject? {
			get {
				return self.keyedValue("inputColorSpace")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColorSpace")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			cubeDimension: NSNumber = 2,
			cubeData: Data,
			colorSpace: NSObject
		) {
			self.init()

			self.image = image
			self.cubeDimension = cubeDimension
			self.cubeData = cubeData
			self.colorSpace = colorSpace
		}
	}
}
