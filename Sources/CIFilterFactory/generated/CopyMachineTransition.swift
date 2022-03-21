//
//  CopyMachineTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFCopyMachineTransition) class CopyMachineTransition: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CICopyMachineTransition")
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

		// MARK: - extent (inputExtent)

		/// A rectangle that defines the extent of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputExtent`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeRectangle`
		/// - Default value: `[0 0 300 300]`
		@objc public var extent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extentDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// `extent` default value
		@objc public static let extentDefault = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0)

		// MARK: - color (inputColor)

		/// The color of the copier light.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeOpaqueColor`
		/// - Default value: `rgba(0.6 1 0.8 1)`
		@objc public var color: CIColor? {
			get {
				return self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

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
				return number?.doubleValue ?? Self.timeDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: CopyMachineTransition.timeRange)
				self.filter.setValue(number, forKey: "inputTime")
			}
		}

		/// `time` default value
		@objc public static let timeDefault: Double = 0

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - angle (inputAngle)

		/// The angle of the copier light.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAngle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		@objc public var angle: Double {
			get {
				let number = self.filter.value(forKey: "inputAngle") as? NSNumber
				return number?.doubleValue ?? Self.angleDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: CopyMachineTransition.angleRange)
				self.filter.setValue(number, forKey: "inputAngle")
			}
		}

		/// `angle` default value
		@objc public static let angleDefault: Double = 0

		/// `angle` range definition
		public static let angleRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - width (inputWidth)

		/// The width of the copier light.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `200`
		/// - Minimum value: `0.1`
		@objc public var width: Double {
			get {
				let number = self.filter.value(forKey: "inputWidth") as? NSNumber
				return number?.doubleValue ?? Self.widthDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: CopyMachineTransition.widthRange)
				self.filter.setValue(number, forKey: "inputWidth")
			}
		}

		/// `width` default value
		@objc public static let widthDefault: Double = 200

		/// `width` range definition
		public static let widthRange: PartialRangeFrom<Double> = Double(0.1)...

		// MARK: - opacity (inputOpacity)

		/// The opacity of the copier light. A value of 0.0 is transparent. A value of 1.0 is opaque.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputOpacity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1.3`
		/// - Minimum value: `0.0`
		@objc public var opacity: Double {
			get {
				let number = self.filter.value(forKey: "inputOpacity") as? NSNumber
				return number?.doubleValue ?? Self.opacityDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: CopyMachineTransition.opacityRange)
				self.filter.setValue(number, forKey: "inputOpacity")
			}
		}

		/// `opacity` default value
		@objc public static let opacityDefault: Double = 1.3

		/// `opacity` range definition
		public static let opacityRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			extent: CGRect = CopyMachineTransition.extentDefault,
			color: CIColor,
			time: Double = 0,
			angle: Double = 0,
			width: Double = 200,
			opacity: Double = 1.3
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
