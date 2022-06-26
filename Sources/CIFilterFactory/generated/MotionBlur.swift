//
//  MotionBlur.swift  (AUTOMATICALLY GENERATED FILE)
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

@objc public extension CIFF {
	/// Motion Blur
	///
	/// Blurs an image to simulate the effect of using a camera that moves a specified angle and distance while capturing the image.
	///
	/// **CIFilter Name**
	/// - CIMotionBlur
	///
	/// **Availability**
	/// - macOS 10.4, iOS 8.3, tvOS 8.3
	///
	/// **Categories**
	/// - CICategoryBlur
	/// - CICategoryBuiltIn
	/// - CICategoryHighDynamicRange
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIMotionBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMotionBlur)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cimotionblur?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIMotionBlur/)
	///
	@available(macOS 10.4, iOS 8.3, tvOS 8.3, *)
	@objc(CIFFMotionBlur) class MotionBlur: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIMotionBlur")
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

		// MARK: - radius (inputRadius)

		/// The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `20.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: MotionBlur.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 20.0

		/// `radius` range definition
		public static let radiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - angle (inputAngle)

		/// The angle in radians of the motion determines which direction the blur smears.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAngle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default Value: `0.0`
		@objc public var angle: Double {
			get {
				self.doubleValue(forKey: "inputAngle", defaultValue: Self.angleDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputAngle")
			}
		}

		/// `angle` default value
		@objc public static let angleDefault: Double = 0.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			radius: Double = MotionBlur.radiusDefault,
			angle: Double = MotionBlur.angleDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.radius = radius
			self.angle = angle
		}
	}
}
