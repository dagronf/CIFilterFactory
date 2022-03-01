//
//  CITwirlDistortion.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 5, tvOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Twirl Distortion
	///
	/// Rotates pixels around a point to give a twirling effect. You can specify the number of rotations as well as the center and radius of the effect.
	///
	/// **Links**
	///
	/// - [CITwirlDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITwirlDistortion)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/citwirldistortion?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CITwirlDistortion/)
	///
	@objc(CIFilterFactory_TwirlDistortion) class TwirlDistortion: FilterCore {
		@objc public init?() {
			super.init(name: "CITwirlDistortion")
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
		/// The center of the effect as x and y coordinates.
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

		// MARK: - radius (inputRadius)

		///
		/// The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `300`
		///   minValue: 0.0
		///
		public static let radius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: TwirlDistortion.radius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - angle (inputAngle)

		///
		/// The angle (in radians) of the twirl. Values can be positive or negative.
		///
		///   - Attribute key: `inputAngle`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `3.141592653589793`
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
			center: CGPoint = TwirlDistortion.center_default,
			radius: NSNumber = 300,
			angle: NSNumber = 3.141592653589793
		) {
			self.init()

			self.image = image
			self.center = center
			self.radius = radius
			self.angle = angle
		}
	}
}
