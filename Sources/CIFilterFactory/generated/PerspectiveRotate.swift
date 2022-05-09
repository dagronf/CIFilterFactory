//
//  PerspectiveRotate.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.15, iOS 13, tvOS 13, *)
@objc public extension CIFF {
	///
	/// Perspective Rotate
	///
	/// Apply a homogenous rotation transform to an image.
	///
	/// **Availability**
	/// - macOS 10.15, iOS 13, tvOS 13
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryGeometryAdjustment
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIPerspectiveRotate Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveRotate)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciperspectiverotate?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPerspectiveRotate/)
	///
	/// **Additional output keys**
	/// - outputTransform
	///
	@available(macOS 10.15, iOS 13, tvOS 13, *)
	@objc(CIFFPerspectiveRotate) class PerspectiveRotate: Core {
		/// Create an instance of the filter
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

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			focalLength: Double = PerspectiveRotate.focalLengthDefault,
			pitch: Double = PerspectiveRotate.pitchDefault,
			yaw: Double = PerspectiveRotate.yawDefault,
			roll: Double = PerspectiveRotate.rollDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.focalLength = focalLength
			self.pitch = pitch
			self.yaw = yaw
			self.roll = roll
		}
	}
}
