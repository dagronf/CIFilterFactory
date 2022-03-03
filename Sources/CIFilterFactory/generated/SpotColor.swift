//
//  SpotColor.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.5, iOS 9, tvOS 9, *)
@objc public extension CIFF {
	///
	/// Spot Color
	///
	/// Replaces one or more color ranges with spot colors.
	///
	/// **Links**
	///
	/// - [CISpotColor Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotColor)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cispotcolor?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISpotColor/)
	///
	@available(macOS 10.5, iOS 9, tvOS 9, *)
	@objc(CIFFSpotColor) class SpotColor: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CISpotColor")
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

		// MARK: - centerColor1 (inputCenterColor1)

		/// The center value of the first color range to replace.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenterColor1`
		/// - Internal class: `CIColor`
		/// - Default value: `rgba(0.0784 0.0627 0.0706 1)`
		@objc public var centerColor1: CIColor? {
			get {
				return self.keyedValue("inputCenterColor1")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCenterColor1")
			}
		}

		// MARK: - replacementColor1 (inputReplacementColor1)

		/// A replacement color for the first color range.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputReplacementColor1`
		/// - Internal class: `CIColor`
		/// - Default value: `rgba(0.4392 0.1922 0.1961 1)`
		@objc public var replacementColor1: CIColor? {
			get {
				return self.keyedValue("inputReplacementColor1")
			}
			set {
				self.setKeyedValue(newValue, for: "inputReplacementColor1")
			}
		}

		// MARK: - closeness1 (inputCloseness1)

		/// A value that indicates how close the first color must match before it is replaced.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCloseness1`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.22`
		/// - Minimum value: `0.0`
		@objc public var closeness1: Double {
			get {
				let number = self.filter.value(forKey: "inputCloseness1") as? NSNumber
				return number?.doubleValue ?? 0.22
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: SpotColor.closeness1Range)
				self.filter.setValue(number, forKey: "inputCloseness1")
			}
		}

		/// `closeness1` range definition
		public static let closeness1Range: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - contrast1 (inputContrast1)

		/// The contrast of the first replacement color.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputContrast1`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.98`
		/// - Minimum value: `0.0`
		@objc public var contrast1: Double {
			get {
				let number = self.filter.value(forKey: "inputContrast1") as? NSNumber
				return number?.doubleValue ?? 0.98
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: SpotColor.contrast1Range)
				self.filter.setValue(number, forKey: "inputContrast1")
			}
		}

		/// `contrast1` range definition
		public static let contrast1Range: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - centerColor2 (inputCenterColor2)

		/// The center value of the second color range to replace.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenterColor2`
		/// - Internal class: `CIColor`
		/// - Default value: `rgba(0.5255 0.3059 0.3451 1)`
		@objc public var centerColor2: CIColor? {
			get {
				return self.keyedValue("inputCenterColor2")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCenterColor2")
			}
		}

		// MARK: - replacementColor2 (inputReplacementColor2)

		/// A replacement color for the second color range.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputReplacementColor2`
		/// - Internal class: `CIColor`
		/// - Default value: `rgba(0.9137 0.5608 0.5059 1)`
		@objc public var replacementColor2: CIColor? {
			get {
				return self.keyedValue("inputReplacementColor2")
			}
			set {
				self.setKeyedValue(newValue, for: "inputReplacementColor2")
			}
		}

		// MARK: - closeness2 (inputCloseness2)

		/// A value that indicates how close the second color must match before it is replaced.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCloseness2`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.15`
		/// - Minimum value: `0.0`
		@objc public var closeness2: Double {
			get {
				let number = self.filter.value(forKey: "inputCloseness2") as? NSNumber
				return number?.doubleValue ?? 0.15
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: SpotColor.closeness2Range)
				self.filter.setValue(number, forKey: "inputCloseness2")
			}
		}

		/// `closeness2` range definition
		public static let closeness2Range: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - contrast2 (inputContrast2)

		/// The contrast of the second replacement color.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputContrast2`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.98`
		/// - Minimum value: `0.0`
		@objc public var contrast2: Double {
			get {
				let number = self.filter.value(forKey: "inputContrast2") as? NSNumber
				return number?.doubleValue ?? 0.98
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: SpotColor.contrast2Range)
				self.filter.setValue(number, forKey: "inputContrast2")
			}
		}

		/// `contrast2` range definition
		public static let contrast2Range: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - centerColor3 (inputCenterColor3)

		/// The center value of the third color range to replace.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenterColor3`
		/// - Internal class: `CIColor`
		/// - Default value: `rgba(0.9216 0.4549 0.3333 1)`
		@objc public var centerColor3: CIColor? {
			get {
				return self.keyedValue("inputCenterColor3")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCenterColor3")
			}
		}

		// MARK: - replacementColor3 (inputReplacementColor3)

		/// A replacement color for the third color range.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputReplacementColor3`
		/// - Internal class: `CIColor`
		/// - Default value: `rgba(0.9098 0.7529 0.6078 1)`
		@objc public var replacementColor3: CIColor? {
			get {
				return self.keyedValue("inputReplacementColor3")
			}
			set {
				self.setKeyedValue(newValue, for: "inputReplacementColor3")
			}
		}

		// MARK: - closeness3 (inputCloseness3)

		/// A value that indicates how close the third color must match before it is replaced.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCloseness3`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.5`
		/// - Minimum value: `0.0`
		@objc public var closeness3: Double {
			get {
				let number = self.filter.value(forKey: "inputCloseness3") as? NSNumber
				return number?.doubleValue ?? 0.5
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: SpotColor.closeness3Range)
				self.filter.setValue(number, forKey: "inputCloseness3")
			}
		}

		/// `closeness3` range definition
		public static let closeness3Range: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - contrast3 (inputContrast3)

		/// The contrast of the third replacement color.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputContrast3`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.99`
		/// - Minimum value: `0.0`
		@objc public var contrast3: Double {
			get {
				let number = self.filter.value(forKey: "inputContrast3") as? NSNumber
				return number?.doubleValue ?? 0.99
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: SpotColor.contrast3Range)
				self.filter.setValue(number, forKey: "inputContrast3")
			}
		}

		/// `contrast3` range definition
		public static let contrast3Range: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			centerColor1: CIColor,
			replacementColor1: CIColor,
			closeness1: Double = 0.22,
			contrast1: Double = 0.98,
			centerColor2: CIColor,
			replacementColor2: CIColor,
			closeness2: Double = 0.15,
			contrast2: Double = 0.98,
			centerColor3: CIColor,
			replacementColor3: CIColor,
			closeness3: Double = 0.5,
			contrast3: Double = 0.99
		) {
			self.init()

			self.image = image
			self.centerColor1 = centerColor1
			self.replacementColor1 = replacementColor1
			self.closeness1 = closeness1
			self.contrast1 = contrast1
			self.centerColor2 = centerColor2
			self.replacementColor2 = replacementColor2
			self.closeness2 = closeness2
			self.contrast2 = contrast2
			self.centerColor3 = centerColor3
			self.replacementColor3 = replacementColor3
			self.closeness3 = closeness3
			self.contrast3 = contrast3
		}
	}
}