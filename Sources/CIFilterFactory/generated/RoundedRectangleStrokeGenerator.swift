//
//  RoundedRectangleStrokeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Rounded Rectangle Stroke Generator
	///
	/// Generates a rounded rectangle stroke image with the specified extent, corner radius, stroke width, and color.
	///
	/// **CIFilter Name**
	/// - CIRoundedRectangleStrokeGenerator
	///
	/// **Availability**
	/// - macOS 14.0, iOS 17, tvOS 17
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Generator (*CICategoryGenerator*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	///
	/// **Documentation Links**
	/// - [CIRoundedRectangleStrokeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRoundedRectangleStrokeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIRoundedRectangleStrokeGenerator/)
	@available(macOS 14.0, iOS 17, tvOS 17, *)
	@objc(CIFFRoundedRectangleStrokeGenerator) class RoundedRectangleStrokeGenerator: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIRoundedRectangleStrokeGenerator")
		}

		// MARK: - extent (inputExtent)

		/// A rectangle that defines the extent of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputExtent`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeRectangle`
		/// - Default Value: `CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)`
		@objc public var extent: CGRect {
			get {
				self.cgRectValue(forKey: "inputExtent", defaultValue: Self.extentDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// `extent` default value
		@objc public static let extentDefault = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)

		// MARK: - radius (inputRadius)

		/// The distance from the center of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `10.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: RoundedRectangleStrokeGenerator.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 10.0

		/// `radius` range definition
		public static let radiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - color (inputColor)

		/// A color.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var color: CIColor? {
			get {
				self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		// MARK: - width (inputWidth)

		/// The width in pixels of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `10.0`
		@objc public var width: Double {
			get {
				self.doubleValue(forKey: "inputWidth", defaultValue: Self.widthDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: RoundedRectangleStrokeGenerator.widthRange, forKey: "inputWidth")
			}
		}

		/// `width` default value
		@objc public static let widthDefault: Double = 10.0

		/// `width` range definition
		public static let widthRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - extent: A rectangle that defines the extent of the effect.
		///   - radius: The distance from the center of the effect.
		///   - color: A color.
		///   - width: The width in pixels of the effect.
		@objc public convenience init?(
			extent: CGRect = RoundedRectangleStrokeGenerator.extentDefault,
			radius: Double = RoundedRectangleStrokeGenerator.radiusDefault,
			color: CIColor,
			width: Double = RoundedRectangleStrokeGenerator.widthDefault
		) {
			self.init()
			self.extent = extent
			self.radius = radius
			self.color = color
			self.width = width
		}
	}
}

@available(macOS 14.0, iOS 17, tvOS 17, *)
public extension CIImage {
	/// Create a new CIImage using the 'Rounded Rectangle Stroke Generator' filter
	///
	/// - Parameters:
	///   - extent: A rectangle that defines the extent of the effect.
	///   - radius: The distance from the center of the effect. (0.0...)
	///   - color: A color.
	///   - width: The width in pixels of the effect. (0.0...)
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generates a rounded rectangle stroke image with the specified extent, corner radius, stroke width, and color.
	///
	/// **Categories**: BuiltIn, Generator, HighDynamicRange, StillImage
	///
	/// **Documentation Links**
	/// - [CIRoundedRectangleStrokeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRoundedRectangleStrokeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIRoundedRectangleStrokeGenerator/)
	@inlinable static func createUsingRoundedRectangleStrokeGenerator(
		extent: CGRect = CIFF.RoundedRectangleStrokeGenerator.extentDefault,
		radius: Double = CIFF.RoundedRectangleStrokeGenerator.radiusDefault,
		color: CIColor,
		width: Double = CIFF.RoundedRectangleStrokeGenerator.widthDefault
	) -> CIImage? {
		return CIFF.RoundedRectangleStrokeGenerator(
			extent: extent,
			radius: radius,
			color: color,
			width: width
		)?.outputImage
	}
}
