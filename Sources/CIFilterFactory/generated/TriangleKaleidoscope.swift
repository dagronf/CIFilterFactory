//
//  TriangleKaleidoscope.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.10, iOS 6, tvOS 6, *)
@objc public extension CIFF {
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
	@available(macOS 10.10, iOS 6, tvOS 6, *)
	@objc(CIFFTriangleKaleidoscope) class TriangleKaleidoscope: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CITriangleKaleidoscope")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// Input image to generate kaleidoscope effect from.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
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
		/// - Default value: `[150 150]`
		@objc public var point: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputPoint", defaultValue: Self.pointDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputPoint")
			}
		}

		/// point default value
		@objc public static let pointDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - size (inputSize)

		/// The size in pixels of the triangle.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSize`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `700`
		@objc public var size: Double {
			get {
				let number = self.filter.value(forKey: "inputSize") as? NSNumber
				return number?.doubleValue ?? 700
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputSize")
			}
		}

		// MARK: - rotation (inputRotation)

		/// Rotation angle of the triangle.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRotation`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default value: `5.924285296593801`
		@objc public var rotation: Double {
			get {
				let number = self.filter.value(forKey: "inputRotation") as? NSNumber
				return number?.doubleValue ?? 5.924285296593801
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputRotation")
			}
		}

		// MARK: - decay (inputDecay)

		/// The decay determines how fast the color fades from the center triangle.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputDecay`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.85`
		@objc public var decay: Double {
			get {
				let number = self.filter.value(forKey: "inputDecay") as? NSNumber
				return number?.doubleValue ?? 0.85
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputDecay")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			point: CGPoint = TriangleKaleidoscope.pointDefault,
			size: Double = 700,
			rotation: Double = 5.924285296593801,
			decay: Double = 0.85
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
