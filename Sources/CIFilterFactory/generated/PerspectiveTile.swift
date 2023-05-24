//
//  PerspectiveTile.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Perspective Tile
	///
	/// Applies a perspective transform to an image and then tiles the result.
	///
	/// **CIFilter Name**
	/// - CIPerspectiveTile
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
	/// - [CIPerspectiveTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTile)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPerspectiveTile/)
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFPerspectiveTile) class PerspectiveTile: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIPerspectiveTile")
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

		// MARK: - topLeft (inputTopLeft)

		/// The top left coordinate of a tile.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTopLeft`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 118.0, y: 118.0)`
		@objc public var topLeft: CGPoint {
			get {
				self.cgPointValue(forKey: "inputTopLeft", defaultValue: Self.topLeftDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTopLeft")
			}
		}

		/// `topLeft` default value
		@objc public static let topLeftDefault = CGPoint(x: 118.0, y: 484.0)

		// MARK: - topRight (inputTopRight)

		/// The top right coordinate of a tile.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTopRight`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 646.0, y: 646.0)`
		@objc public var topRight: CGPoint {
			get {
				self.cgPointValue(forKey: "inputTopRight", defaultValue: Self.topRightDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTopRight")
			}
		}

		/// `topRight` default value
		@objc public static let topRightDefault = CGPoint(x: 646.0, y: 507.0)

		// MARK: - bottomRight (inputBottomRight)

		/// The bottom right coordinate of a tile.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBottomRight`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 548.0, y: 548.0)`
		@objc public var bottomRight: CGPoint {
			get {
				self.cgPointValue(forKey: "inputBottomRight", defaultValue: Self.bottomRightDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBottomRight")
			}
		}

		/// `bottomRight` default value
		@objc public static let bottomRightDefault = CGPoint(x: 548.0, y: 140.0)

		// MARK: - bottomLeft (inputBottomLeft)

		/// The bottom left coordinate of a tile.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBottomLeft`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 155.0, y: 155.0)`
		@objc public var bottomLeft: CGPoint {
			get {
				self.cgPointValue(forKey: "inputBottomLeft", defaultValue: Self.bottomLeftDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBottomLeft")
			}
		}

		/// `bottomLeft` default value
		@objc public static let bottomLeftDefault = CGPoint(x: 155.0, y: 153.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - topLeft: The top left coordinate of a tile.
		///   - topRight: The top right coordinate of a tile.
		///   - bottomRight: The bottom right coordinate of a tile.
		///   - bottomLeft: The bottom left coordinate of a tile.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			topLeft: CGPoint = PerspectiveTile.topLeftDefault,
			topRight: CGPoint = PerspectiveTile.topRightDefault,
			bottomRight: CGPoint = PerspectiveTile.bottomRightDefault,
			bottomLeft: CGPoint = PerspectiveTile.bottomLeftDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.topLeft = topLeft
			self.topRight = topRight
			self.bottomRight = bottomRight
			self.bottomLeft = bottomLeft
		}
	}
}

@available(macOS 10.4, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Perspective Tile' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - topLeft: The top left coordinate of a tile.
	///   - topRight: The top right coordinate of a tile.
	///   - bottomRight: The bottom right coordinate of a tile.
	///   - bottomLeft: The bottom left coordinate of a tile.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Applies a perspective transform to an image and then tiles the result.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, TileEffect, Video
	///
	/// **Documentation Links**
	/// - [CIPerspectiveTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTile)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPerspectiveTile/)
	@inlinable func applyingPerspectiveTile(
		topLeft: CGPoint = CIFF.PerspectiveTile.topLeftDefault,
		topRight: CGPoint = CIFF.PerspectiveTile.topRightDefault,
		bottomRight: CGPoint = CIFF.PerspectiveTile.bottomRightDefault,
		bottomLeft: CGPoint = CIFF.PerspectiveTile.bottomLeftDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.PerspectiveTile(
			inputImage: self,
			topLeft: topLeft,
			topRight: topRight,
			bottomRight: bottomRight,
			bottomLeft: bottomLeft
		)?.outputImage ?? CIImage.empty()
	}
}
