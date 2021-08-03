//
//  CIToneCurve.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.7, iOS 5, *)
	@inlinable @objc static func ToneCurve() -> CIFilterFactory.CIToneCurve? {
		return CIFilterFactory.CIToneCurve()
	}
}

@available(macOS 10.7, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Tone Curve
	///
	/// Adjusts tone response of the R, G, and B channels of an image. The input points are five x,y values that are interpolated using a spline curve. The curve is applied in a perceptual (gamma 2) version of the working space.
	///
	/// **Links**
	///
	/// [CIToneCurve Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIToneCurve)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIToneCurve/)
	///
	@objc(CIFilterFactory_CIToneCurve) class CIToneCurve: FilterCore {
		@objc public init?() {
			super.init(name: "CIToneCurve")
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
		///   Class:    CIVector
		///   Type:     CIAttributeTypeOffset
		///   Default:  [0 0]
		@objc public dynamic var inputPoint0: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputPoint0")
			}
			set {
				self.setKeyedValue(newValue?.vector, for: "inputPoint0")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeOffset
		///   Default:  [0.25 0.25]
		@objc public dynamic var inputPoint1: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputPoint1")
			}
			set {
				self.setKeyedValue(newValue?.vector, for: "inputPoint1")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeOffset
		///   Default:  [0.5 0.5]
		@objc public dynamic var inputPoint2: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputPoint2")
			}
			set {
				self.setKeyedValue(newValue?.vector, for: "inputPoint2")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeOffset
		///   Default:  [0.75 0.75]
		@objc public dynamic var inputPoint3: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputPoint3")
			}
			set {
				self.setKeyedValue(newValue?.vector, for: "inputPoint3")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeOffset
		///   Default:  [1 1]
		@objc public dynamic var inputPoint4: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputPoint4")
			}
			set {
				self.setKeyedValue(newValue?.vector, for: "inputPoint4")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputPoint0: CIFilterFactory.Point = CIFilterFactory.Point(x: 0.0, y: 0.0),
			inputPoint1: CIFilterFactory.Point = CIFilterFactory.Point(x: 0.25, y: 0.25),
			inputPoint2: CIFilterFactory.Point = CIFilterFactory.Point(x: 0.5, y: 0.5),
			inputPoint3: CIFilterFactory.Point = CIFilterFactory.Point(x: 0.75, y: 0.75),
			inputPoint4: CIFilterFactory.Point = CIFilterFactory.Point(x: 1.0, y: 1.0)
		) {
			self.init()

			self.inputImage = inputImage
			self.inputPoint0 = inputPoint0
			self.inputPoint1 = inputPoint1
			self.inputPoint2 = inputPoint2
			self.inputPoint3 = inputPoint3
			self.inputPoint4 = inputPoint4
		}
	}
}
