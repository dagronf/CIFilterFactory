//
//  PDF417BarcodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// PDF417 Barcode Generator
	///
	/// Generate a PDF417 barcode image for message data.
	///
	/// **CIFilter Name**
	/// - CIPDF417BarcodeGenerator
	///
	/// **Availability**
	/// - macOS 10.11, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Generator (*CICategoryGenerator*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIPDF417BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPDF417BarcodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPDF417BarcodeGenerator/)
	/// **Additional output keys**
	/// - outputCGImage
	///
	@available(macOS 10.11, iOS 9, tvOS 9, *)
	@objc(CIFFPDF417BarcodeGenerator) class PDF417BarcodeGenerator: Core {
		/// Create an instance of the filter with all default values
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
				self.dataValue(forKey: "inputMessage")
			}
			set {
				self.setKeyedValue(newValue as? NSData, for: "inputMessage")
			}
		}

		// MARK: - minWidth (inputMinWidth)

		/// The minimum width of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMinWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `56`
		/// - Maximum Value: `583`
		@objc public var minWidth: Int {
			get {
				self.intValue(forKey: "inputMinWidth", defaultValue: Self.minWidthDefault)
			}
			set {
				self.setIntValue(newValue, bounds: PDF417BarcodeGenerator.minWidthRange, forKey: "inputMinWidth")
			}
		}

		/// `minWidth` default value
		@objc public static let minWidthDefault: Int = 0

		/// `minWidth` range definition
		public static let minWidthRange: ClosedRange<Int> = 56 ... 583

		// MARK: - maxWidth (inputMaxWidth)

		/// The maximum width of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaxWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `56`
		/// - Maximum Value: `583`
		@objc public var maxWidth: Int {
			get {
				self.intValue(forKey: "inputMaxWidth", defaultValue: Self.maxWidthDefault)
			}
			set {
				self.setIntValue(newValue, bounds: PDF417BarcodeGenerator.maxWidthRange, forKey: "inputMaxWidth")
			}
		}

		/// `maxWidth` default value
		@objc public static let maxWidthDefault: Int = 0

		/// `maxWidth` range definition
		public static let maxWidthRange: ClosedRange<Int> = 56 ... 583

		// MARK: - minHeight (inputMinHeight)

		/// The minimum height of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMinHeight`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `13`
		/// - Maximum Value: `283`
		@objc public var minHeight: Int {
			get {
				self.intValue(forKey: "inputMinHeight", defaultValue: Self.minHeightDefault)
			}
			set {
				self.setIntValue(newValue, bounds: PDF417BarcodeGenerator.minHeightRange, forKey: "inputMinHeight")
			}
		}

		/// `minHeight` default value
		@objc public static let minHeightDefault: Int = 0

		/// `minHeight` range definition
		public static let minHeightRange: ClosedRange<Int> = 13 ... 283

		// MARK: - maxHeight (inputMaxHeight)

		/// The maximum height of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaxHeight`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `13`
		/// - Maximum Value: `283`
		@objc public var maxHeight: Int {
			get {
				self.intValue(forKey: "inputMaxHeight", defaultValue: Self.maxHeightDefault)
			}
			set {
				self.setIntValue(newValue, bounds: PDF417BarcodeGenerator.maxHeightRange, forKey: "inputMaxHeight")
			}
		}

		/// `maxHeight` default value
		@objc public static let maxHeightDefault: Int = 0

		/// `maxHeight` range definition
		public static let maxHeightRange: ClosedRange<Int> = 13 ... 283

		// MARK: - dataColumns (inputDataColumns)

		/// The number of data columns in the generated barcode
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputDataColumns`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `1`
		/// - Maximum Value: `30`
		@objc public var dataColumns: Int {
			get {
				self.intValue(forKey: "inputDataColumns", defaultValue: Self.dataColumnsDefault)
			}
			set {
				self.setIntValue(newValue, bounds: PDF417BarcodeGenerator.dataColumnsRange, forKey: "inputDataColumns")
			}
		}

		/// `dataColumns` default value
		@objc public static let dataColumnsDefault: Int = 0

		/// `dataColumns` range definition
		public static let dataColumnsRange: ClosedRange<Int> = 1 ... 30

		// MARK: - rows (inputRows)

		/// The number of rows in the generated barcode
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRows`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `3`
		/// - Maximum Value: `90`
		@objc public var rows: Int {
			get {
				self.intValue(forKey: "inputRows", defaultValue: Self.rowsDefault)
			}
			set {
				self.setIntValue(newValue, bounds: PDF417BarcodeGenerator.rowsRange, forKey: "inputRows")
			}
		}

		/// `rows` default value
		@objc public static let rowsDefault: Int = 0

		/// `rows` range definition
		public static let rowsRange: ClosedRange<Int> = 3 ... 90

		// MARK: - preferredAspectRatio (inputPreferredAspectRatio)

		/// The preferred aspect ratio of the generated barcode
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPreferredAspectRatio`
		/// - Internal class: `NSNumber`
		@objc public var preferredAspectRatio: NSNumber? {
			get {
				self.keyedValue("inputPreferredAspectRatio")
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
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `0`
		/// - Maximum Value: `3`
		@objc public var compactionMode: Int {
			get {
				self.intValue(forKey: "inputCompactionMode", defaultValue: Self.compactionModeDefault)
			}
			set {
				self.setIntValue(newValue, bounds: PDF417BarcodeGenerator.compactionModeRange, forKey: "inputCompactionMode")
			}
		}

		/// `compactionMode` default value
		@objc public static let compactionModeDefault: Int = 0

		/// `compactionMode` range definition
		public static let compactionModeRange: ClosedRange<Int> = 0 ... 3

		// MARK: - compactStyle (inputCompactStyle)

		/// Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCompactStyle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var compactStyle: Bool {
			get {
				self.boolValue(forKey: "inputCompactStyle", defaultValue: Self.compactStyleDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputCompactStyle")
			}
		}

		/// `compactStyle` default value
		@objc public static let compactStyleDefault: Bool = false

		// MARK: - correctionLevel (inputCorrectionLevel)

		/// The correction level ratio of the generated barcode
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCorrectionLevel`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `0`
		/// - Maximum Value: `8`
		@objc public var correctionLevel: Int {
			get {
				self.intValue(forKey: "inputCorrectionLevel", defaultValue: Self.correctionLevelDefault)
			}
			set {
				self.setIntValue(newValue, bounds: PDF417BarcodeGenerator.correctionLevelRange, forKey: "inputCorrectionLevel")
			}
		}

		/// `correctionLevel` default value
		@objc public static let correctionLevelDefault: Int = 0

		/// `correctionLevel` range definition
		public static let correctionLevelRange: ClosedRange<Int> = 0 ... 8

		// MARK: - alwaysSpecifyCompaction (inputAlwaysSpecifyCompaction)

		/// Force compaction style to @YES or @NO. Set to nil for automatic.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAlwaysSpecifyCompaction`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var alwaysSpecifyCompaction: Bool {
			get {
				self.boolValue(forKey: "inputAlwaysSpecifyCompaction", defaultValue: Self.alwaysSpecifyCompactionDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputAlwaysSpecifyCompaction")
			}
		}

		/// `alwaysSpecifyCompaction` default value
		@objc public static let alwaysSpecifyCompactionDefault: Bool = false

		// MARK: - Additional output keys

		@objc public var outputCGImage: Unmanaged<CGImage>? {
			let value = self.filter.perform(#selector(getter: AdditionalOutputsFilterDescriptor.outputCGImage))
			if let obj = value?.takeUnretainedValue() {
				return Unmanaged.passUnretained(obj as! CGImage)
			}
			return nil
		}

		// A hidden class for extracting any additional output objects
		private final class AdditionalOutputsFilterDescriptor: NSObject {
			@objc var outputCGImage: Unmanaged<AnyObject>?
		}

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - message: The message to encode in the PDF417 Barcode
		///   - minWidth: The minimum width of the generated barcode in pixels.
		///   - maxWidth: The maximum width of the generated barcode in pixels.
		///   - minHeight: The minimum height of the generated barcode in pixels.
		///   - maxHeight: The maximum height of the generated barcode in pixels.
		///   - dataColumns: The number of data columns in the generated barcode
		///   - rows: The number of rows in the generated barcode
		///   - preferredAspectRatio: The preferred aspect ratio of the generated barcode
		///   - compactionMode: The compaction mode of the generated barcode.
		///   - compactStyle: Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		///   - correctionLevel: The correction level ratio of the generated barcode
		///   - alwaysSpecifyCompaction: Force compaction style to @YES or @NO. Set to nil for automatic.
		@objc public convenience init?(
			message: Data,
			minWidth: Int,
			maxWidth: Int,
			minHeight: Int,
			maxHeight: Int,
			dataColumns: Int,
			rows: Int,
			preferredAspectRatio: NSNumber,
			compactionMode: Int,
			compactStyle: Bool = PDF417BarcodeGenerator.compactStyleDefault,
			correctionLevel: Int,
			alwaysSpecifyCompaction: Bool = PDF417BarcodeGenerator.alwaysSpecifyCompactionDefault
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

@available(macOS 10.11, iOS 9, tvOS 9, *)
public extension CIImage {
	/// Create a new CIImage using the 'PDF417 Barcode Generator' filter
	///
	/// - Parameters:
	///   - message: The message to encode in the PDF417 Barcode
	///   - minWidth: The minimum width of the generated barcode in pixels. (56...583)
	///   - maxWidth: The maximum width of the generated barcode in pixels. (56...583)
	///   - minHeight: The minimum height of the generated barcode in pixels. (13...283)
	///   - maxHeight: The maximum height of the generated barcode in pixels. (13...283)
	///   - dataColumns: The number of data columns in the generated barcode (1...30)
	///   - rows: The number of rows in the generated barcode (3...90)
	///   - preferredAspectRatio: The preferred aspect ratio of the generated barcode
	///   - compactionMode: The compaction mode of the generated barcode. (0...3)
	///   - compactStyle: Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
	///   - correctionLevel: The correction level ratio of the generated barcode (0...8)
	///   - alwaysSpecifyCompaction: Force compaction style to @YES or @NO. Set to nil for automatic.
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generate a PDF417 barcode image for message data.
	///
	/// **Categories**: BuiltIn, Generator, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIPDF417BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPDF417BarcodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPDF417BarcodeGenerator/)
	@inlinable static func createUsingPDF417BarcodeGenerator(
		message: Data,
		minWidth: Int,
		maxWidth: Int,
		minHeight: Int,
		maxHeight: Int,
		dataColumns: Int,
		rows: Int,
		preferredAspectRatio: NSNumber,
		compactionMode: Int,
		compactStyle: Bool = CIFF.PDF417BarcodeGenerator.compactStyleDefault,
		correctionLevel: Int,
		alwaysSpecifyCompaction: Bool = CIFF.PDF417BarcodeGenerator.alwaysSpecifyCompactionDefault
	) -> CIImage? {
		return CIFF.PDF417BarcodeGenerator(
			message: message,
			minWidth: minWidth,
			maxWidth: maxWidth,
			minHeight: minHeight,
			maxHeight: maxHeight,
			dataColumns: dataColumns,
			rows: rows,
			preferredAspectRatio: preferredAspectRatio,
			compactionMode: compactionMode,
			compactStyle: compactStyle,
			correctionLevel: correctionLevel,
			alwaysSpecifyCompaction: alwaysSpecifyCompaction
		)?.outputImage
	}
}
