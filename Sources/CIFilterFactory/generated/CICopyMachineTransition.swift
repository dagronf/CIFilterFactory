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

public extension CIFilter {
	@available(macOS 10.4, iOS 6, *)
	@inlinable @objc static func CopyMachineTransition() -> CIFilterFactory.CICopyMachineTransition? {
		return CIFilterFactory.CICopyMachineTransition()
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Copy Machine
	///
	/// Transitions from one image to another by simulating the effect of a copy machine.
	///
	/// **Links**
	///
	/// [CICopyMachineTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICopyMachineTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICopyMachineTransition/)
	///
	@objc(CIFilterFactory_CICopyMachineTransition) class CICopyMachineTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CICopyMachineTransition")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		///
		/// The target image for a transition.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputTargetImage: CIImage? {
			get {
				return self.keyedValue("inputTargetImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputTargetImage")
			}
		}

		///
		/// A rectangle that defines the extent of the effect.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeRectangle
		///   Default:  [0 0 300 300]
		@objc public dynamic var inputExtent: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputExtent")
			}
			set {
				self.setKeyedValue(newValue?.vector, for: "inputExtent")
			}
		}

		///
		/// The color of the copier light.
		///
		///   Class:    CIColor
		///   Type:     CIAttributeTypeOpaqueColor
		///   Default:  rgba(0.6 1 0.8 1)
		@objc public dynamic var inputColor: CIColor? {
			get {
				return self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeTime
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputTime_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputTime: NSNumber? {
			get {
				return self.keyedValue("inputTime")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CICopyMachineTransition.inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The angle of the copier light.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  0
		///   minValue: 0.0
		///
		public static let inputAngle_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputAngle: NSNumber? {
			get {
				return self.keyedValue("inputAngle")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CICopyMachineTransition.inputAngle_Range), forKey: "inputAngle")
			}
		}

		///
		/// The width of the copier light.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  200
		@objc public dynamic var inputWidth: NSNumber? {
			get {
				return self.keyedValue("inputWidth")
			}
			set {
				self.setKeyedValue(newValue, for: "inputWidth")
			}
		}

		///
		/// The opacity of the copier light. A value of 0.0 is transparent. A value of 1.0 is opaque.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1.3
		///   minValue: 0.0
		///
		public static let inputOpacity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputOpacity: NSNumber? {
			get {
				return self.keyedValue("inputOpacity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CICopyMachineTransition.inputOpacity_Range), forKey: "inputOpacity")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputTargetImage: CIImage,
			inputExtent: CIFilterFactory.Rect = CIFilterFactory.Rect(x: 0.0, y: 0.0, width: 300.0, height: 300.0),
			inputColor: CIColor,
			inputTime: NSNumber = 0,
			inputAngle: NSNumber = 0,
			inputWidth: NSNumber = 200,
			inputOpacity: NSNumber = 1.3
		) {
			self.init()

			self.inputImage = inputImage
			self.inputTargetImage = inputTargetImage
			self.inputExtent = inputExtent
			self.inputColor = inputColor
			self.inputTime = inputTime
			self.inputAngle = inputAngle
			self.inputWidth = inputWidth
			self.inputOpacity = inputOpacity
		}
	}
}
