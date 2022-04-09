//
//  PDF417BarcodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.11, iOS 9, tvOS 9, *)
@objc public extension CIFF {
	///
	/// PDF417 Barcode Generator
	///
	/// Generate a PDF417 barcode image for message data.
	///
	/// **Links**
	///
	/// - [CIPDF417BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPDF417BarcodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cipdf417barcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPDF417BarcodeGenerator/)
	///
	@available(macOS 10.11, iOS 9, tvOS 9, *)
	@objc(CIFFPDF417BarcodeGenerator) class PDF417BarcodeGenerator: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIPDF417BarcodeGenerator")
		}

		// MARK: - message (inputMessage)

		/// The message to encode in the PDF417 Barcode
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMessage`
		/// - Internal class: `NSData`
		@objc public var message: Data? {
			get {
				let tmp: NSData? = self.keyedValue("inputMessage")
				return tmp as Data?
			}
			set {
				self.setKeyedValue(newValue as NSData?, for: "inputMessage")
			}
		}

		// MARK: - minWidth (inputMinWidth)

		/// The minimum width of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMinWidth`
		/// - Internal class: `NSNumber`
		@objc public var minWidth: NSNumber? {
			get {
				return self.keyedValue("inputMinWidth")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMinWidth")
			}
		}

		// MARK: - maxWidth (inputMaxWidth)

		/// The maximum width of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaxWidth`
		/// - Internal class: `NSNumber`
		@objc public var maxWidth: NSNumber? {
			get {
				return self.keyedValue("inputMaxWidth")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMaxWidth")
			}
		}

		// MARK: - minHeight (inputMinHeight)

		/// The minimum height of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMinHeight`
		/// - Internal class: `NSNumber`
		@objc public var minHeight: NSNumber? {
			get {
				return self.keyedValue("inputMinHeight")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMinHeight")
			}
		}

		// MARK: - maxHeight (inputMaxHeight)

		/// The maximum height of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaxHeight`
		/// - Internal class: `NSNumber`
		@objc public var maxHeight: NSNumber? {
			get {
				return self.keyedValue("inputMaxHeight")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMaxHeight")
			}
		}

		// MARK: - dataColumns (inputDataColumns)

		/// The number of data columns in the generated barcode
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputDataColumns`
		/// - Internal class: `NSNumber`
		@objc public var dataColumns: NSNumber? {
			get {
				return self.keyedValue("inputDataColumns")
			}
			set {
				self.setKeyedValue(newValue, for: "inputDataColumns")
			}
		}

		// MARK: - rows (inputRows)

		/// The number of rows in the generated barcode
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRows`
		/// - Internal class: `NSNumber`
		@objc public var rows: NSNumber? {
			get {
				return self.keyedValue("inputRows")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRows")
			}
		}

		// MARK: - preferredAspectRatio (inputPreferredAspectRatio)

		/// The preferred aspect ratio of the generated barcode
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPreferredAspectRatio`
		/// - Internal class: `NSNumber`
		@objc public var preferredAspectRatio: NSNumber? {
			get {
				return self.keyedValue("inputPreferredAspectRatio")
			}
			set {
				self.setKeyedValue(newValue, for: "inputPreferredAspectRatio")
			}
		}

		// MARK: - compactionMode (inputCompactionMode)

		/// The compaction mode of the generated barcode.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCompactionMode`
		/// - Internal class: `NSNumber`
		@objc public var compactionMode: NSNumber? {
			get {
				return self.keyedValue("inputCompactionMode")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCompactionMode")
			}
		}

		// MARK: - compactStyle (inputCompactStyle)

		/// Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCompactStyle`
		/// - Internal class: `NSNumber`
		@objc public var compactStyle: NSNumber? {
			get {
				return self.keyedValue("inputCompactStyle")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCompactStyle")
			}
		}

		// MARK: - correctionLevel (inputCorrectionLevel)

		/// The correction level ratio of the generated barcode
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCorrectionLevel`
		/// - Internal class: `NSNumber`
		@objc public var correctionLevel: NSNumber? {
			get {
				return self.keyedValue("inputCorrectionLevel")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCorrectionLevel")
			}
		}

		// MARK: - alwaysSpecifyCompaction (inputAlwaysSpecifyCompaction)

		/// Force compaction style to @YES or @NO. Set to nil for automatic.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAlwaysSpecifyCompaction`
		/// - Internal class: `NSNumber`
		@objc public var alwaysSpecifyCompaction: NSNumber? {
			get {
				return self.keyedValue("inputAlwaysSpecifyCompaction")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAlwaysSpecifyCompaction")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			message: Data,
			minWidth: NSNumber,
			maxWidth: NSNumber,
			minHeight: NSNumber,
			maxHeight: NSNumber,
			dataColumns: NSNumber,
			rows: NSNumber,
			preferredAspectRatio: NSNumber,
			compactionMode: NSNumber,
			compactStyle: NSNumber,
			correctionLevel: NSNumber,
			alwaysSpecifyCompaction: NSNumber
		) {
			self.init()
			self.message = message
			self.minWidth = minWidth
			self.maxWidth = maxWidth
			self.minHeight = minHeight
			self.maxHeight = maxHeight
			self.dataColumns = dataColumns
			self.rows = rows
			self.preferredAspectRatio = preferredAspectRatio
			self.compactionMode = compactionMode
			self.compactStyle = compactStyle
			self.correctionLevel = correctionLevel
			self.alwaysSpecifyCompaction = alwaysSpecifyCompaction
		}
	}
}
