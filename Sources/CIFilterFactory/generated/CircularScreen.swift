//
//  CircularScreen.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Circular Screen
	///
	/// Simulates a circular-shaped halftone screen.
	///
	/// **Links**
	///
	/// - [CICircularScreen Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircularScreen)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicircularscreen?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICircularScreen/)
	///
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFCircularScreen) class CircularScreen: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CICircularScreen")
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

		// MARK: - center (inputCenter)

		/// The x and y position to use as the center of the circular screen pattern
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[150 150]`
		@objc public var center: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputCenter", defaultValue: Self.centerDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// `center` default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - width (inputWidth)

		/// The distance between each circle in the pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `6`
		/// - Minimum value: `1.0`
		@objc public var width: Double {
			get {
				let number = self.filter.value(forKey: "inputWidth") as? NSNumber
				return number?.doubleValue ?? Self.widthDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: CircularScreen.widthRange)
				self.filter.setValue(number, forKey: "inputWidth")
			}
		}

		/// `width` default value
		@objc public static let widthDefault: Double = 6

		/// `width` range definition
		public static let widthRange: PartialRangeFrom<Double> = Double(1.0)...

		// MARK: - sharpness (inputSharpness)

		/// The sharpness of the circles. The larger the value, the sharper the circles.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputSharpness`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.7`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var sharpness: Double {
			get {
				let number = self.filter.value(forKey: "inputSharpness") as? NSNumber
				return number?.doubleValue ?? Self.sharpnessDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: CircularScreen.sharpnessRange)
				self.filter.setValue(number, forKey: "inputSharpness")
			}
		}

		/// `sharpness` default value
		@objc public static let sharpnessDefault: Double = 0.7

		/// `sharpness` range definition
		public static let sharpnessRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			center: CGPoint = CircularScreen.centerDefault,
			width: Double = 6,
			sharpness: Double = 0.7
		) {
			self.init()

			self.image = image
			self.center = center
			self.width = width
			self.sharpness = sharpness
		}
	}
}
