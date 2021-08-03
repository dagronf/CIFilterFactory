//
//  CIVibrance.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.7, iOS 5, *)
	@inlinable @objc static func Vibrance() -> CIFilterFactory.CIVibrance? {
		return CIFilterFactory.CIVibrance()
	}
}

@available(macOS 10.7, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Vibrance
	///
	/// Adjusts the saturation of an image while keeping pleasing skin tones.
	///
	/// **Links**
	///
	/// [CIVibrance Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVibrance)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIVibrance/)
	///
	@objc(CIFilterFactory_CIVibrance) class CIVibrance: FilterCore {
		@objc public init?() {
			super.init(name: "CIVibrance")
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
		/// The amount to adjust the saturation.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		public static let inputAmount_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public dynamic var inputAmount: NSNumber? {
			get {
				return self.keyedValue("inputAmount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIVibrance.inputAmount_Range), forKey: "inputAmount")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputAmount: NSNumber = 0
		) {
			self.init()

			self.inputImage = inputImage
			self.inputAmount = inputAmount
		}
	}
}
