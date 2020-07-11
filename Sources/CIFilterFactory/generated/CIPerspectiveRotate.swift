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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

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
	@objc(CIFilterFactory_CIPerspectiveRotate) class CIPerspectiveRotate: FilterCommon {
		@objc public init?() {
			super.init(name: "CIPerspectiveRotate")
		}

		// MARK: - inputImage

		///
		/// The image to process.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputFocalLength

		///
		/// 35mm equivalent focal length of the input image.
		///
		@objc public var inputFocalLength: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFocalLength") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputFocalLength")
			}
		}

		// MARK: - inputPitch

		///
		/// Pitch angle in radians.
		///
		@objc public var inputPitch: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPitch") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPitch")
			}
		}

		// MARK: - inputYaw

		///
		/// Yaw angle in radians.
		///
		@objc public var inputYaw: NSNumber? {
			get {
				return self.filter.value(forKey: "inputYaw") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputYaw")
			}
		}

		// MARK: - inputRoll

		///
		/// Roll angle in radians.
		///
		@objc public var inputRoll: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRoll") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRoll")
			}
		}
	}
}
