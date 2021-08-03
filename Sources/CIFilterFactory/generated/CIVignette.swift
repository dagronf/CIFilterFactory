//
//  CIVignette.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.9, iOS 5, *)
	@inlinable @objc static func Vignette() -> CIFilterFactory.CIVignette? {
		return CIFilterFactory.CIVignette()
	}
}

@available(macOS 10.9, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Vignette
	///
	/// Applies a vignette shading to the corners of an image.
	///
	/// **Links**
	///
	/// [CIVignette Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignette)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIVignette/)
	///
	@objc(CIFilterFactory_CIVignette) class CIVignette: FilterCore {
		@objc public init?() {
			super.init(name: "CIVignette")
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
		/// The intensity of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		public static let inputIntensity_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public dynamic var inputIntensity: NSNumber? {
			get {
				return self.keyedValue("inputIntensity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIVignette.inputIntensity_Range), forKey: "inputIntensity")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///   maxValue: 2.0
		///
		public static let inputRadius_Range: ClosedRange<Float> = 0.0 ... 2.0
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIVignette.inputRadius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputIntensity: NSNumber = 0,
			inputRadius: NSNumber = 1
		) {
			self.init()

			self.inputImage = inputImage
			self.inputIntensity = inputIntensity
			self.inputRadius = inputRadius
		}
	}
}
