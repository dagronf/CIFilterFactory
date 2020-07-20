//
//  CIPerspectiveRotate.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Perspective Rotate
	///
	/// Apply a homogenous rotation transform to an image.
	///
	/// **Links**
	///
	/// [CIPerspectiveRotate Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveRotate)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPerspectiveRotate/)
	///
	@objc(CIFilterFactory_CIPerspectiveRotate) class CIPerspectiveRotate: FilterCore {
		@objc public init?() {
			super.init(name: "CIPerspectiveRotate")
		}

		// MARK: - Inputs

		///
		/// The image to process.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// 35mm equivalent focal length of the input image.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  28
		@objc public dynamic var inputFocalLength: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFocalLength") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputFocalLength")
			}
		}

		///
		/// Pitch angle in radians.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  0
		@objc public dynamic var inputPitch: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPitch") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPitch")
			}
		}

		///
		/// Yaw angle in radians.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  0
		@objc public dynamic var inputYaw: NSNumber? {
			get {
				return self.filter.value(forKey: "inputYaw") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputYaw")
			}
		}

		///
		/// Roll angle in radians.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  0
		@objc public dynamic var inputRoll: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRoll") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRoll")
			}
		}

		// MARK: - Additional Outputs

		@objc public dynamic var outputTransform: Any? {
			return self.filter.value(forKey: "outputTransform")
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputFocalLength: NSNumber = 28,
			inputPitch: NSNumber = 0,
			inputYaw: NSNumber = 0,
			inputRoll: NSNumber = 0
		) {
			self.init()

			self.inputImage = inputImage
			self.inputFocalLength = inputFocalLength
			self.inputPitch = inputPitch
			self.inputYaw = inputYaw
			self.inputRoll = inputRoll
		}
	}
}
