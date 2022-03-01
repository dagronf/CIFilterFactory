//
//  CIModTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	@objc(CIFilterFactory_ModTransition) class ModTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIModTransition")
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

		// MARK: - targetImage (inputTargetImage)

		///
		/// The target image for a transition.
		///
		///   - Attribute key: `inputTargetImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var targetImage: CIImage? {
			get {
				return self.keyedValue("inputTargetImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputTargetImage")
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

		// MARK: - time (inputTime)

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///
		///   - Attribute key: `inputTime`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeTime`
		///   - Default value: `0`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let time_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var time: NSNumber? {
			get {
				return self.keyedValue("inputTime")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: ModTransition.time_Range), forKey: "inputTime")
			}
		}

		// MARK: - angle (inputAngle)

		///
		/// The angle of the mod hole pattern.
		///
		///   - Attribute key: `inputAngle`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `2`
		@objc public var angle: NSNumber? {
			get {
				return self.keyedValue("inputAngle")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAngle")
			}
		}

		// MARK: - radius (inputRadius)

		///
		/// The radius of the undistorted holes in the pattern.
		///
		///   - Attribute key: `inputRadius`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `150`
		///   minValue: 1.0
		///
		public static let radius_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: ModTransition.radius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - compression (inputCompression)

		///
		/// The amount of stretching applied to the mod hole pattern. Holes in the center are not distorted as much as those at the edge of the image.
		///
		///   - Attribute key: `inputCompression`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `300`
		///   minValue: 1.0
		///
		public static let compression_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var compression: NSNumber? {
			get {
				return self.keyedValue("inputCompression")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: ModTransition.compression_Range), forKey: "inputCompression")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			center: CGPoint = ModTransition.center_default,
			time: NSNumber = 0,
			angle: NSNumber = 2,
			radius: NSNumber = 150,
			compression: NSNumber = 300
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
