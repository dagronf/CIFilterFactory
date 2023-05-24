//
//  SpotColor.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2023 Darren Ford. All rights reserved.
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

@objc public extension CIFF {
	/// Spot Color
	///
	/// Replaces one or more color ranges with spot colors.
	///
	/// **CIFilter Name**
	/// - CISpotColor
	///
	/// **Availability**
	/// - macOS 10.5, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Stylize (*CICategoryStylize*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CISpotColor Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotColor)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISpotColor/)
	@available(macOS 10.5, iOS 9, tvOS 9, *)
	@objc(CIFFSpotColor) class SpotColor: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CISpotColor")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input for the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
			get {
				self.keyedValue("inputImage")
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
		/// - Type: `CIAttributeTypeColor`
		@objc public var centerColor1: CIColor? {
			get {
				self.keyedValue("inputCenterColor1")
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
		/// - Type: `CIAttributeTypeColor`
		@objc public var replacementColor1: CIColor? {
			get {
				self.keyedValue("inputReplacementColor1")
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
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.22`
		@objc public var closeness1: Double {
			get {
				self.doubleValue(forKey: "inputCloseness1", defaultValue: Self.closeness1Default)
			}
			set {
				self.setDoubleValue(newValue, bounds: SpotColor.closeness1Range, forKey: "inputCloseness1")
			}
		}

		/// `closeness1` default value
		@objc public static let closeness1Default: Double = 0.22

		/// `closeness1` range definition
		public static let closeness1Range = PartialRangeFrom<Double>(0.0)

		// MARK: - contrast1 (inputContrast1)

		/// The contrast of the first replacement color.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputContrast1`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.98`
		@objc public var contrast1: Double {
			get {
				self.doubleValue(forKey: "inputContrast1", defaultValue: Self.contrast1Default)
			}
			set {
				self.setDoubleValue(newValue, bounds: SpotColor.contrast1Range, forKey: "inputContrast1")
			}
		}

		/// `contrast1` default value
		@objc public static let contrast1Default: Double = 0.98

		/// `contrast1` range definition
		public static let contrast1Range = PartialRangeFrom<Double>(0.0)

		// MARK: - centerColor2 (inputCenterColor2)

		/// The center value of the second color range to replace.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenterColor2`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var centerColor2: CIColor? {
			get {
				self.keyedValue("inputCenterColor2")
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
		/// - Type: `CIAttributeTypeColor`
		@objc public var replacementColor2: CIColor? {
			get {
				self.keyedValue("inputReplacementColor2")
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
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.15`
		@objc public var closeness2: Double {
			get {
				self.doubleValue(forKey: "inputCloseness2", defaultValue: Self.closeness2Default)
			}
			set {
				self.setDoubleValue(newValue, bounds: SpotColor.closeness2Range, forKey: "inputCloseness2")
			}
		}

		/// `closeness2` default value
		@objc public static let closeness2Default: Double = 0.15

		/// `closeness2` range definition
		public static let closeness2Range = PartialRangeFrom<Double>(0.0)

		// MARK: - contrast2 (inputContrast2)

		/// The contrast of the second replacement color.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputContrast2`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.98`
		@objc public var contrast2: Double {
			get {
				self.doubleValue(forKey: "inputContrast2", defaultValue: Self.contrast2Default)
			}
			set {
				self.setDoubleValue(newValue, bounds: SpotColor.contrast2Range, forKey: "inputContrast2")
			}
		}

		/// `contrast2` default value
		@objc public static let contrast2Default: Double = 0.98

		/// `contrast2` range definition
		public static let contrast2Range = PartialRangeFrom<Double>(0.0)

		// MARK: - centerColor3 (inputCenterColor3)

		/// The center value of the third color range to replace.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenterColor3`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var centerColor3: CIColor? {
			get {
				self.keyedValue("inputCenterColor3")
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
		/// - Type: `CIAttributeTypeColor`
		@objc public var replacementColor3: CIColor? {
			get {
				self.keyedValue("inputReplacementColor3")
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
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.5`
		@objc public var closeness3: Double {
			get {
				self.doubleValue(forKey: "inputCloseness3", defaultValue: Self.closeness3Default)
			}
			set {
				self.setDoubleValue(newValue, bounds: SpotColor.closeness3Range, forKey: "inputCloseness3")
			}
		}

		/// `closeness3` default value
		@objc public static let closeness3Default: Double = 0.5

		/// `closeness3` range definition
		public static let closeness3Range = PartialRangeFrom<Double>(0.0)

		// MARK: - contrast3 (inputContrast3)

		/// The contrast of the third replacement color.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputContrast3`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.99`
		@objc public var contrast3: Double {
			get {
				self.doubleValue(forKey: "inputContrast3", defaultValue: Self.contrast3Default)
			}
			set {
				self.setDoubleValue(newValue, bounds: SpotColor.contrast3Range, forKey: "inputContrast3")
			}
		}

		/// `contrast3` default value
		@objc public static let contrast3Default: Double = 0.99

		/// `contrast3` range definition
		public static let contrast3Range = PartialRangeFrom<Double>(0.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - centerColor1: The center value of the first color range to replace.
		///   - replacementColor1: A replacement color for the first color range.
		///   - closeness1: A value that indicates how close the first color must match before it is replaced.
		///   - contrast1: The contrast of the first replacement color.
		///   - centerColor2: The center value of the second color range to replace.
		///   - replacementColor2: A replacement color for the second color range.
		///   - closeness2: A value that indicates how close the second color must match before it is replaced.
		///   - contrast2: The contrast of the second replacement color.
		///   - centerColor3: The center value of the third color range to replace.
		///   - replacementColor3: A replacement color for the third color range.
		///   - closeness3: A value that indicates how close the third color must match before it is replaced.
		///   - contrast3: The contrast of the third replacement color.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			centerColor1: CIColor,
			replacementColor1: CIColor,
			closeness1: Double = SpotColor.closeness1Default,
			contrast1: Double = SpotColor.contrast1Default,
			centerColor2: CIColor,
			replacementColor2: CIColor,
			closeness2: Double = SpotColor.closeness2Default,
			contrast2: Double = SpotColor.contrast2Default,
			centerColor3: CIColor,
			replacementColor3: CIColor,
			closeness3: Double = SpotColor.closeness3Default,
			contrast3: Double = SpotColor.contrast3Default
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
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

@available(macOS 10.5, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Apply the 'Spot Color' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - centerColor1: The center value of the first color range to replace.
	///   - replacementColor1: A replacement color for the first color range.
	///   - closeness1: A value that indicates how close the first color must match before it is replaced. (0.0...)
	///   - contrast1: The contrast of the first replacement color. (0.0...)
	///   - centerColor2: The center value of the second color range to replace.
	///   - replacementColor2: A replacement color for the second color range.
	///   - closeness2: A value that indicates how close the second color must match before it is replaced. (0.0...)
	///   - contrast2: The contrast of the second replacement color. (0.0...)
	///   - centerColor3: The center value of the third color range to replace.
	///   - replacementColor3: A replacement color for the third color range.
	///   - closeness3: A value that indicates how close the third color must match before it is replaced. (0.0...)
	///   - contrast3: The contrast of the third replacement color. (0.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Replaces one or more color ranges with spot colors.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Stylize, Video
	///
	/// **Documentation Links**
	/// - [CISpotColor Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotColor)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CISpotColor/)
	@inlinable func applyingSpotColor(
		centerColor1: CIColor,
		replacementColor1: CIColor,
		closeness1: Double = CIFF.SpotColor.closeness1Default,
		contrast1: Double = CIFF.SpotColor.contrast1Default,
		centerColor2: CIColor,
		replacementColor2: CIColor,
		closeness2: Double = CIFF.SpotColor.closeness2Default,
		contrast2: Double = CIFF.SpotColor.contrast2Default,
		centerColor3: CIColor,
		replacementColor3: CIColor,
		closeness3: Double = CIFF.SpotColor.closeness3Default,
		contrast3: Double = CIFF.SpotColor.contrast3Default,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.SpotColor(
			inputImage: self,
			centerColor1: centerColor1,
			replacementColor1: replacementColor1,
			closeness1: closeness1,
			contrast1: contrast1,
			centerColor2: centerColor2,
			replacementColor2: replacementColor2,
			closeness2: closeness2,
			contrast2: contrast2,
			centerColor3: centerColor3,
			replacementColor3: replacementColor3,
			closeness3: closeness3,
			contrast3: contrast3
		)?.outputImage ?? CIImage.empty()
	}
}
