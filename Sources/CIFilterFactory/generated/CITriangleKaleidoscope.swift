//
//  CITriangleKaleidoscope.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.10, iOS 6, tvOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Triangle Kaleidoscope
	///
	/// Maps a triangular portion of image to a triangular area and then generates a kaleidoscope effect.
	///
	/// **Links**
	///
	/// - [CITriangleKaleidoscope Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITriangleKaleidoscope)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/citrianglekaleidoscope?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CITriangleKaleidoscope/)
	///
	@objc(CIFilterFactory_TriangleKaleidoscope) class TriangleKaleidoscope: FilterCore {
		@objc public init?() {
			super.init(name: "CITriangleKaleidoscope")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// Input image to generate kaleidoscope effect from.
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

		// MARK: - point (inputPoint)

		///
		/// The x and y position to use as the center of the triangular area in the input image.
		///
		///   - Attribute key: `inputPoint`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[150 150]`
		@objc public var point: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint", defaultValue: Self.point_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint")
			}
		}

		/// point default value
		@objc public static let point_default = CGPoint(x: 150.0, y: 150.0)

		// MARK: - size (inputSize)

		///
		/// The size in pixels of the triangle.
		///
		///   - Attribute key: `inputSize`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `700`
		@objc public var size: NSNumber? {
			get {
				return self.keyedValue("inputSize")
			}
			set {
				self.setKeyedValue(newValue, for: "inputSize")
			}
		}

		// MARK: - rotation (inputRotation)

		///
		/// Rotation angle of the triangle.
		///
		///   - Attribute key: `inputRotation`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `5.924285296593801`
		@objc public var rotation: NSNumber? {
			get {
				return self.keyedValue("inputRotation")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRotation")
			}
		}

		// MARK: - decay (inputDecay)

		///
		/// The decay determines how fast the color fades from the center triangle.
		///
		///   - Attribute key: `inputDecay`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.85`
		@objc public var decay: NSNumber? {
			get {
				return self.keyedValue("inputDecay")
			}
			set {
				self.setKeyedValue(newValue, for: "inputDecay")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			point: CGPoint = TriangleKaleidoscope.point_default,
			size: NSNumber = 700,
			rotation: NSNumber = 5.924285296593801,
			decay: NSNumber = 0.85
		) {
			self.init()

			self.image = image
			self.point = point
			self.size = size
			self.rotation = rotation
			self.decay = decay
		}
	}
}
