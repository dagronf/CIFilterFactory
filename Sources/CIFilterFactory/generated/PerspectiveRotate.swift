//
//  PerspectiveRotate.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Perspective Rotate
	///
	/// Apply a homogenous rotation transform to an image.
	///
	/// **CIFilter Name**
	/// - CIPerspectiveRotate
	///
	/// **Availability**
	/// - macOS 10.15, iOS 13, tvOS 13
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - GeometryAdjustment (*CICategoryGeometryAdjustment*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIPerspectiveRotate Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveRotate)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPerspectiveRotate/)
	/// **Additional output keys**
	/// - outputTransform
	///
	@available(macOS 10.15, iOS 13, tvOS 13, *)
	@objc(CIFFPerspectiveRotate) class PerspectiveRotate: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIPerspectiveRotate")
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

		// MARK: - focalLength (inputFocalLength)

		/// 35mm equivalent focal length of the input image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFocalLength`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `28.0`
		@objc public var focalLength: Double {
			get {
				self.doubleValue(forKey: "inputFocalLength", defaultValue: Self.focalLengthDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputFocalLength")
			}
		}

		/// `focalLength` default value
		@objc public static let focalLengthDefault: Double = 28.0

		// MARK: - pitch (inputPitch)

		/// Pitch angle in radians.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPitch`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `0.0`
		@objc public var pitch: Double {
			get {
				self.doubleValue(forKey: "inputPitch", defaultValue: Self.pitchDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputPitch")
			}
		}

		/// `pitch` default value
		@objc public static let pitchDefault: Double = 0.0

		// MARK: - yaw (inputYaw)

		/// Yaw angle in radians.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputYaw`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `0.0`
		@objc public var yaw: Double {
			get {
				self.doubleValue(forKey: "inputYaw", defaultValue: Self.yawDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputYaw")
			}
		}

		/// `yaw` default value
		@objc public static let yawDefault: Double = 0.0

		// MARK: - roll (inputRoll)

		/// Roll angle in radians.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRoll`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `0.0`
		@objc public var roll: Double {
			get {
				self.doubleValue(forKey: "inputRoll", defaultValue: Self.rollDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputRoll")
			}
		}

		/// `roll` default value
		@objc public static let rollDefault: Double = 0.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to process.
		///   - focalLength: 35mm equivalent focal length of the input image.
		///   - pitch: Pitch angle in radians.
		///   - yaw: Yaw angle in radians.
		///   - roll: Roll angle in radians.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			focalLength: Double = PerspectiveRotate.focalLengthDefault,
			pitch: Double = PerspectiveRotate.pitchDefault,
			yaw: Double = PerspectiveRotate.yawDefault,
			roll: Double = PerspectiveRotate.rollDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.focalLength = focalLength
			self.pitch = pitch
			self.yaw = yaw
			self.roll = roll
		}
	}
}

@available(macOS 10.15, iOS 13, tvOS 13, *)
public extension CIImage {
	/// Apply the 'Perspective Rotate' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - focalLength: 35mm equivalent focal length of the input image.
	///   - pitch: Pitch angle in radians.
	///   - yaw: Yaw angle in radians.
	///   - roll: Roll angle in radians.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Apply a homogenous rotation transform to an image.
	///
	/// **Categories**: BuiltIn, GeometryAdjustment, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIPerspectiveRotate Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveRotate)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPerspectiveRotate/)
	@inlinable func applyingPerspectiveRotate(
		focalLength: Double = CIFF.PerspectiveRotate.focalLengthDefault,
		pitch: Double = CIFF.PerspectiveRotate.pitchDefault,
		yaw: Double = CIFF.PerspectiveRotate.yawDefault,
		roll: Double = CIFF.PerspectiveRotate.rollDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.PerspectiveRotate(
			inputImage: self,
			focalLength: focalLength,
			pitch: pitch,
			yaw: yaw,
			roll: roll
		)?.outputImage ?? CIImage.empty()
	}
}
