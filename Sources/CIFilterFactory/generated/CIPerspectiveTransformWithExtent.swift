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

public extension CIFilter {
	@available(macOS 10.4, iOS 6, *)
	@inlinable @objc static func PerspectiveTransformWithExtent() -> CIFilterFactory.CIPerspectiveTransformWithExtent? {
		return CIFilterFactory.CIPerspectiveTransformWithExtent()
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Perspective Transform with Extent
	///
	/// Alters the geometry of an image to simulate the observer changing viewing position. You can use the perspective filter to skew an image.
	///
	/// **Links**
	///
	/// [CIPerspectiveTransformWithExtent Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTransformWithExtent)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPerspectiveTransformWithExtent/)
	///
	@objc(CIFilterFactory_CIPerspectiveTransformWithExtent) class CIPerspectiveTransformWithExtent: FilterCore {
		@objc public init?() {
			super.init(name: "CIPerspectiveTransformWithExtent")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
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
		/// A rectangle that defines the extent of the effect.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeRectangle
		///   Default:  [0 0 300 300]
		@objc public dynamic var inputExtent: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputExtent")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputExtent")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [118 484]
		@objc public dynamic var inputTopLeft: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputTopLeft")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputTopLeft")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [646 507]
		@objc public dynamic var inputTopRight: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputTopRight")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputTopRight")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [548 140]
		@objc public dynamic var inputBottomRight: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputBottomRight")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputBottomRight")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [155 153]
		@objc public dynamic var inputBottomLeft: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputBottomLeft")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputBottomLeft")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputExtent: CIFilterFactory.Rect = CIFilterFactory.Rect(x: 0.0, y: 0.0, width: 300.0, height: 300.0),
			inputTopLeft: CIFilterFactory.Point = CIFilterFactory.Point(x: 118.0, y: 484.0),
			inputTopRight: CIFilterFactory.Point = CIFilterFactory.Point(x: 646.0, y: 507.0),
			inputBottomRight: CIFilterFactory.Point = CIFilterFactory.Point(x: 548.0, y: 140.0),
			inputBottomLeft: CIFilterFactory.Point = CIFilterFactory.Point(x: 155.0, y: 153.0)
		) {
			self.init()

			self.inputImage = inputImage
			self.inputExtent = inputExtent
			self.inputTopLeft = inputTopLeft
			self.inputTopRight = inputTopRight
			self.inputBottomRight = inputBottomRight
			self.inputBottomLeft = inputBottomLeft
		}
	}
}
