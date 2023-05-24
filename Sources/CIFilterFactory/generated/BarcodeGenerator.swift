//
//  BarcodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Barcode Generator
	///
	/// Generate a barcode image from a CIBarcodeDescriptor.
	///
	/// **CIFilter Name**
	/// - CIBarcodeGenerator
	///
	/// **Availability**
	/// - macOS 10.13, iOS 11, tvOS 11
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - Generator (*CICategoryGenerator*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIBarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBarcodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBarcodeGenerator/)
	/// **Additional output keys**
	/// - outputCGImageForQRCodeDescriptor
	/// - outputCGImageForAztecCodeDescriptor
	/// - outputCGImageForPDF417CodeDescriptor
	/// - outputCGImageForDataMatrixCodeDescriptor
	/// - outputCGImage
	///
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFBarcodeGenerator) class BarcodeGenerator: Core {
		/// Create an instance of the filter with all default values
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
				self.keyedValue("inputBarcodeDescriptor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputBarcodeDescriptor")
			}
		}

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
		///   - barcodeDescriptor: The CIBarcodeDescription object to generate an image for.
		@objc public convenience init?(
			barcodeDescriptor: CIBarcodeDescriptor
		) {
			self.init()
			self.barcodeDescriptor = barcodeDescriptor
		}
	}
}

@available(macOS 10.13, iOS 11, tvOS 11, *)
public extension CIImage {
	/// Create a new CIImage using the 'Barcode Generator' filter
	///
	/// - Parameters:
	///   - barcodeDescriptor: The CIBarcodeDescription object to generate an image for.
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generate a barcode image from a CIBarcodeDescriptor.
	///
	/// **Categories**: BuiltIn, Generator, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIBarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBarcodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIBarcodeGenerator/)
	@inlinable static func createUsingBarcodeGenerator(
		barcodeDescriptor: CIBarcodeDescriptor
	) -> CIImage? {
		return CIFF.BarcodeGenerator(
			barcodeDescriptor: barcodeDescriptor
		)?.outputImage
	}
}
