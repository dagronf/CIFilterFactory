//
//  LightTunnel.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Light Tunnel Distortion
	///
	/// Light tunnel distortion.
	///
	/// **CIFilter Name**
	/// - CILightTunnel
	///
	/// **Availability**
	/// - macOS 10.10, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - DistortionEffect (*CICategoryDistortionEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CILightTunnel Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILightTunnel)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CILightTunnel/)
	@available(macOS 10.10, iOS 6, tvOS 6, *)
	@objc(CIFFLightTunnel) class LightTunnel: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CILightTunnel")
		}

		// MARK: - inputImage (inputImage)

		/// The image to process.
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

		// MARK: - rotation (inputRotation)

		/// Rotation angle in radians of the light tunnel.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRotation`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `0.0`
		@objc public var rotation: Double {
			get {
				self.doubleValue(forKey: "inputRotation", defaultValue: Self.rotationDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputRotation")
			}
		}

		/// `rotation` default value
		@objc public static let rotationDefault: Double = 0.0

		// MARK: - radius (inputRadius)

		/// Center radius of the light tunnel.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default Value: `100.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 100.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to process.
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - rotation: Rotation angle in radians of the light tunnel.
		///   - radius: Center radius of the light tunnel.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			center: CGPoint = LightTunnel.centerDefault,
			rotation: Double = LightTunnel.rotationDefault,
			radius: Double = LightTunnel.radiusDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.center = center
			self.rotation = rotation
			self.radius = radius
		}
	}
}

@available(macOS 10.10, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Light Tunnel Distortion' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - rotation: Rotation angle in radians of the light tunnel.
	///   - radius: Center radius of the light tunnel.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Light tunnel distortion.
	///
	/// **Categories**: BuiltIn, DistortionEffect, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CILightTunnel Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILightTunnel)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CILightTunnel/)
	@inlinable func applyingLightTunnel(
		center: CGPoint = CIFF.LightTunnel.centerDefault,
		rotation: Double = CIFF.LightTunnel.rotationDefault,
		radius: Double = CIFF.LightTunnel.radiusDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.LightTunnel(
			inputImage: self,
			center: center,
			rotation: rotation,
			radius: radius
		)?.outputImage ?? CIImage.empty()
	}
}
