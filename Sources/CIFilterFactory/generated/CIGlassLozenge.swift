//
//  CIGlassLozenge.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, tvOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Glass Lozenge
	///
	/// Creates a lozenge-shaped lens and distorts the portion of the image over which the lens is placed.
	///
	/// **Links**
	///
	/// - [CIGlassLozenge Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassLozenge)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciglasslozenge?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGlassLozenge/)
	///
	@objc(CIFilterFactory_GlassLozenge) class GlassLozenge: FilterCore {
		@objc public init?() {
			super.init(name: "CIGlassLozenge")
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

		// MARK: - point0 (inputPoint0)

		///
		/// The x and y position that defines the center of the circle at one end of the lozenge.
		///
		///   - Attribute key: `inputPoint0`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[150 150]`
		@objc public var point0: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint0", defaultValue: Self.point0_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint0")
			}
		}

		/// point0 default value
		@objc public static let point0_default = CGPoint(x: 150.0, y: 150.0)

		// MARK: - point1 (inputPoint1)

		///
		/// The x and y position that defines the center of the circle at the other end of the lozenge.
		///
		///   - Attribute key: `inputPoint1`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[350 150]`
		@objc public var point1: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint1", defaultValue: Self.point1_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint1")
			}
		}

		/// point1 default value
		@objc public static let point1_default = CGPoint(x: 350.0, y: 150.0)

		// MARK: - radius (inputRadius)

		///
		/// The radius of the lozenge. The larger the radius, the wider the extent of the distortion.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `100`
		///   minValue: 0.0
		///
		public static let radius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: GlassLozenge.radius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - refraction (inputRefraction)

		///
		/// The refraction of the glass.
		///
		///   - Attribute key: `inputRefraction`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1.7`
		///   minValue: 0.0
		///
		public static let refraction_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var refraction: NSNumber? {
			get {
				return self.keyedValue("inputRefraction")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: GlassLozenge.refraction_Range), forKey: "inputRefraction")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			point0: CGPoint = GlassLozenge.point0_default,
			point1: CGPoint = GlassLozenge.point1_default,
			radius: NSNumber = 100,
			refraction: NSNumber = 1.7
		) {
			self.init()

			self.image = image
			self.point0 = point0
			self.point1 = point1
			self.radius = radius
			self.refraction = refraction
		}
	}
}
