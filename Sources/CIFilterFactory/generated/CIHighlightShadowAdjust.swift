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

import AVFoundation
import CoreImage
import CoreML
import Foundation

@available(macOS 10.7, iOS 5, tvOS 5, *)
@objc public extension CIFilterFactory {
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
	@objc(CIFilterFactory_HighlightShadowAdjust) class HighlightShadowAdjust: FilterCore {
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
		@objc public var radius: NSNumber? {
			get {
				return self.keyedValue("inputRadius")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: HighlightShadowAdjust.radiusRange), forKey: "inputRadius")
			}
		}

		/// `radius` range definition
		public static let radiusRange: PartialRangeFrom<Float> = Float(0.0)...

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
		@objc public var shadowAmount: NSNumber? {
			get {
				return self.keyedValue("inputShadowAmount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: HighlightShadowAdjust.shadowAmountRange), forKey: "inputShadowAmount")
			}
		}

		/// `shadowAmount` range definition
		public static let shadowAmountRange: ClosedRange<Float> = -1.0 ... 1.0

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
		@objc public var highlightAmount: NSNumber? {
			get {
				return self.keyedValue("inputHighlightAmount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: HighlightShadowAdjust.highlightAmountRange), forKey: "inputHighlightAmount")
			}
		}

		/// `highlightAmount` range definition
		public static let highlightAmountRange: ClosedRange<Float> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			radius: NSNumber = 0,
			shadowAmount: NSNumber = 0,
			highlightAmount: NSNumber = 1
		) {
			self.init()

			self.image = image
			self.radius = radius
			self.shadowAmount = shadowAmount
			self.highlightAmount = highlightAmount
		}
	}
}
