//
//  CIPerspectiveTransformWithExtent.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, tvOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Perspective Transform with Extent
	///
	/// Alters the geometry of an image to simulate the observer changing viewing position. You can use the perspective filter to skew an image.
	///
	/// **Links**
	///
	/// - [CIPerspectiveTransformWithExtent Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTransformWithExtent)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciperspectivetransformwithextent?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPerspectiveTransformWithExtent/)
	///
	@objc(CIFilterFactory_PerspectiveTransformWithExtent) class PerspectiveTransformWithExtent: FilterCore {
		@objc public init?() {
			super.init(name: "CIPerspectiveTransformWithExtent")
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

		// MARK: - extent (inputExtent)

		///
		/// A rectangle that defines the extent of the effect.
		///
		///   - Attribute key: `inputExtent`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypeRectangle`
		///   - Default value: `[0 0 300 300]`
		@objc public var extent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extent_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// extent default value
		@objc public static let extent_default = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0)

		// MARK: - topLeft (inputTopLeft)

		///
		/// No Description
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
		/// No Description
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
		/// No Description
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
		/// No Description
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

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			extent: CGRect = PerspectiveTransformWithExtent.extent_default,
			topLeft: CGPoint = PerspectiveTransformWithExtent.topLeft_default,
			topRight: CGPoint = PerspectiveTransformWithExtent.topRight_default,
			bottomRight: CGPoint = PerspectiveTransformWithExtent.bottomRight_default,
			bottomLeft: CGPoint = PerspectiveTransformWithExtent.bottomLeft_default
		) {
			self.init()

			self.image = image
			self.extent = extent
			self.topLeft = topLeft
			self.topRight = topRight
			self.bottomRight = bottomRight
			self.bottomLeft = bottomLeft
		}
	}
}
