//
//  CITorusLensDistortion.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.4, iOS 9, *)
	@inlinable @objc static func TorusLensDistortion() -> CIFilterFactory.CITorusLensDistortion? {
		return CIFilterFactory.CITorusLensDistortion()
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Torus Lens Distortion
	///
	/// Creates a torus-shaped lens and distorts the portion of the image over which the lens is placed.
	///
	/// **Links**
	///
	/// [CITorusLensDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITorusLensDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CITorusLensDistortion/)
	///
	@objc(CIFilterFactory_CITorusLensDistortion) class CITorusLensDistortion: FilterCore {
		@objc public init?() {
			super.init(name: "CITorusLensDistortion")
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
		/// The x and y position to use as the center of the torus.
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
		/// The outer radius of the torus.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  160
		///   minValue: 0.0
		///
		public static let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CITorusLensDistortion.inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The width of the ring.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  80
		///   minValue: 0.0
		///
		public static let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CITorusLensDistortion.inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The refraction of the glass.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1.7
		///   minValue: 0.0
		///
		public static let inputRefraction_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputRefraction: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRefraction") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CITorusLensDistortion.inputRefraction_Range), forKey: "inputRefraction")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputCenter: CIFilterFactory.Point = CIFilterFactory.Point(x: 150.0, y: 150.0),
			inputRadius: NSNumber = 160,
			inputWidth: NSNumber = 80,
			inputRefraction: NSNumber = 1.7
		) {
			self.init()

			self.inputImage = inputImage
			self.inputCenter = inputCenter
			self.inputRadius = inputRadius
			self.inputWidth = inputWidth
			self.inputRefraction = inputRefraction
		}
	}
}
