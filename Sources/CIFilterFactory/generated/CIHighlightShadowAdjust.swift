//
//  CIHighlightShadowAdjust.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.7, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Highlight and Shadow Adjust
	///
	/// Adjust the tonal mapping of an image while preserving spatial detail
	///
	/// **Links**
	///
	/// [CIHighlightShadowAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHighlightShadowAdjust)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHighlightShadowAdjust/)
	///
	@objc(CIFilterFactory_CIHighlightShadowAdjust) class CIHighlightShadowAdjust: FilterCore {
		@objc public init?() {
			super.init(name: "CIHighlightShadowAdjust")
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
		/// Shadow Highlight Radius
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0
		///   minValue: 0.0
		///
		static let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIHighlightShadowAdjust.inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The amount of adjustment to the shadows of the image.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		static let inputShadowAmount_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public dynamic var inputShadowAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIHighlightShadowAdjust.inputShadowAmount_Range), forKey: "inputShadowAmount")
			}
		}

		///
		/// The amount of adjustment to the highlights of the image.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputHighlightAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputHighlightAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHighlightAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIHighlightShadowAdjust.inputHighlightAmount_Range), forKey: "inputHighlightAmount")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputRadius: NSNumber = 0,
			inputShadowAmount: NSNumber = 0,
			inputHighlightAmount: NSNumber = 1
		) {
			self.init()

			self.inputImage = inputImage
			self.inputRadius = inputRadius
			self.inputShadowAmount = inputShadowAmount
			self.inputHighlightAmount = inputHighlightAmount
		}
	}
}
