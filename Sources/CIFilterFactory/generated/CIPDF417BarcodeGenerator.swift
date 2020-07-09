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
	@objc(CIFilterFactory_CIPDF417BarcodeGenerator) class CIPDF417BarcodeGenerator: Core {
		@objc public init?() {
			super.init(name: "CIPDF417BarcodeGenerator")
			filter.setDefaults()
		}

		// MARK: - inputMessage

		///
		/// The message to encode in the PDF417 Barcode
		///
		@objc public var inputMessage: NSData? {
			get {
				return filter.value(forKey: "inputMessage") as? NSData
			}
			set {
				filter.setValue(newValue, forKey: "inputMessage")
			}
		}

		// MARK: - inputMinWidth

		///
		/// The minimum width of the generated barcode in pixels.
		///
		///   minValue: 56.0
		///   maxValue: 583.0
		///
		let inputMinWidth_Range: ClosedRange<Float> = 56.0 ... 583.0
		@objc public var inputMinWidth: NSNumber? {
			get {
				return filter.value(forKey: "inputMinWidth") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputMinWidth_Range), forKey: "inputMinWidth")
			}
		}

		// MARK: - inputMaxWidth

		///
		/// The maximum width of the generated barcode in pixels.
		///
		///   minValue: 56.0
		///   maxValue: 583.0
		///
		let inputMaxWidth_Range: ClosedRange<Float> = 56.0 ... 583.0
		@objc public var inputMaxWidth: NSNumber? {
			get {
				return filter.value(forKey: "inputMaxWidth") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputMaxWidth_Range), forKey: "inputMaxWidth")
			}
		}

		// MARK: - inputMinHeight

		///
		/// The minimum height of the generated barcode in pixels.
		///
		///   minValue: 13.0
		///   maxValue: 283.0
		///
		let inputMinHeight_Range: ClosedRange<Float> = 13.0 ... 283.0
		@objc public var inputMinHeight: NSNumber? {
			get {
				return filter.value(forKey: "inputMinHeight") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputMinHeight_Range), forKey: "inputMinHeight")
			}
		}

		// MARK: - inputMaxHeight

		///
		/// The maximum height of the generated barcode in pixels.
		///
		///   minValue: 13.0
		///   maxValue: 283.0
		///
		let inputMaxHeight_Range: ClosedRange<Float> = 13.0 ... 283.0
		@objc public var inputMaxHeight: NSNumber? {
			get {
				return filter.value(forKey: "inputMaxHeight") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputMaxHeight_Range), forKey: "inputMaxHeight")
			}
		}

		// MARK: - inputDataColumns

		///
		/// The number of data columns in the generated barcode
		///
		///   minValue: 1.0
		///   maxValue: 30.0
		///
		let inputDataColumns_Range: ClosedRange<Float> = 1.0 ... 30.0
		@objc public var inputDataColumns: NSNumber? {
			get {
				return filter.value(forKey: "inputDataColumns") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputDataColumns_Range), forKey: "inputDataColumns")
			}
		}

		// MARK: - inputRows

		///
		/// The number of rows in the generated barcode
		///
		///   minValue: 3.0
		///   maxValue: 90.0
		///
		let inputRows_Range: ClosedRange<Float> = 3.0 ... 90.0
		@objc public var inputRows: NSNumber? {
			get {
				return filter.value(forKey: "inputRows") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputRows_Range), forKey: "inputRows")
			}
		}

		// MARK: - inputPreferredAspectRatio

		///
		/// The preferred aspect ratio of the generated barcode
		///
		///   minValue: 0.0
		///
		let inputPreferredAspectRatio_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputPreferredAspectRatio: NSNumber? {
			get {
				return filter.value(forKey: "inputPreferredAspectRatio") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputPreferredAspectRatio_Range), forKey: "inputPreferredAspectRatio")
			}
		}

		// MARK: - inputCompactionMode

		///
		/// The compaction mode of the generated barcode.
		///
		///   minValue: 0.0
		///   maxValue: 3.0
		///
		let inputCompactionMode_Range: ClosedRange<Float> = 0.0 ... 3.0
		@objc public var inputCompactionMode: NSNumber? {
			get {
				return filter.value(forKey: "inputCompactionMode") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCompactionMode_Range), forKey: "inputCompactionMode")
			}
		}

		// MARK: - inputCompactStyle

		///
		/// Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputCompactStyle_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputCompactStyle: NSNumber? {
			get {
				return filter.value(forKey: "inputCompactStyle") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCompactStyle_Range), forKey: "inputCompactStyle")
			}
		}

		// MARK: - inputCorrectionLevel

		///
		/// The correction level ratio of the generated barcode
		///
		///   minValue: 0.0
		///   maxValue: 8.0
		///
		let inputCorrectionLevel_Range: ClosedRange<Float> = 0.0 ... 8.0
		@objc public var inputCorrectionLevel: NSNumber? {
			get {
				return filter.value(forKey: "inputCorrectionLevel") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCorrectionLevel_Range), forKey: "inputCorrectionLevel")
			}
		}

		// MARK: - inputAlwaysSpecifyCompaction

		///
		/// Force compaction style to @YES or @NO. Set to nil for automatic.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputAlwaysSpecifyCompaction_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputAlwaysSpecifyCompaction: NSNumber? {
			get {
				return filter.value(forKey: "inputAlwaysSpecifyCompaction") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputAlwaysSpecifyCompaction_Range), forKey: "inputAlwaysSpecifyCompaction")
			}
		}
	}
}
