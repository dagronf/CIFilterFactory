//
//  ToneCurve.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Tone Curve
	///
	/// Adjusts tone response of the R, G, and B channels of an image. The input points are five x,y values that are interpolated using a spline curve. The curve is applied in a perceptual (gamma 2) version of the working space.
	///
	/// **CIFilter Name**
	/// - CIToneCurve
	///
	/// **Availability**
	/// - macOS 10.7, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorAdjustment (*CICategoryColorAdjustment*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIToneCurve Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIToneCurve)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIToneCurve/)
	@available(macOS 10.7, iOS 5, tvOS 5, *)
	@objc(CIFFToneCurve) class ToneCurve: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIToneCurve")
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

		// MARK: - point0 (inputPoint0)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint0`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 0.0, y: 0.0)`
		@objc public var point0: CGPoint {
			get {
				self.cgPointValue(forKey: "inputPoint0", defaultValue: Self.point0Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint0")
			}
		}

		/// `point0` default value
		@objc public static let point0Default = CGPoint(x: 0.0, y: 0.0)

		// MARK: - point1 (inputPoint1)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint1`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 0.25, y: 0.25)`
		@objc public var point1: CGPoint {
			get {
				self.cgPointValue(forKey: "inputPoint1", defaultValue: Self.point1Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint1")
			}
		}

		/// `point1` default value
		@objc public static let point1Default = CGPoint(x: 0.25, y: 0.25)

		// MARK: - point2 (inputPoint2)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint2`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 0.5, y: 0.5)`
		@objc public var point2: CGPoint {
			get {
				self.cgPointValue(forKey: "inputPoint2", defaultValue: Self.point2Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint2")
			}
		}

		/// `point2` default value
		@objc public static let point2Default = CGPoint(x: 0.5, y: 0.5)

		// MARK: - point3 (inputPoint3)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint3`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 0.75, y: 0.75)`
		@objc public var point3: CGPoint {
			get {
				self.cgPointValue(forKey: "inputPoint3", defaultValue: Self.point3Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint3")
			}
		}

		/// `point3` default value
		@objc public static let point3Default = CGPoint(x: 0.75, y: 0.75)

		// MARK: - point4 (inputPoint4)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint4`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 1.0, y: 1.0)`
		@objc public var point4: CGPoint {
			get {
				self.cgPointValue(forKey: "inputPoint4", defaultValue: Self.point4Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint4")
			}
		}

		/// `point4` default value
		@objc public static let point4Default = CGPoint(x: 1.0, y: 1.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - point0: No Description
		///   - point1: No Description
		///   - point2: No Description
		///   - point3: No Description
		///   - point4: No Description
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			point0: CGPoint = ToneCurve.point0Default,
			point1: CGPoint = ToneCurve.point1Default,
			point2: CGPoint = ToneCurve.point2Default,
			point3: CGPoint = ToneCurve.point3Default,
			point4: CGPoint = ToneCurve.point4Default
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.point0 = point0
			self.point1 = point1
			self.point2 = point2
			self.point3 = point3
			self.point4 = point4
		}
	}
}

@available(macOS 10.7, iOS 5, tvOS 5, *)
public extension CIImage {
	/// Apply the 'Tone Curve' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - point0: No Description
	///   - point1: No Description
	///   - point2: No Description
	///   - point3: No Description
	///   - point4: No Description
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Adjusts tone response of the R, G, and B channels of an image. The input points are five x,y values that are interpolated using a spline curve. The curve is applied in a perceptual (gamma 2) version of the working space.
	///
	/// **Categories**: BuiltIn, ColorAdjustment, Interlaced, NonSquarePixels, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIToneCurve Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIToneCurve)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIToneCurve/)
	@inlinable func applyingToneCurve(
		point0: CGPoint = CIFF.ToneCurve.point0Default,
		point1: CGPoint = CIFF.ToneCurve.point1Default,
		point2: CGPoint = CIFF.ToneCurve.point2Default,
		point3: CGPoint = CIFF.ToneCurve.point3Default,
		point4: CGPoint = CIFF.ToneCurve.point4Default,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ToneCurve(
			inputImage: self,
			point0: point0,
			point1: point1,
			point2: point2,
			point3: point3,
			point4: point4
		)?.outputImage ?? CIImage.empty()
	}
}
