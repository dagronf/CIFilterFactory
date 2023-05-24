//
//  StripesGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Stripes
	///
	/// Generates a stripe pattern. You can control the color of the stripes, the spacing, and the contrast.
	///
	/// **CIFilter Name**
	/// - CIStripesGenerator
	///
	/// **Availability**
	/// - macOS 10.4, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Generator (*CICategoryGenerator*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIStripesGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStripesGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIStripesGenerator/)
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFStripesGenerator) class StripesGenerator: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIStripesGenerator")
		}

		// MARK: - center (inputCenter)

		/// The center of the effect as x and y pixel coordinates.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var center: CGPoint {
			get {
				self.cgPointValue(forKey: "inputCenter", defaultValue: Self.centerDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// `center` default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - color0 (inputColor0)

		/// A color to use for the odd stripes.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor0`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var color0: CIColor? {
			get {
				self.keyedValue("inputColor0")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor0")
			}
		}

		// MARK: - color1 (inputColor1)

		/// A color to use for the even stripes.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor1`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var color1: CIColor? {
			get {
				self.keyedValue("inputColor1")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor1")
			}
		}

		// MARK: - width (inputWidth)

		/// The width of a stripe.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default Value: `80.0`
		@objc public var width: Double {
			get {
				self.doubleValue(forKey: "inputWidth", defaultValue: Self.widthDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputWidth")
			}
		}

		/// `width` default value
		@objc public static let widthDefault: Double = 80.0

		// MARK: - sharpness (inputSharpness)

		/// The sharpness of the stripe pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSharpness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `1.0`
		@objc public var sharpness: Double {
			get {
				self.doubleValue(forKey: "inputSharpness", defaultValue: Self.sharpnessDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: StripesGenerator.sharpnessRange, forKey: "inputSharpness")
			}
		}

		/// `sharpness` default value
		@objc public static let sharpnessDefault: Double = 1.0

		/// `sharpness` range definition
		public static let sharpnessRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - color0: A color to use for the odd stripes.
		///   - color1: A color to use for the even stripes.
		///   - width: The width of a stripe.
		///   - sharpness: The sharpness of the stripe pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0.
		@objc public convenience init?(
			center: CGPoint = StripesGenerator.centerDefault,
			color0: CIColor,
			color1: CIColor,
			width: Double = StripesGenerator.widthDefault,
			sharpness: Double = StripesGenerator.sharpnessDefault
		) {
			self.init()
			self.center = center
			self.color0 = color0
			self.color1 = color1
			self.width = width
			self.sharpness = sharpness
		}
	}
}

@available(macOS 10.4, iOS 5, tvOS 5, *)
public extension CIImage {
	/// Create a new CIImage using the 'Stripes' filter
	///
	/// - Parameters:
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - color0: A color to use for the odd stripes.
	///   - color1: A color to use for the even stripes.
	///   - width: The width of a stripe.
	///   - sharpness: The sharpness of the stripe pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0. (0.0...1.0)
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generates a stripe pattern. You can control the color of the stripes, the spacing, and the contrast.
	///
	/// **Categories**: BuiltIn, Generator, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIStripesGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStripesGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIStripesGenerator/)
	@inlinable static func createUsingStripesGenerator(
		center: CGPoint = CIFF.StripesGenerator.centerDefault,
		color0: CIColor,
		color1: CIColor,
		width: Double = CIFF.StripesGenerator.widthDefault,
		sharpness: Double = CIFF.StripesGenerator.sharpnessDefault
	) -> CIImage? {
		return CIFF.StripesGenerator(
			center: center,
			color0: color0,
			color1: color1,
			width: width,
			sharpness: sharpness
		)?.outputImage
	}
}
