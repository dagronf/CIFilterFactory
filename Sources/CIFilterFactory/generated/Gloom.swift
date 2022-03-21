//
//  Gloom.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, tvOS 6, *)
@objc public extension CIFF {
	///
	/// Gloom
	///
	/// Dulls the highlights of an image.
	///
	/// **Links**
	///
	/// - [CIGloom Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGloom)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cigloom?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGloom/)
	///
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFGloom) class Gloom: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIGloom")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
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

		// MARK: - radius (inputRadius)

		/// The radius determines how many pixels are used to create the effect. The larger the radius, the greater the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `10`
		/// - Minimum value: `0.0`
		@objc public var radius: Double {
			get {
				let number = self.filter.value(forKey: "inputRadius") as? NSNumber
				return number?.doubleValue ?? Self.radiusDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: Gloom.radiusRange)
				self.filter.setValue(number, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 10

		/// `radius` range definition
		public static let radiusRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - intensity (inputIntensity)

		/// The intensity of the effect. A value of 0.0 is no effect. A value of 1.0 is the maximum effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputIntensity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.5`
		/// - Minimum value: `0.0`
		@objc public var intensity: Double {
			get {
				let number = self.filter.value(forKey: "inputIntensity") as? NSNumber
				return number?.doubleValue ?? Self.intensityDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: Gloom.intensityRange)
				self.filter.setValue(number, forKey: "inputIntensity")
			}
		}

		/// `intensity` default value
		@objc public static let intensityDefault: Double = 0.5

		/// `intensity` range definition
		public static let intensityRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			radius: Double = 10,
			intensity: Double = 0.5
		) {
			self.init()

			self.image = image
			self.radius = radius
			self.intensity = intensity
		}
	}
}
