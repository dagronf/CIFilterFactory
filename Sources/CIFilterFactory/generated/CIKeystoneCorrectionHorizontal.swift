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

@available(macOS 10.15, iOS 13, tvOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Horizontal Keystone Correction
	///
	/// Apply horizontal keystone correction to an image with guides
	///
	/// **Links**
	///
	/// - [CIKeystoneCorrectionHorizontal Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKeystoneCorrectionHorizontal)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cikeystonecorrectionhorizontal?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIKeystoneCorrectionHorizontal/)
	///
	@objc(CIFilterFactory_KeystoneCorrectionHorizontal) class KeystoneCorrectionHorizontal: FilterCore {
		@objc public init?() {
			super.init(name: "CIKeystoneCorrectionHorizontal")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// The image to process.
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

		// MARK: - focalLength (inputFocalLength)

		///
		/// 35mm equivalent focal length of the input image.
		///
		///   - Attribute key: `inputFocalLength`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `28`
		@objc public var focalLength: NSNumber? {
			get {
				return self.keyedValue("inputFocalLength")
			}
			set {
				self.setKeyedValue(newValue, for: "inputFocalLength")
			}
		}

		// MARK: - topLeft (inputTopLeft)

		///
		/// The top left coordinate of the guide.
		///
		///   - Attribute key: `inputTopLeft`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		@objc public var topLeft: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputTopLeft", defaultValue: Self.topLeft_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTopLeft")
			}
		}

		/// topLeft default value
		@objc public static let topLeft_default = CGPoint(x: 0.0, y: 0.0)

		// MARK: - topRight (inputTopRight)

		///
		/// The top right coordinate of the guide.
		///
		///   - Attribute key: `inputTopRight`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		@objc public var topRight: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputTopRight", defaultValue: Self.topRight_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTopRight")
			}
		}

		/// topRight default value
		@objc public static let topRight_default = CGPoint(x: 0.0, y: 0.0)

		// MARK: - bottomRight (inputBottomRight)

		///
		/// The bottom right coordinate of the guide.
		///
		///   - Attribute key: `inputBottomRight`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		@objc public var bottomRight: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputBottomRight", defaultValue: Self.bottomRight_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBottomRight")
			}
		}

		/// bottomRight default value
		@objc public static let bottomRight_default = CGPoint(x: 0.0, y: 0.0)

		// MARK: - bottomLeft (inputBottomLeft)

		///
		/// The bottom left coordinate of the guide.
		///
		///   - Attribute key: `inputBottomLeft`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		@objc public var bottomLeft: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputBottomLeft", defaultValue: Self.bottomLeft_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBottomLeft")
			}
		}

		/// bottomLeft default value
		@objc public static let bottomLeft_default = CGPoint(x: 0.0, y: 0.0)

		// MARK: - Additional Outputs

		@objc public var outputRotationFilter: Any? {
			return self.filter.value(forKey: "outputRotationFilter")
		}

		@objc public var outputTransform: Any? {
			return self.filter.value(forKey: "outputTransform")
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			focalLength: NSNumber = 28,
			topLeft: CGPoint,
			topRight: CGPoint,
			bottomRight: CGPoint,
			bottomLeft: CGPoint
		) {
			self.init()

			self.image = image
			self.focalLength = focalLength
			self.topLeft = topLeft
			self.topRight = topRight
			self.bottomRight = bottomRight
			self.bottomLeft = bottomLeft
		}
	}
}
