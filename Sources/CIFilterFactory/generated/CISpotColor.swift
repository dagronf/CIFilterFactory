//
//  CISpotColor.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Spot Color
	///
	/// Replaces one or more color ranges with spot colors.
	///
	/// **Links**
	///
	/// [CISpotColor Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotColor)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISpotColor/)
	///
	@objc(CIFilterFactory_CISpotColor) class CISpotColor: FilterCore {
		@objc public init?() {
			super.init(name: "CISpotColor")
		}

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
		/// The center value of the first color range to replace.
		///
		///   Class:    CIColor
		///   Default:  rgba(0.0784 0.0627 0.0706 1)
		@objc public dynamic var inputCenterColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputCenterColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenterColor1")
			}
		}

		///
		/// A replacement color for the first color range.
		///
		///   Class:    CIColor
		///   Default:  rgba(0.4392 0.1922 0.1961 1)
		@objc public dynamic var inputReplacementColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputReplacementColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputReplacementColor1")
			}
		}

		///
		/// A value that indicates how close the first color must match before it is replaced.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.22
		///   minValue: 0.0
		///
		static let inputCloseness1_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputCloseness1: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCloseness1") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISpotColor.inputCloseness1_Range), forKey: "inputCloseness1")
			}
		}

		///
		/// The contrast of the first replacement color.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.98
		///   minValue: 0.0
		///
		static let inputContrast1_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputContrast1: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast1") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISpotColor.inputContrast1_Range), forKey: "inputContrast1")
			}
		}

		///
		/// The center value of the second color range to replace.
		///
		///   Class:    CIColor
		///   Default:  rgba(0.5255 0.3059 0.3451 1)
		@objc public dynamic var inputCenterColor2: CIColor? {
			get {
				return self.filter.value(forKey: "inputCenterColor2") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenterColor2")
			}
		}

		///
		/// A replacement color for the second color range.
		///
		///   Class:    CIColor
		///   Default:  rgba(0.9137 0.5608 0.5059 1)
		@objc public dynamic var inputReplacementColor2: CIColor? {
			get {
				return self.filter.value(forKey: "inputReplacementColor2") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputReplacementColor2")
			}
		}

		///
		/// A value that indicates how close the second color must match before it is replaced.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.15
		///   minValue: 0.0
		///
		static let inputCloseness2_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputCloseness2: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCloseness2") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISpotColor.inputCloseness2_Range), forKey: "inputCloseness2")
			}
		}

		///
		/// The contrast of the second replacement color.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.98
		///   minValue: 0.0
		///
		static let inputContrast2_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputContrast2: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast2") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISpotColor.inputContrast2_Range), forKey: "inputContrast2")
			}
		}

		///
		/// The center value of the third color range to replace.
		///
		///   Class:    CIColor
		///   Default:  rgba(0.9216 0.4549 0.3333 1)
		@objc public dynamic var inputCenterColor3: CIColor? {
			get {
				return self.filter.value(forKey: "inputCenterColor3") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenterColor3")
			}
		}

		///
		/// A replacement color for the third color range.
		///
		///   Class:    CIColor
		///   Default:  rgba(0.9098 0.7529 0.6078 1)
		@objc public dynamic var inputReplacementColor3: CIColor? {
			get {
				return self.filter.value(forKey: "inputReplacementColor3") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputReplacementColor3")
			}
		}

		///
		/// A value that indicates how close the third color must match before it is replaced.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.5
		///   minValue: 0.0
		///
		static let inputCloseness3_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputCloseness3: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCloseness3") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISpotColor.inputCloseness3_Range), forKey: "inputCloseness3")
			}
		}

		///
		/// The contrast of the third replacement color.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.99
		///   minValue: 0.0
		///
		static let inputContrast3_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputContrast3: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast3") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CISpotColor.inputContrast3_Range), forKey: "inputContrast3")
			}
		}
	}
}
