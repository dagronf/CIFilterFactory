//
//  TriangleKaleidoscope.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Triangle Kaleidoscope
	///
	/// Maps a triangular portion of image to a triangular area and then generates a kaleidoscope effect.
	///
	/// **CIFilter Name**
	/// - CITriangleKaleidoscope
	///
	/// **Availability**
	/// - macOS 10.10, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - TileEffect (*CICategoryTileEffect*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CITriangleKaleidoscope Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITriangleKaleidoscope)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CITriangleKaleidoscope/)
	@available(macOS 10.10, iOS 6, tvOS 6, *)
	@objc(CIFFTriangleKaleidoscope) class TriangleKaleidoscope: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CITriangleKaleidoscope")
		}

		// MARK: - inputImage (inputImage)

		/// Input image to generate kaleidoscope effect from.
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

		// MARK: - point (inputPoint)

		/// The x and y position to use as the center of the triangular area in the input image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPoint`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var point: CGPoint {
			get {
				self.cgPointValue(forKey: "inputPoint", defaultValue: Self.pointDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint")
			}
		}

		/// `point` default value
		@objc public static let pointDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - size (inputSize)

		/// The size in pixels of the triangle.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSize`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `700.0`
		@objc public var size: Double {
			get {
				self.doubleValue(forKey: "inputSize", defaultValue: Self.sizeDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputSize")
			}
		}

		/// `size` default value
		@objc public static let sizeDefault: Double = 700.0

		// MARK: - rotation (inputRotation)

		/// Rotation angle in radians of the triangle.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRotation`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `5.924285296593801`
		@objc public var rotation: Double {
			get {
				self.doubleValue(forKey: "inputRotation", defaultValue: Self.rotationDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputRotation")
			}
		}

		/// `rotation` default value
		@objc public static let rotationDefault: Double = 5.924285296593801

		// MARK: - decay (inputDecay)

		/// The decay determines how fast the color fades from the center triangle.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputDecay`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `0.85`
		@objc public var decay: Double {
			get {
				self.doubleValue(forKey: "inputDecay", defaultValue: Self.decayDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputDecay")
			}
		}

		/// `decay` default value
		@objc public static let decayDefault: Double = 0.85

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: Input image to generate kaleidoscope effect from.
		///   - point: The x and y position to use as the center of the triangular area in the input image.
		///   - size: The size in pixels of the triangle.
		///   - rotation: Rotation angle in radians of the triangle.
		///   - decay: The decay determines how fast the color fades from the center triangle.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			point: CGPoint = TriangleKaleidoscope.pointDefault,
			size: Double = TriangleKaleidoscope.sizeDefault,
			rotation: Double = TriangleKaleidoscope.rotationDefault,
			decay: Double = TriangleKaleidoscope.decayDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.point = point
			self.size = size
			self.rotation = rotation
			self.decay = decay
		}
	}
}

@available(macOS 10.10, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Triangle Kaleidoscope' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - point: The x and y position to use as the center of the triangular area in the input image.
	///   - size: The size in pixels of the triangle.
	///   - rotation: Rotation angle in radians of the triangle.
	///   - decay: The decay determines how fast the color fades from the center triangle.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Maps a triangular portion of image to a triangular area and then generates a kaleidoscope effect.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, TileEffect, Video
	///
	/// **Documentation Links**
	/// - [CITriangleKaleidoscope Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITriangleKaleidoscope)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CITriangleKaleidoscope/)
	@inlinable func applyingTriangleKaleidoscope(
		point: CGPoint = CIFF.TriangleKaleidoscope.pointDefault,
		size: Double = CIFF.TriangleKaleidoscope.sizeDefault,
		rotation: Double = CIFF.TriangleKaleidoscope.rotationDefault,
		decay: Double = CIFF.TriangleKaleidoscope.decayDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.TriangleKaleidoscope(
			inputImage: self,
			point: point,
			size: size,
			rotation: rotation,
			decay: decay
		)?.outputImage ?? CIImage.empty()
	}
}
