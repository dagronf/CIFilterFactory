//
//  CIRippleTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Ripple
	///
	/// Transitions from one image to another by creating a circular wave that expands from the center point, revealing the new image in the wake of the wave.
	///
	/// **Links**
	///
	/// - [CIRippleTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRippleTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cirippletransition?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIRippleTransition/)
	///
	@objc(CIFilterFactory_RippleTransition) class RippleTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIRippleTransition")
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

		// MARK: - shadingImage (inputShadingImage)

		///
		/// An image that looks like a shaded sphere enclosed in a square image.
		///
		///   - Attribute key: `inputShadingImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var shadingImage: CIImage? {
			get {
				return self.keyedValue("inputShadingImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputShadingImage")
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

		// MARK: - extent (inputExtent)

		///
		/// A rectangle that defines the extent of the effect.
		///
		///   - Attribute key: `inputExtent`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypeRectangle`
		///   - Default value: `[0 0 300 300]`
		@objc public var extent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extent_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// extent default value
		@objc public static let extent_default = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0)

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
				self.filter.setValue(newValue?.clamped(bounds: RippleTransition.time_Range), forKey: "inputTime")
			}
		}

		// MARK: - width (inputWidth)

		///
		/// The width of the ripple.
		///
		///   - Attribute key: `inputWidth`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `100`
		///   minValue: 1.0
		///
		public static let width_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var width: NSNumber? {
			get {
				return self.keyedValue("inputWidth")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: RippleTransition.width_Range), forKey: "inputWidth")
			}
		}

		// MARK: - scale (inputScale)

		///
		/// A value that determines whether the ripple starts as a bulge (higher value) or a dimple (lower value).
		///
		///   - Attribute key: `inputScale`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `50`
		///   minValue: -50.0
		///
		public static let scale_Range: PartialRangeFrom<Float> = Float(-50.0)...
		@objc public var scale: NSNumber? {
			get {
				return self.keyedValue("inputScale")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: RippleTransition.scale_Range), forKey: "inputScale")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			shadingImage: CIImage,
			center: CGPoint = RippleTransition.center_default,
			extent: CGRect = RippleTransition.extent_default,
			time: NSNumber = 0,
			width: NSNumber = 100,
			scale: NSNumber = 50
		) {
			self.init()

			self.image = image
			self.targetImage = targetImage
			self.shadingImage = shadingImage
			self.center = center
			self.extent = extent
			self.time = time
			self.width = width
			self.scale = scale
		}
	}
}
