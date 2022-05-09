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

@objc public extension CIFF {
	///
	/// Code 128 Barcode Generator
	///
	/// Generate a Code 128 barcode image for message data.
	///
	/// **Availability**
	/// - macOS 10.10, iOS 8, tvOS 8
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryGenerator
	/// - CICategoryStillImage
	///
	/// **Documentation Links**
	/// - [CICode128BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICode128BarcodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicode128barcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICode128BarcodeGenerator/)
	///
	/// **Additional output keys**
	/// - outputCGImage
	///
	@available(macOS 10.10, iOS 8, tvOS 8, *)
	@objc(CIFFCode128BarcodeGenerator) class Code128BarcodeGenerator: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CICode128BarcodeGenerator")
		}

		// MARK: - message (inputMessage)

		/// The message to encode in the Code 128 Barcode
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

		// MARK: - quietSpace (inputQuietSpace)

		/// The number of empty white pixels that should surround the barcode.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputQuietSpace`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `100.0`
		/// - Default Value: `10.0`
		@objc public var quietSpace: Double {
			get {
				self.doubleValue(forKey: "inputQuietSpace", defaultValue: Self.quietSpaceDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: Code128BarcodeGenerator.quietSpaceRange, forKey: "inputQuietSpace")
			}
		}

		/// `quietSpace` default value
		@objc public static let quietSpaceDefault: Double = 10.0

		/// `quietSpace` range definition
		public static let quietSpaceRange: ClosedRange<Double> = 0.0 ... 100.0

		// MARK: - barcodeHeight (inputBarcodeHeight)

		/// The height of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBarcodeHeight`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `1.0`
		/// - Maximum Value: `500.0`
		/// - Default Value: `32.0`
		@objc public var barcodeHeight: Double {
			get {
				self.doubleValue(forKey: "inputBarcodeHeight", defaultValue: Self.barcodeHeightDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: Code128BarcodeGenerator.barcodeHeightRange, forKey: "inputBarcodeHeight")
			}
		}

		/// `barcodeHeight` default value
		@objc public static let barcodeHeightDefault: Double = 32.0

		/// `barcodeHeight` range definition
		public static let barcodeHeightRange: ClosedRange<Double> = 1.0 ... 500.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			message: Data,
			quietSpace: Double = Code128BarcodeGenerator.quietSpaceDefault,
			barcodeHeight: Double = Code128BarcodeGenerator.barcodeHeightDefault
		) {
			self.init()
			self.message = message
			self.quietSpace = quietSpace
			self.barcodeHeight = barcodeHeight
		}
	}
}
