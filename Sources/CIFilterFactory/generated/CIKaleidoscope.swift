//
//  CIKaleidoscope.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, tvOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Kaleidoscope
	///
	/// Produces a kaleidoscopic image from a source image by applying 12-way symmetry.
	///
	/// **Links**
	///
	/// - [CIKaleidoscope Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKaleidoscope)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cikaleidoscope?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIKaleidoscope/)
	///
	@objc(CIFilterFactory_Kaleidoscope) class Kaleidoscope: FilterCore {
		@objc public init?() {
			super.init(name: "CIKaleidoscope")
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

		// MARK: - count (inputCount)

		///
		/// The number of reflections in the pattern.
		///
		///   - Attribute key: `inputCount`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `6`
		///   minValue: 1.0
		///
		public static let count_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var count: NSNumber? {
			get {
				return self.keyedValue("inputCount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: Kaleidoscope.count_Range), forKey: "inputCount")
			}
		}

		// MARK: - center (inputCenter)

		///
		/// The x and y position to use as the center of the effect
		///
		///   - Attribute key: `inputCenter`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[150 150]`
		@objc public var center: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputCenter", defaultValue: Self.center_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// center default value
		@objc public static let center_default = CGPoint(x: 150.0, y: 150.0)

		// MARK: - angle (inputAngle)

		///
		/// The angle of reflection.
		///
		///   - Attribute key: `inputAngle`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `0`
		@objc public var angle: NSNumber? {
			get {
				return self.keyedValue("inputAngle")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAngle")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			count: NSNumber = 6,
			center: CGPoint = Kaleidoscope.center_default,
			angle: NSNumber = 0
		) {
			self.init()

			self.image = image
			self.count = count
			self.center = center
			self.angle = angle
		}
	}
}
