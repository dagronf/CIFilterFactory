//
//  CICopyMachineTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Copy Machine
	///
	/// Transitions from one image to another by simulating the effect of a copy machine.
	///
	/// **Links**
	///
	/// - [CICopyMachineTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICopyMachineTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicopymachinetransition?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICopyMachineTransition/)
	///
	@objc(CIFilterFactory_CopyMachineTransition) class CopyMachineTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CICopyMachineTransition")
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

		// MARK: - color (inputColor)

		///
		/// The color of the copier light.
		///
		///   - Attribute key: `inputColor`
		///   - Internal class: `CIColor`
		///   - Type: `CIAttributeTypeOpaqueColor`
		///   - Default value: `rgba(0.6 1 0.8 1`)
		@objc public var color: CIColor? {
			get {
				return self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

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
				self.filter.setValue(newValue?.clamped(bounds: CopyMachineTransition.time_Range), forKey: "inputTime")
			}
		}

		// MARK: - angle (inputAngle)

		///
		/// The angle of the copier light.
		///
		///   - Attribute key: `inputAngle`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `0`
		///   minValue: 0.0
		///
		public static let angle_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var angle: NSNumber? {
			get {
				return self.keyedValue("inputAngle")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CopyMachineTransition.angle_Range), forKey: "inputAngle")
			}
		}

		// MARK: - width (inputWidth)

		///
		/// The width of the copier light.
		///
		///   - Attribute key: `inputWidth`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `200`
		@objc public var width: NSNumber? {
			get {
				return self.keyedValue("inputWidth")
			}
			set {
				self.setKeyedValue(newValue, for: "inputWidth")
			}
		}

		// MARK: - opacity (inputOpacity)

		///
		/// The opacity of the copier light. A value of 0.0 is transparent. A value of 1.0 is opaque.
		///
		///   - Attribute key: `inputOpacity`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1.3`
		///   minValue: 0.0
		///
		public static let opacity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var opacity: NSNumber? {
			get {
				return self.keyedValue("inputOpacity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CopyMachineTransition.opacity_Range), forKey: "inputOpacity")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			extent: CGRect = CopyMachineTransition.extent_default,
			color: CIColor,
			time: NSNumber = 0,
			angle: NSNumber = 0,
			width: NSNumber = 200,
			opacity: NSNumber = 1.3
		) {
			self.init()

			self.image = image
			self.targetImage = targetImage
			self.extent = extent
			self.color = color
			self.time = time
			self.angle = angle
			self.width = width
			self.opacity = opacity
		}
	}
}
