//
//  BarcodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.13, iOS 11, tvOS 11, *)
@objc public extension CIFF {
	///
	/// Barcode Generator
	///
	/// Generate a barcode image from a CIBarcodeDescriptor.
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryGenerator
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Links**
	/// - [CIBarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBarcodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cibarcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBarcodeGenerator/)
	///
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFBarcodeGenerator) class BarcodeGenerator: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIBarcodeGenerator")
		}

		// MARK: - barcodeDescriptor (inputBarcodeDescriptor)

		/// The CIBarcodeDescription object to generate an image for.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBarcodeDescriptor`
		/// - Internal class: `CIBarcodeDescriptor`
		@objc public var barcodeDescriptor: CIBarcodeDescriptor? {
			get {
				return self.keyedValue("inputBarcodeDescriptor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBarcodeDescriptor")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			barcodeDescriptor: CIBarcodeDescriptor)
		{
			self.init()
			self.barcodeDescriptor = barcodeDescriptor
		}
	}
}
