//
//  AffineTransform.swift  (AUTOMATICALLY GENERATED FILE)
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

@objc public extension CIFF {
	/// Affine Transform
	///
	/// Applies an affine transformation to an image. You can scale, translate, or rotate the input image. You can also apply a combination of these operations.
	///
	/// **CIFilter Name**
	/// - CIAffineTransform
	///
	/// **Availability**
	/// - macOS 10.4, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryGeometryAdjustment
	/// - CICategoryHighDynamicRange
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIAffineTransform Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineTransform)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciaffinetransform?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAffineTransform/)
	///
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFAffineTransform) class AffineTransform: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIAffineTransform")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input for the effect.
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

		// MARK: - transform (inputTransform)

		/// A transform to apply to the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTransform`
		/// - Internal class: `NSAffineTransform`
		/// - Type: `CIAttributeTypeTransform`
		/// - Default Value: `CIFF.CIAffineTransform(m11: 1.0, m12: 0.0, m21: 0.0, m22: 1.0, tX: 0.0, tY: 0.0)`
		@objc public var transform: CIAffineTransform? {
			get {
				return CIAffineTransform(filter: self.filter, key: "inputTransform")
			}
			set {
				self.setKeyedValue(newValue?.embeddedValue, for: "inputTransform")
			}
		}

		/// `transform` default value
		@objc public static let transformDefault = CIFF.CIAffineTransform(m11: 1.0, m12: 0.0, m21: 0.0, m22: 1.0, tX: 0.0, tY: 0.0)

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			transform: CIAffineTransform = AffineTransform.transformDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.transform = transform
		}
	}
}
