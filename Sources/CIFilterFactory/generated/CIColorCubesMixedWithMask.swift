//
//  CIColorCubesMixedWithMask.swift  (AUTOMATICALLY GENERATED FILE)
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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Color Cubes Mixed With Mask
	///
	/// Uses two three-dimensional color tables in a specified colorspace to transform the source image pixels. The mask image is used as an interpolant to mix the output of the two cubes.
	///
	/// **Links**
	///
	/// [CIColorCubesMixedWithMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubesMixedWithMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorCubesMixedWithMask/)
	///
	@objc(CIFilterFactory_CIColorCubesMixedWithMask) class CIColorCubesMixedWithMask: Core {
		@objc public init?() {
			super.init(name: "CIColorCubesMixedWithMask")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputMaskImage

		///
		/// A masking image.
		///
		@objc public var inputMaskImage: CIImage? {
			get {
				return filter.value(forKey: "inputMaskImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputMaskImage")
			}
		}

		// MARK: - inputCubeDimension

		///
		/// No Description
		///
		///   minValue: 2.0
		///   maxValue: 128.0
		///
		let inputCubeDimension_Range: ClosedRange<Float> = 2.0 ... 128.0
		@objc public var inputCubeDimension: NSNumber? {
			get {
				return filter.value(forKey: "inputCubeDimension") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCubeDimension_Range), forKey: "inputCubeDimension")
			}
		}

		// MARK: - inputCube0Data

		///
		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		@objc public var inputCube0Data: NSData? {
			get {
				return filter.value(forKey: "inputCube0Data") as? NSData
			}
			set {
				filter.setValue(newValue, forKey: "inputCube0Data")
			}
		}

		// MARK: - inputCube1Data

		///
		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		@objc public var inputCube1Data: NSData? {
			get {
				return filter.value(forKey: "inputCube1Data") as? NSData
			}
			set {
				filter.setValue(newValue, forKey: "inputCube1Data")
			}
		}

		// MARK: - inputColorSpace

		///
		/// No Description
		///
		@objc public var inputColorSpace: NSObject? {
			get {
				return filter.value(forKey: "inputColorSpace") as? NSObject
			}
			set {
				filter.setValue(newValue, forKey: "inputColorSpace")
			}
		}
	}
}