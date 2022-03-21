//
//  HighlightShadowAdjust.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.7, iOS 5, tvOS 5, *)
@objc public extension CIFF {
	///
	/// Highlight and Shadow Adjust
	///
	/// Adjust the tonal mapping of an image while preserving spatial detail
	///
	/// **Links**
	///
	/// - [CIHighlightShadowAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHighlightShadowAdjust)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cihighlightshadowadjust?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIHighlightShadowAdjust/)
	///
	@available(macOS 10.7, iOS 5, tvOS 5, *)
	@objc(CIFFHighlightShadowAdjust) class HighlightShadowAdjust: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIHighlightShadowAdjust")
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

		// MARK: - radius (inputRadius)

		/// Shadow Highlight Radius
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		@objc public var radius: Double {
			get {
				let number = self.filter.value(forKey: "inputRadius") as? NSNumber
				return number?.doubleValue ?? Self.radiusDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: HighlightShadowAdjust.radiusRange)
				self.filter.setValue(number, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 0

		/// `radius` range definition
		public static let radiusRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - shadowAmount (inputShadowAmount)

		/// The amount of adjustment to the shadows of the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0`
		/// - Minimum value: `-1.0`
		/// - Maximum value: `1.0`
		@objc public var shadowAmount: Double {
			get {
				let number = self.filter.value(forKey: "inputShadowAmount") as? NSNumber
				return number?.doubleValue ?? Self.shadowAmountDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: HighlightShadowAdjust.shadowAmountRange)
				self.filter.setValue(number, forKey: "inputShadowAmount")
			}
		}

		/// `shadowAmount` default value
		@objc public static let shadowAmountDefault: Double = 0

		/// `shadowAmount` range definition
		public static let shadowAmountRange: ClosedRange<Double> = -1.0 ... 1.0

		// MARK: - highlightAmount (inputHighlightAmount)

		/// The amount of adjustment to the highlights of the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputHighlightAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var highlightAmount: Double {
			get {
				let number = self.filter.value(forKey: "inputHighlightAmount") as? NSNumber
				return number?.doubleValue ?? Self.highlightAmountDefault
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: HighlightShadowAdjust.highlightAmountRange)
				self.filter.setValue(number, forKey: "inputHighlightAmount")
			}
		}

		/// `highlightAmount` default value
		@objc public static let highlightAmountDefault: Double = 1

		/// `highlightAmount` range definition
		public static let highlightAmountRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			radius: Double = 0,
			shadowAmount: Double = 0,
			highlightAmount: Double = 1
		) {
			self.init()

			self.image = image
			self.radius = radius
			self.shadowAmount = shadowAmount
			self.highlightAmount = highlightAmount
		}
	}
}
