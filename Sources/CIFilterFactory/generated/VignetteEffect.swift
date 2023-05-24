//
//  VignetteEffect.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Vignette Effect
	///
	/// Applies a vignette shading to the corners of an image.
	///
	/// **CIFilter Name**
	/// - CIVignetteEffect
	///
	/// **Availability**
	/// - macOS 10.9, iOS 7, tvOS 7
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorEffect (*CICategoryColorEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIVignetteEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignetteEffect)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIVignetteEffect/)
	@available(macOS 10.9, iOS 7, tvOS 7, *)
	@objc(CIFFVignetteEffect) class VignetteEffect: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIVignetteEffect")
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

		// MARK: - radius (inputRadius)

		/// The distance from the center of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `150.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: VignetteEffect.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 150.0

		/// `radius` range definition
		public static let radiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - intensity (inputIntensity)

		/// The intensity of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputIntensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `-1.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `1.0`
		@objc public var intensity: Double {
			get {
				self.doubleValue(forKey: "inputIntensity", defaultValue: Self.intensityDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: VignetteEffect.intensityRange, forKey: "inputIntensity")
			}
		}

		/// `intensity` default value
		@objc public static let intensityDefault: Double = 1.0

		/// `intensity` range definition
		public static let intensityRange: ClosedRange<Double> = -1.0 ... 1.0

		// MARK: - falloff (inputFalloff)

		/// The falloff of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFalloff`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.5`
		@objc public var falloff: Double {
			get {
				self.doubleValue(forKey: "inputFalloff", defaultValue: Self.falloffDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: VignetteEffect.falloffRange, forKey: "inputFalloff")
			}
		}

		/// `falloff` default value
		@objc public static let falloffDefault: Double = 0.5

		/// `falloff` range definition
		public static let falloffRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - radius: The distance from the center of the effect.
		///   - intensity: The intensity of the effect.
		///   - falloff: The falloff of the effect.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			center: CGPoint = VignetteEffect.centerDefault,
			radius: Double = VignetteEffect.radiusDefault,
			intensity: Double = VignetteEffect.intensityDefault,
			falloff: Double = VignetteEffect.falloffDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.center = center
			self.radius = radius
			self.intensity = intensity
			self.falloff = falloff
		}
	}
}

@available(macOS 10.9, iOS 7, tvOS 7, *)
public extension CIImage {
	/// Apply the 'Vignette Effect' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - radius: The distance from the center of the effect. (0.0...)
	///   - intensity: The intensity of the effect. (-1.0...1.0)
	///   - falloff: The falloff of the effect. (0.0...1.0)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Applies a vignette shading to the corners of an image.
	///
	/// **Categories**: BuiltIn, ColorEffect, HighDynamicRange, Interlaced, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIVignetteEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignetteEffect)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIVignetteEffect/)
	@inlinable func applyingVignetteEffect(
		center: CGPoint = CIFF.VignetteEffect.centerDefault,
		radius: Double = CIFF.VignetteEffect.radiusDefault,
		intensity: Double = CIFF.VignetteEffect.intensityDefault,
		falloff: Double = CIFF.VignetteEffect.falloffDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.VignetteEffect(
			inputImage: self,
			center: center,
			radius: radius,
			intensity: intensity,
			falloff: falloff
		)?.outputImage ?? CIImage.empty()
	}
}
