//
//  GlassLozenge.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Glass Lozenge
	///
	/// Creates a lozenge-shaped lens and distorts the portion of the image over which the lens is placed.
	///
	/// **CIFilter Name**
	/// - CIGlassLozenge
	///
	/// **Availability**
	/// - macOS 10.4, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - DistortionEffect (*CICategoryDistortionEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIGlassLozenge Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassLozenge)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGlassLozenge/)
	@available(macOS 10.4, iOS 9, tvOS 9, *)
	@objc(CIFFGlassLozenge) class GlassLozenge: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIGlassLozenge")
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

		/// The x and y position that defines the center of the circle at one end of the lozenge.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint0`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var point0: CGPoint {
			get {
				self.cgPointValue(forKey: "inputPoint0", defaultValue: Self.point0Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint0")
			}
		}

		/// `point0` default value
		@objc public static let point0Default = CGPoint(x: 150.0, y: 150.0)

		// MARK: - point1 (inputPoint1)

		/// The x and y position that defines the center of the circle at the other end of the lozenge.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint1`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 350.0, y: 350.0)`
		@objc public var point1: CGPoint {
			get {
				self.cgPointValue(forKey: "inputPoint1", defaultValue: Self.point1Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint1")
			}
		}

		/// `point1` default value
		@objc public static let point1Default = CGPoint(x: 350.0, y: 150.0)

		// MARK: - radius (inputRadius)

		/// The radius of the lozenge. The larger the radius, the wider the extent of the distortion.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `100.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: GlassLozenge.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 100.0

		/// `radius` range definition
		public static let radiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - refraction (inputRefraction)

		/// The refraction of the glass.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRefraction`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.7`
		@objc public var refraction: Double {
			get {
				self.doubleValue(forKey: "inputRefraction", defaultValue: Self.refractionDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: GlassLozenge.refractionRange, forKey: "inputRefraction")
			}
		}

		/// `refraction` default value
		@objc public static let refractionDefault: Double = 1.7

		/// `refraction` range definition
		public static let refractionRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - point0: The x and y position that defines the center of the circle at one end of the lozenge.
		///   - point1: The x and y position that defines the center of the circle at the other end of the lozenge.
		///   - radius: The radius of the lozenge. The larger the radius, the wider the extent of the distortion.
		///   - refraction: The refraction of the glass.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			point0: CGPoint = GlassLozenge.point0Default,
			point1: CGPoint = GlassLozenge.point1Default,
			radius: Double = GlassLozenge.radiusDefault,
			refraction: Double = GlassLozenge.refractionDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.point0 = point0
			self.point1 = point1
			self.radius = radius
			self.refraction = refraction
		}
	}
}

@available(macOS 10.4, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Glass Lozenge' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - point0: The x and y position that defines the center of the circle at one end of the lozenge.
	///   - point1: The x and y position that defines the center of the circle at the other end of the lozenge.
	///   - radius: The radius of the lozenge. The larger the radius, the wider the extent of the distortion. (0.0...)
	///   - refraction: The refraction of the glass. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Creates a lozenge-shaped lens and distorts the portion of the image over which the lens is placed.
	///
	/// **Categories**: BuiltIn, DistortionEffect, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIGlassLozenge Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassLozenge)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGlassLozenge/)
	@inlinable func applyingGlassLozenge(
		point0: CGPoint = CIFF.GlassLozenge.point0Default,
		point1: CGPoint = CIFF.GlassLozenge.point1Default,
		radius: Double = CIFF.GlassLozenge.radiusDefault,
		refraction: Double = CIFF.GlassLozenge.refractionDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.GlassLozenge(
			inputImage: self,
			point0: point0,
			point1: point1,
			radius: radius,
			refraction: refraction
		)?.outputImage ?? CIImage.empty()
	}
}
