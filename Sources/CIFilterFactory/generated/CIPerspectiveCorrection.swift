//
//  CIPerspectiveCorrection.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.10, iOS 8, tvOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Perspective Correction
	///
	/// Apply a perspective correction to an image.
	///
	/// **Links**
	///
	/// - [CIPerspectiveCorrection Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveCorrection)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciperspectivecorrection?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPerspectiveCorrection/)
	///
	@objc(CIFilterFactory_PerspectiveCorrection) class PerspectiveCorrection: FilterCore {
		@objc public init?() {
			super.init(name: "CIPerspectiveCorrection")
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

		// MARK: - topLeft (inputTopLeft)

		///
		/// The top left coordinate to be perspective corrected.
		///
		///   - Attribute key: `inputTopLeft`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[118 484]`
		@objc public var topLeft: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputTopLeft", defaultValue: Self.topLeft_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTopLeft")
			}
		}

		/// topLeft default value
		@objc public static let topLeft_default = CGPoint(x: 118.0, y: 484.0)

		// MARK: - topRight (inputTopRight)

		///
		/// The top right coordinate to be perspective corrected.
		///
		///   - Attribute key: `inputTopRight`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[646 507]`
		@objc public var topRight: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputTopRight", defaultValue: Self.topRight_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTopRight")
			}
		}

		/// topRight default value
		@objc public static let topRight_default = CGPoint(x: 646.0, y: 507.0)

		// MARK: - bottomRight (inputBottomRight)

		///
		/// The bottom right coordinate to be perspective corrected.
		///
		///   - Attribute key: `inputBottomRight`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[548 140]`
		@objc public var bottomRight: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputBottomRight", defaultValue: Self.bottomRight_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBottomRight")
			}
		}

		/// bottomRight default value
		@objc public static let bottomRight_default = CGPoint(x: 548.0, y: 140.0)

		// MARK: - bottomLeft (inputBottomLeft)

		///
		/// The bottom left coordinate to be perspective corrected.
		///
		///   - Attribute key: `inputBottomLeft`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[155 153]`
		@objc public var bottomLeft: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputBottomLeft", defaultValue: Self.bottomLeft_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBottomLeft")
			}
		}

		/// bottomLeft default value
		@objc public static let bottomLeft_default = CGPoint(x: 155.0, y: 153.0)

		// MARK: - crop (inputCrop)

		///
		/// No Description
		///
		///   - Attribute key: `inputCrop`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeBoolean`
		///   - Default value: `1`
		@objc public var crop: NSNumber? {
			get {
				return self.keyedValue("inputCrop")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCrop")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			topLeft: CGPoint = PerspectiveCorrection.topLeft_default,
			topRight: CGPoint = PerspectiveCorrection.topRight_default,
			bottomRight: CGPoint = PerspectiveCorrection.bottomRight_default,
			bottomLeft: CGPoint = PerspectiveCorrection.bottomLeft_default,
			crop: NSNumber = 1
		) {
			self.init()

			self.image = image
			self.topLeft = topLeft
			self.topRight = topRight
			self.bottomRight = bottomRight
			self.bottomLeft = bottomLeft
			self.crop = crop
		}
	}
}
