//
//  CIKeystoneCorrectionHorizontal.swift  (AUTOMATICALLY GENERATED FILE)
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

public extension CIFilter {
	@available(macOS 10.15, iOS 13, *)
	@inlinable @objc static func KeystoneCorrectionHorizontal() -> CIFilterFactory.CIKeystoneCorrectionHorizontal? {
		return CIFilterFactory.CIKeystoneCorrectionHorizontal()
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Horizontal Keystone Correction
	///
	/// Apply horizontal keystone correction to an image with guides
	///
	/// **Links**
	///
	/// [CIKeystoneCorrectionHorizontal Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKeystoneCorrectionHorizontal)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIKeystoneCorrectionHorizontal/)
	///
	@objc(CIFilterFactory_CIKeystoneCorrectionHorizontal) class CIKeystoneCorrectionHorizontal: FilterCore {
		@objc public init?() {
			super.init(name: "CIKeystoneCorrectionHorizontal")
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
		/// The top left coordinate of the guide.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		@objc public dynamic var inputTopLeft: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputTopLeft")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputTopLeft")
			}
		}

		///
		/// The top right coordinate of the guide.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		@objc public dynamic var inputTopRight: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputTopRight")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputTopRight")
			}
		}

		///
		/// The bottom right coordinate of the guide.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		@objc public dynamic var inputBottomRight: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputBottomRight")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputBottomRight")
			}
		}

		///
		/// The bottom left coordinate of the guide.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		@objc public dynamic var inputBottomLeft: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputBottomLeft")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputBottomLeft")
			}
		}

		// MARK: - Additional Outputs

		@objc public dynamic var outputRotationFilter: Any? {
			return self.filter.value(forKey: "outputRotationFilter")
		}

		@objc public dynamic var outputTransform: Any? {
			return self.filter.value(forKey: "outputTransform")
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputFocalLength: NSNumber = 28,
			inputTopLeft: CIFilterFactory.Point,
			inputTopRight: CIFilterFactory.Point,
			inputBottomRight: CIFilterFactory.Point,
			inputBottomLeft: CIFilterFactory.Point
		) {
			self.init()

			self.inputImage = inputImage
			self.inputFocalLength = inputFocalLength
			self.inputTopLeft = inputTopLeft
			self.inputTopRight = inputTopRight
			self.inputBottomRight = inputBottomRight
			self.inputBottomLeft = inputBottomLeft
		}
	}
}
