//
//  Code128BarcodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.10, iOS 8, tvOS 8, *)
@objc public extension CIFF {
	///
	/// Code 128 Barcode Generator
	///
	/// Generate a Code 128 barcode image for message data.
	///
	/// **Links**
	///
	/// - [CICode128BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICode128BarcodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicode128barcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICode128BarcodeGenerator/)
	///
	@available(macOS 10.10, iOS 8, tvOS 8, *)
	@objc(CIFFCode128BarcodeGenerator) class Code128BarcodeGenerator: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CICode128BarcodeGenerator")
		}

		// MARK: - Inputs

		// MARK: - message (inputMessage)

		/// The message to encode in the Code 128 Barcode
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

		// MARK: - quietSpace (inputQuietSpace)

		/// The number of empty white pixels that should surround the barcode.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputQuietSpace`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `10`
		/// - Minimum value: `0.0`
		/// - Maximum value: `100.0`
		@objc public var quietSpace: Double {
			get {
				let number = self.filter.value(forKey: "inputQuietSpace") as? NSNumber
				return number?.doubleValue ?? 10
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: Code128BarcodeGenerator.quietSpaceRange)
				self.filter.setValue(number, forKey: "inputQuietSpace")
			}
		}

		/// `quietSpace` range definition
		public static let quietSpaceRange: ClosedRange<Double> = 0.0 ... 100.0

		// MARK: - barcodeHeight (inputBarcodeHeight)

		/// The height of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBarcodeHeight`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `32`
		/// - Minimum value: `1.0`
		/// - Maximum value: `500.0`
		@objc public var barcodeHeight: Double {
			get {
				let number = self.filter.value(forKey: "inputBarcodeHeight") as? NSNumber
				return number?.doubleValue ?? 32
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: Code128BarcodeGenerator.barcodeHeightRange)
				self.filter.setValue(number, forKey: "inputBarcodeHeight")
			}
		}

		/// `barcodeHeight` range definition
		public static let barcodeHeightRange: ClosedRange<Double> = 1.0 ... 500.0

		// MARK: - Additional Outputs

		@objc public var outputCGImage: Any? {
			return self.filter.value(forKey: "outputCGImage")
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			message: Data,
			quietSpace: Double = 10,
			barcodeHeight: Double = 32
		) {
			self.init()

			self.message = message
			self.quietSpace = quietSpace
			self.barcodeHeight = barcodeHeight
		}
	}
}
