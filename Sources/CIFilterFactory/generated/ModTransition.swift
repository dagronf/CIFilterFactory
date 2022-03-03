//
//  ModTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Mod
	///
	/// Transitions from one image to another by revealing the target image through irregularly shaped holes.
	///
	/// **Links**
	///
	/// - [CIModTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIModTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cimodtransition?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIModTransition/)
	///
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFModTransition) class ModTransition: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIModTransition")
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

		// MARK: - targetImage (inputTargetImage)

		/// The target image for a transition.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTargetImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var targetImage: CIImage? {
			get {
				return self.keyedValue("inputTargetImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputTargetImage")
			}
		}

		// MARK: - center (inputCenter)

		/// The x and y position to use as the center of the effect
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

		/// center default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - time (inputTime)

		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTime`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeTime`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var time: Double {
			get {
				let number = self.filter.value(forKey: "inputTime") as? NSNumber
				return number?.doubleValue ?? 0
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: ModTransition.timeRange)
				self.filter.setValue(number, forKey: "inputTime")
			}
		}

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - angle (inputAngle)

		/// The angle of the mod hole pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAngle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default value: `2`
		@objc public var angle: Double {
			get {
				let number = self.filter.value(forKey: "inputAngle") as? NSNumber
				return number?.doubleValue ?? 2
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputAngle")
			}
		}

		// MARK: - radius (inputRadius)

		/// The radius of the undistorted holes in the pattern.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `150`
		/// - Minimum value: `1.0`
		@objc public var radius: Double {
			get {
				let number = self.filter.value(forKey: "inputRadius") as? NSNumber
				return number?.doubleValue ?? 150
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: ModTransition.radiusRange)
				self.filter.setValue(number, forKey: "inputRadius")
			}
		}

		/// `radius` range definition
		public static let radiusRange: PartialRangeFrom<Double> = Double(1.0)...

		// MARK: - compression (inputCompression)

		/// The amount of stretching applied to the mod hole pattern. Holes in the center are not distorted as much as those at the edge of the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCompression`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `300`
		/// - Minimum value: `1.0`
		@objc public var compression: Double {
			get {
				let number = self.filter.value(forKey: "inputCompression") as? NSNumber
				return number?.doubleValue ?? 300
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: ModTransition.compressionRange)
				self.filter.setValue(number, forKey: "inputCompression")
			}
		}

		/// `compression` range definition
		public static let compressionRange: PartialRangeFrom<Double> = Double(1.0)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			center: CGPoint = ModTransition.centerDefault,
			time: Double = 0,
			angle: Double = 2,
			radius: Double = 150,
			compression: Double = 300
		) {
			self.init()

			self.image = image
			self.targetImage = targetImage
			self.center = center
			self.time = time
			self.angle = angle
			self.radius = radius
			self.compression = compression
		}
	}
}