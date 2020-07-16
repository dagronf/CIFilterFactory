//
//  CIPDF417BarcodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

@available(macOS 10.11, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// PDF417 Barcode Generator
	///
	/// Generate a PDF417 barcode image for message data.
	///
	/// **Links**
	///
	/// [CIPDF417BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPDF417BarcodeGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPDF417BarcodeGenerator/)
	///
	@objc(CIFilterFactory_CIPDF417BarcodeGenerator) class CIPDF417BarcodeGenerator: FilterCommon {
		@objc public init?() {
			super.init(name: "CIPDF417BarcodeGenerator")
		}

		// MARK: - inputMessage

		///
		/// The message to encode in the PDF417 Barcode
		///
		///   Class: NSData, Type: Not specified
		///
		@objc public var inputMessage: NSData? {
			get {
				return self.filter.value(forKey: "inputMessage") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMessage")
			}
		}

		// MARK: - inputMinWidth

		///
		/// The minimum width of the generated barcode in pixels.
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 56.0
		///   maxValue: 583.0
		///
		let inputMinWidth_Range: ClosedRange<Float> = 56.0 ... 583.0
		@objc public var inputMinWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMinWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputMinWidth_Range), forKey: "inputMinWidth")
			}
		}

		// MARK: - inputMaxWidth

		///
		/// The maximum width of the generated barcode in pixels.
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 56.0
		///   maxValue: 583.0
		///
		let inputMaxWidth_Range: ClosedRange<Float> = 56.0 ... 583.0
		@objc public var inputMaxWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMaxWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputMaxWidth_Range), forKey: "inputMaxWidth")
			}
		}

		// MARK: - inputMinHeight

		///
		/// The minimum height of the generated barcode in pixels.
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 13.0
		///   maxValue: 283.0
		///
		let inputMinHeight_Range: ClosedRange<Float> = 13.0 ... 283.0
		@objc public var inputMinHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMinHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputMinHeight_Range), forKey: "inputMinHeight")
			}
		}

		// MARK: - inputMaxHeight

		///
		/// The maximum height of the generated barcode in pixels.
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 13.0
		///   maxValue: 283.0
		///
		let inputMaxHeight_Range: ClosedRange<Float> = 13.0 ... 283.0
		@objc public var inputMaxHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMaxHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputMaxHeight_Range), forKey: "inputMaxHeight")
			}
		}

		// MARK: - inputDataColumns

		///
		/// The number of data columns in the generated barcode
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 1.0
		///   maxValue: 30.0
		///
		let inputDataColumns_Range: ClosedRange<Float> = 1.0 ... 30.0
		@objc public var inputDataColumns: NSNumber? {
			get {
				return self.filter.value(forKey: "inputDataColumns") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputDataColumns_Range), forKey: "inputDataColumns")
			}
		}

		// MARK: - inputRows

		///
		/// The number of rows in the generated barcode
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 3.0
		///   maxValue: 90.0
		///
		let inputRows_Range: ClosedRange<Float> = 3.0 ... 90.0
		@objc public var inputRows: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRows") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputRows_Range), forKey: "inputRows")
			}
		}

		// MARK: - inputPreferredAspectRatio

		///
		/// The preferred aspect ratio of the generated barcode
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 0.0
		///
		let inputPreferredAspectRatio_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputPreferredAspectRatio: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPreferredAspectRatio") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputPreferredAspectRatio_Range), forKey: "inputPreferredAspectRatio")
			}
		}

		// MARK: - inputCompactionMode

		///
		/// The compaction mode of the generated barcode.
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 0.0
		///   maxValue: 3.0
		///
		let inputCompactionMode_Range: ClosedRange<Float> = 0.0 ... 3.0
		@objc public var inputCompactionMode: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCompactionMode") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputCompactionMode_Range), forKey: "inputCompactionMode")
			}
		}

		// MARK: - inputCompactStyle

		///
		/// Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputCompactStyle_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputCompactStyle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCompactStyle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputCompactStyle_Range), forKey: "inputCompactStyle")
			}
		}

		// MARK: - inputCorrectionLevel

		///
		/// The correction level ratio of the generated barcode
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 0.0
		///   maxValue: 8.0
		///
		let inputCorrectionLevel_Range: ClosedRange<Float> = 0.0 ... 8.0
		@objc public var inputCorrectionLevel: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCorrectionLevel") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputCorrectionLevel_Range), forKey: "inputCorrectionLevel")
			}
		}

		// MARK: - inputAlwaysSpecifyCompaction

		///
		/// Force compaction style to @YES or @NO. Set to nil for automatic.
		///
		///   Class: NSNumber, Type: Not specified
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputAlwaysSpecifyCompaction_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputAlwaysSpecifyCompaction: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAlwaysSpecifyCompaction") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputAlwaysSpecifyCompaction_Range), forKey: "inputAlwaysSpecifyCompaction")
			}
		}
	}
}
