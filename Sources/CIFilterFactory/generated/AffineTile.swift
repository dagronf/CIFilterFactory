//
//  AffineTile.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Affine Tile
	///
	/// Applies an affine transformation to an image and then tiles the transformed image.
	///
	/// **CIFilter Name**
	/// - CIAffineTile
	///
	/// **Availability**
	/// - macOS 10.4, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - TileEffect (*CICategoryTileEffect*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIAffineTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineTile)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAffineTile/)
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFAffineTile) class AffineTile: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIAffineTile")
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

		/// The transform to apply to the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTransform`
		/// - Internal class: `NSAffineTransform`
		/// - Type: `CIAttributeTypeTransform`
		/// - Default Value: `CIFF.CIAffineTransform(m11: 0.4, m12: 0.0, m21: 0.0, m22: 0.4, tX: 0.0, tY: 0.0)`
		@objc public var transform: CIAffineTransform? {
			get {
				return CIAffineTransform(filter: self.filter, key: "inputTransform")
			}
			set {
				self.setKeyedValue(newValue?.embeddedValue, for: "inputTransform")
			}
		}

		/// `transform` default value
		@objc public static let transformDefault = CIFF.CIAffineTransform(m11: 0.4, m12: 0.0, m21: 0.0, m22: 0.4, tX: 0.0, tY: 0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - transform: The transform to apply to the image.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			transform: CIAffineTransform = AffineTile.transformDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.transform = transform
		}
	}
}

@available(macOS 10.4, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Affine Tile' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - transform: The transform to apply to the image.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Applies an affine transformation to an image and then tiles the transformed image.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, TileEffect, Video
	///
	/// **Documentation Links**
	/// - [CIAffineTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineTile)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAffineTile/)
	@inlinable func applyingAffineTile(
		transform: CIFF.CIAffineTransform = CIFF.AffineTile.transformDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.AffineTile(
			inputImage: self,
			transform: transform
		)?.outputImage ?? CIImage.empty()
	}
}
