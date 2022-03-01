//
//  CICMYKHalftone.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// CMYK Halftone
	///
	/// Creates a color, halftoned rendition of the source image, using cyan, magenta, yellow, and black inks over a white page.
	///
	/// **Links**
	///
	/// - [CICMYKHalftone Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICMYKHalftone)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicmykhalftone?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICMYKHalftone/)
	///
	@objc(CIFilterFactory_CMYKHalftone) class CMYKHalftone: FilterCore {
		@objc public init?() {
			super.init(name: "CICMYKHalftone")
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

		// MARK: - center (inputCenter)

		///
		/// The x and y position to use as the center of the halftone pattern
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

		// MARK: - width (inputWidth)

		///
		/// The distance between dots in the pattern.
		///
		///   - Attribute key: `inputWidth`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `6`
		///   minValue: -2.0
		///
		public static let width_Range: PartialRangeFrom<Float> = Float(-2.0)...
		@objc public var width: NSNumber? {
			get {
				return self.keyedValue("inputWidth")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CMYKHalftone.width_Range), forKey: "inputWidth")
			}
		}

		// MARK: - angle (inputAngle)

		///
		/// The angle of the pattern.
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

		// MARK: - sharpness (inputSharpness)

		///
		/// The sharpness of the pattern. The larger the value, the sharper the pattern.
		///
		///   - Attribute key: `inputSharpness`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `0.7`
		///   minValue: 0.0
		///
		public static let sharpness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var sharpness: NSNumber? {
			get {
				return self.keyedValue("inputSharpness")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CMYKHalftone.sharpness_Range), forKey: "inputSharpness")
			}
		}

		// MARK: - gCR (inputGCR)

		///
		/// The gray component replacement value. The value can vary from 0.0 (none) to 1.0.
		///
		///   - Attribute key: `inputGCR`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///
		public static let gCR_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var gCR: NSNumber? {
			get {
				return self.keyedValue("inputGCR")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CMYKHalftone.gCR_Range), forKey: "inputGCR")
			}
		}

		// MARK: - uCR (inputUCR)

		///
		/// The under color removal value. The value can vary from 0.0 to 1.0.
		///
		///   - Attribute key: `inputUCR`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.5`
		///   minValue: 0.0
		///
		public static let uCR_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var uCR: NSNumber? {
			get {
				return self.keyedValue("inputUCR")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CMYKHalftone.uCR_Range), forKey: "inputUCR")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			center: CGPoint = CMYKHalftone.center_default,
			width: NSNumber = 6,
			angle: NSNumber = 0,
			sharpness: NSNumber = 0.7,
			gCR: NSNumber = 1,
			uCR: NSNumber = 0.5
		) {
			self.init()

			self.image = image
			self.center = center
			self.width = width
			self.angle = angle
			self.sharpness = sharpness
			self.gCR = gCR
			self.uCR = uCR
		}
	}
}
