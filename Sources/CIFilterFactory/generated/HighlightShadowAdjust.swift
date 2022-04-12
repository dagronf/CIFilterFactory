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
	/// **Availability**
	/// - macOS 10.7, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryStillImage
	/// - CICategoryStylize
	/// - CICategoryVideo
	///
	/// **Documentation Links**
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

		// MARK: - inputImage (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
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
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: HighlightShadowAdjust.radiusRange, forKey: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 0.0

		/// `radius` range definition
		public static let radiusRange = PartialRangeFrom<Double>(0.0)

		// MARK: - shadowAmount (inputShadowAmount)

		/// The amount of adjustment to the shadows of the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShadowAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `-1.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.0`
		@objc public var shadowAmount: Double {
			get {
				self.doubleValue(forKey: "inputShadowAmount", defaultValue: Self.shadowAmountDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: HighlightShadowAdjust.shadowAmountRange, forKey: "inputShadowAmount")
			}
		}

		/// `shadowAmount` default value
		@objc public static let shadowAmountDefault: Double = 0.0

		/// `shadowAmount` range definition
		public static let shadowAmountRange: ClosedRange<Double> = -1.0 ... 1.0

		// MARK: - highlightAmount (inputHighlightAmount)

		/// The amount of adjustment to the highlights of the image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputHighlightAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `1.0`
		@objc public var highlightAmount: Double {
			get {
				self.doubleValue(forKey: "inputHighlightAmount", defaultValue: Self.highlightAmountDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: HighlightShadowAdjust.highlightAmountRange, forKey: "inputHighlightAmount")
			}
		}

		/// `highlightAmount` default value
		@objc public static let highlightAmountDefault: Double = 1.0

		/// `highlightAmount` range definition
		public static let highlightAmountRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			radius: Double = HighlightShadowAdjust.radiusDefault,
			shadowAmount: Double = HighlightShadowAdjust.shadowAmountDefault,
			highlightAmount: Double = HighlightShadowAdjust.highlightAmountDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.radius = radius
			self.shadowAmount = shadowAmount
			self.highlightAmount = highlightAmount
		}
	}
}
