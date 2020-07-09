//
//  CISpotColor.swift  (AUTOMATICALLY GENERATED FILE)
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

#if !os(macOS)
	import UIKit // For access to NSValue.cgAffineTransformValue
#endif

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
	@objc(CIFilterFactory_CISpotColor) class CISpotColor: Core {
		@objc public init?() {
			super.init(name: "CISpotColor")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputCenterColor1

		///
		/// The center value of the first color range to replace.
		///
		@objc public var inputCenterColor1: CIColor? {
			get {
				return filter.value(forKey: "inputCenterColor1") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputCenterColor1")
			}
		}

		// MARK: - inputReplacementColor1

		///
		/// A replacement color for the first color range.
		///
		@objc public var inputReplacementColor1: CIColor? {
			get {
				return filter.value(forKey: "inputReplacementColor1") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputReplacementColor1")
			}
		}

		// MARK: - inputCloseness1

		///
		/// A value that indicates how close the first color must match before it is replaced.
		///
		///   minValue: 0.0
		///
		let inputCloseness1_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputCloseness1: NSNumber? {
			get {
				return filter.value(forKey: "inputCloseness1") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCloseness1_Range), forKey: "inputCloseness1")
			}
		}

		// MARK: - inputContrast1

		///
		/// The contrast of the first replacement color.
		///
		///   minValue: 0.0
		///
		let inputContrast1_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputContrast1: NSNumber? {
			get {
				return filter.value(forKey: "inputContrast1") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputContrast1_Range), forKey: "inputContrast1")
			}
		}

		// MARK: - inputCenterColor2

		///
		/// The center value of the second color range to replace.
		///
		@objc public var inputCenterColor2: CIColor? {
			get {
				return filter.value(forKey: "inputCenterColor2") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputCenterColor2")
			}
		}

		// MARK: - inputReplacementColor2

		///
		/// A replacement color for the second color range.
		///
		@objc public var inputReplacementColor2: CIColor? {
			get {
				return filter.value(forKey: "inputReplacementColor2") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputReplacementColor2")
			}
		}

		// MARK: - inputCloseness2

		///
		/// A value that indicates how close the second color must match before it is replaced.
		///
		///   minValue: 0.0
		///
		let inputCloseness2_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputCloseness2: NSNumber? {
			get {
				return filter.value(forKey: "inputCloseness2") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCloseness2_Range), forKey: "inputCloseness2")
			}
		}

		// MARK: - inputContrast2

		///
		/// The contrast of the second replacement color.
		///
		///   minValue: 0.0
		///
		let inputContrast2_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputContrast2: NSNumber? {
			get {
				return filter.value(forKey: "inputContrast2") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputContrast2_Range), forKey: "inputContrast2")
			}
		}

		// MARK: - inputCenterColor3

		///
		/// The center value of the third color range to replace.
		///
		@objc public var inputCenterColor3: CIColor? {
			get {
				return filter.value(forKey: "inputCenterColor3") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputCenterColor3")
			}
		}

		// MARK: - inputReplacementColor3

		///
		/// A replacement color for the third color range.
		///
		@objc public var inputReplacementColor3: CIColor? {
			get {
				return filter.value(forKey: "inputReplacementColor3") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputReplacementColor3")
			}
		}

		// MARK: - inputCloseness3

		///
		/// A value that indicates how close the third color must match before it is replaced.
		///
		///   minValue: 0.0
		///
		let inputCloseness3_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputCloseness3: NSNumber? {
			get {
				return filter.value(forKey: "inputCloseness3") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCloseness3_Range), forKey: "inputCloseness3")
			}
		}

		// MARK: - inputContrast3

		///
		/// The contrast of the third replacement color.
		///
		///   minValue: 0.0
		///
		let inputContrast3_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputContrast3: NSNumber? {
			get {
				return filter.value(forKey: "inputContrast3") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputContrast3_Range), forKey: "inputContrast3")
			}
		}
	}
}
