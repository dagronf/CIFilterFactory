//
//  ToneCurve.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.7, iOS 5, tvOS 5, *)
@objc public extension CIFF {
	///
	/// Tone Curve
	///
	/// Adjusts tone response of the R, G, and B channels of an image. The input points are five x,y values that are interpolated using a spline curve. The curve is applied in a perceptual (gamma 2) version of the working space.
	///
	/// **Links**
	///
	/// - [CIToneCurve Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIToneCurve)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/citonecurve?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIToneCurve/)
	///
	@available(macOS 10.7, iOS 5, tvOS 5, *)
	@objc(CIFFToneCurve) class ToneCurve: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIToneCurve")
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

		// MARK: - point0 (inputPoint0)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint0`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default value: `[0 0]`
		@objc public var point0: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint0", defaultValue: Self.point0Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint0")
			}
		}

		/// point0 default value
		@objc public static let point0Default = CGPoint(x: 0.0, y: 0.0)

		// MARK: - point1 (inputPoint1)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint1`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default value: `[0.25 0.25]`
		@objc public var point1: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint1", defaultValue: Self.point1Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint1")
			}
		}

		/// point1 default value
		@objc public static let point1Default = CGPoint(x: 0.25, y: 0.25)

		// MARK: - point2 (inputPoint2)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint2`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default value: `[0.5 0.5]`
		@objc public var point2: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint2", defaultValue: Self.point2Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint2")
			}
		}

		/// point2 default value
		@objc public static let point2Default = CGPoint(x: 0.5, y: 0.5)

		// MARK: - point3 (inputPoint3)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint3`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default value: `[0.75 0.75]`
		@objc public var point3: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint3", defaultValue: Self.point3Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint3")
			}
		}

		/// point3 default value
		@objc public static let point3Default = CGPoint(x: 0.75, y: 0.75)

		// MARK: - point4 (inputPoint4)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint4`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default value: `[1 1]`
		@objc public var point4: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint4", defaultValue: Self.point4Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint4")
			}
		}

		/// point4 default value
		@objc public static let point4Default = CGPoint(x: 1.0, y: 1.0)

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			point0: CGPoint = ToneCurve.point0Default,
			point1: CGPoint = ToneCurve.point1Default,
			point2: CGPoint = ToneCurve.point2Default,
			point3: CGPoint = ToneCurve.point3Default,
			point4: CGPoint = ToneCurve.point4Default
		) {
			self.init()

			self.image = image
			self.point0 = point0
			self.point1 = point1
			self.point2 = point2
			self.point3 = point3
			self.point4 = point4
		}
	}
}