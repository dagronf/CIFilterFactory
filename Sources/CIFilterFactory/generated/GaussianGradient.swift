//
//  GaussianGradient.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Gaussian Gradient
	///
	/// Generates a gradient that varies from one color to another using a Gaussian distribution.
	///
	/// **CIFilter Name**
	/// - CIGaussianGradient
	///
	/// **Availability**
	/// - macOS 10.4, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Gradient (*CICategoryGradient*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIGaussianGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaussianGradient)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGaussianGradient/)
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFGaussianGradient) class GaussianGradient: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIGaussianGradient")
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

		/// The first color to use in the gradient.
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

		/// The second color to use in the gradient.
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

		// MARK: - radius (inputRadius)

		/// The radius of the Gaussian distribution.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `300.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: GaussianGradient.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 300.0

		/// `radius` range definition
		public static let radiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - color0: The first color to use in the gradient.
		///   - color1: The second color to use in the gradient.
		///   - radius: The radius of the Gaussian distribution.
		@objc public convenience init?(
			center: CGPoint = GaussianGradient.centerDefault,
			color0: CIColor,
			color1: CIColor,
			radius: Double = GaussianGradient.radiusDefault
		) {
			self.init()
			self.center = center
			self.color0 = color0
			self.color1 = color1
			self.radius = radius
		}
	}
}

@available(macOS 10.4, iOS 5, tvOS 5, *)
public extension CIImage {
	/// Create a new CIImage using the 'Gaussian Gradient' filter
	///
	/// - Parameters:
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - color0: The first color to use in the gradient.
	///   - color1: The second color to use in the gradient.
	///   - radius: The radius of the Gaussian distribution. (0.0...)
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generates a gradient that varies from one color to another using a Gaussian distribution.
	///
	/// **Categories**: BuiltIn, Gradient, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIGaussianGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaussianGradient)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGaussianGradient/)
	@inlinable static func createUsingGaussianGradient(
		center: CGPoint = CIFF.GaussianGradient.centerDefault,
		color0: CIColor,
		color1: CIColor,
		radius: Double = CIFF.GaussianGradient.radiusDefault
	) -> CIImage? {
		return CIFF.GaussianGradient(
			center: center,
			color0: color0,
			color1: color1,
			radius: radius
		)?.outputImage
	}
}
