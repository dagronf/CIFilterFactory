//
//  ColorCubesMixedWithMask.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Color Cubes Mixed With Mask
	///
	/// Uses two three-dimensional color tables in a specified colorspace to transform the source image pixels. The mask image is used as an interpolant to mix the output of the two cubes.
	///
	/// **Links**
	///
	/// - [CIColorCubesMixedWithMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubesMixedWithMask)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolorcubesmixedwithmask?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorCubesMixedWithMask/)
	///
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFColorCubesMixedWithMask) class ColorCubesMixedWithMask: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIColorCubesMixedWithMask")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
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
				return self.keyedValue("inputMaskImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMaskImage")
			}
		}

		// MARK: - cubeDimension (inputCubeDimension)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCubeDimension`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeCount`
		/// - Default value: `2`
		/// - Minimum value: `2.0`
		/// - Maximum value: `128.0`
		@objc public var cubeDimension: UInt {
			get {
				let number = self.filter.value(forKey: "inputCubeDimension") as? NSNumber
				return number?.uintValue ?? 2
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: ColorCubesMixedWithMask.cubeDimensionRange)
				self.filter.setValue(number, forKey: "inputCubeDimension")
			}
		}

		/// `cubeDimension` range definition
		public static let cubeDimensionRange: ClosedRange<Double> = 2.0 ... 128.0

		// MARK: - cube0Data (inputCube0Data)

		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCube0Data`
		/// - Internal class: `NSData`
		/// - Default value: `{length = 128, bytes = 0x00000000 00000000 00000000 0000803f ... 0000803f 0000803f }`
		@objc public var cube0Data: Data? {
			get {
				let tmp: NSData? = self.keyedValue("inputCube0Data")
				return tmp as Data?
			}
			set {
				self.setKeyedValue(newValue as NSData?, for: "inputCube0Data")
			}
		}

		// MARK: - cube1Data (inputCube1Data)

		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCube1Data`
		/// - Internal class: `NSData`
		/// - Default value: `{length = 128, bytes = 0x00000000 00000000 00000000 0000803f ... 0000803f 0000803f }`
		@objc public var cube1Data: Data? {
			get {
				let tmp: NSData? = self.keyedValue("inputCube1Data")
				return tmp as Data?
			}
			set {
				self.setKeyedValue(newValue as NSData?, for: "inputCube1Data")
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
			image: CIImage,
			maskImage: CIImage,
			cubeDimension: UInt = 2,
			cube0Data: Data,
			cube1Data: Data,
			colorSpace: NSObject
		) {
			self.init()

			self.image = image
			self.maskImage = maskImage
			self.cubeDimension = cubeDimension
			self.cube0Data = cube0Data
			self.cube1Data = cube1Data
			self.colorSpace = colorSpace
		}
	}
}
