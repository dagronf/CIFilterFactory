//
//  CIVortexDistortion.swift  (AUTOMATICALLY GENERATED FILE)
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
	@inlinable @objc static func VortexDistortion() -> CIFilterFactory.CIVortexDistortion? {
		return CIFilterFactory.CIVortexDistortion()
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Vortex Distortion
	///
	/// Rotates pixels around a point to simulate a vortex. You can specify the number of rotations as well the center and radius of the effect.
	///
	/// **Links**
	///
	/// [CIVortexDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVortexDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIVortexDistortion/)
	///
	@objc(CIFilterFactory_CIVortexDistortion) class CIVortexDistortion: FilterCore {
		@objc public init?() {
			super.init(name: "CIVortexDistortion")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The center of the effect as x and y coordinates.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [150 150]
		@objc public dynamic var inputCenter: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputCenter")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputCenter")
			}
		}

		///
		/// The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  300
		///   minValue: 0.0
		///
		static let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIVortexDistortion.inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The angle (in radians) of the vortex.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  56.54866776461628
		@objc public dynamic var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputCenter: CIFilterFactory.Point = CIFilterFactory.Point(x: 150.0, y: 150.0),
			inputRadius: NSNumber = 300,
			inputAngle: NSNumber = 56.54866776461628
		) {
			self.init()

			self.inputImage = inputImage
			self.inputCenter = inputCenter
			self.inputRadius = inputRadius
			self.inputAngle = inputAngle
		}
	}
}
