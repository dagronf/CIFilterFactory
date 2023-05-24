//
//  Code128BarcodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Code 128 Barcode Generator
	///
	/// Generate a Code 128 barcode image for message data.
	///
	/// **CIFilter Name**
	/// - CICode128BarcodeGenerator
	///
	/// **Availability**
	/// - macOS 10.10, iOS 8, tvOS 8
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Generator (*CICategoryGenerator*)
	/// - StillImage (*CICategoryStillImage*)
	///
	/// **Documentation Links**
	/// - [CICode128BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICode128BarcodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICode128BarcodeGenerator/)
	/// **Additional output keys**
	/// - outputCGImage
	///
	@available(macOS 10.10, iOS 8, tvOS 8, *)
	@objc(CIFFCode128BarcodeGenerator) class Code128BarcodeGenerator: Core {
		/// Create an instance of the filter with all default values
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
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `0`
		/// - Maximum Value: `100`
		/// - Default Value: `10`
		@objc public var quietSpace: Int {
			get {
				self.intValue(forKey: "inputQuietSpace", defaultValue: Self.quietSpaceDefault)
			}
			set {
				self.setIntValue(newValue, bounds: Code128BarcodeGenerator.quietSpaceRange, forKey: "inputQuietSpace")
			}
		}

		/// `quietSpace` default value
		@objc public static let quietSpaceDefault: Int = 10

		/// `quietSpace` range definition
		public static let quietSpaceRange: ClosedRange<Int> = 0 ... 100

		// MARK: - barcodeHeight (inputBarcodeHeight)

		/// The height of the generated barcode in pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBarcodeHeight`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `1`
		/// - Maximum Value: `500`
		/// - Default Value: `32`
		@objc public var barcodeHeight: Int {
			get {
				self.intValue(forKey: "inputBarcodeHeight", defaultValue: Self.barcodeHeightDefault)
			}
			set {
				self.setIntValue(newValue, bounds: Code128BarcodeGenerator.barcodeHeightRange, forKey: "inputBarcodeHeight")
			}
		}

		/// `barcodeHeight` default value
		@objc public static let barcodeHeightDefault: Int = 32

		/// `barcodeHeight` range definition
		public static let barcodeHeightRange: ClosedRange<Int> = 1 ... 500

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
		///   - message: The message to encode in the Code 128 Barcode
		///   - quietSpace: The number of empty white pixels that should surround the barcode.
		///   - barcodeHeight: The height of the generated barcode in pixels.
		@objc public convenience init?(
			message: Data,
			quietSpace: Int = Code128BarcodeGenerator.quietSpaceDefault,
			barcodeHeight: Int = Code128BarcodeGenerator.barcodeHeightDefault
		) {
			self.init()
			self.message = message
			self.quietSpace = quietSpace
			self.barcodeHeight = barcodeHeight
		}
	}
}

@available(macOS 10.10, iOS 8, tvOS 8, *)
public extension CIImage {
	/// Create a new CIImage using the 'Code 128 Barcode Generator' filter
	///
	/// - Parameters:
	///   - message: The message to encode in the Code 128 Barcode
	///   - quietSpace: The number of empty white pixels that should surround the barcode. (0...100)
	///   - barcodeHeight: The height of the generated barcode in pixels. (1...500)
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generate a Code 128 barcode image for message data.
	///
	/// **Categories**: BuiltIn, Generator, StillImage
	///
	/// **Documentation Links**
	/// - [CICode128BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICode128BarcodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICode128BarcodeGenerator/)
	@inlinable static func createUsingCode128BarcodeGenerator(
		message: Data,
		quietSpace: Int = CIFF.Code128BarcodeGenerator.quietSpaceDefault,
		barcodeHeight: Int = CIFF.Code128BarcodeGenerator.barcodeHeightDefault
	) -> CIImage? {
		return CIFF.Code128BarcodeGenerator(
			message: message,
			quietSpace: quietSpace,
			barcodeHeight: barcodeHeight
		)?.outputImage
	}
}
