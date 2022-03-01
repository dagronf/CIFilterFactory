//
//  CIBloom.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, tvOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Bloom
	///
	/// Softens edges and applies a pleasant glow to an image.
	///
	/// **Links**
	///
	/// - [CIBloom Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBloom)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cibloom?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBloom/)
	///
	@objc(CIFilterFactory_Bloom) class Bloom: FilterCore {
		@objc public init?() {
			super.init(name: "CIBloom")
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

		// MARK: - radius (inputRadius)

		///
		/// The radius determines how many pixels are used to create the effect. The larger the radius, the greater the effect.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `10`
		///   minValue: 0.0
		///
		public static let radius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: Bloom.radius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - intensity (inputIntensity)

		///
		/// The intensity of the effect. A value of 0.0 is no effect. A value of 1.0 is the maximum effect.
		///
		///   - Attribute key: `inputIntensity`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.5`
		///   minValue: 0.0
		///
		public static let intensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var intensity: NSNumber? {
			get {
				return self.keyedValue("inputIntensity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: Bloom.intensity_Range), forKey: "inputIntensity")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			radius: NSNumber = 10,
			intensity: NSNumber = 0.5
		) {
			self.init()

			self.image = image
			self.radius = radius
			self.intensity = intensity
		}
	}
}
