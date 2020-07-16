//
//  CICode128BarcodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Code 128 Barcode Generator
	///
	/// Generate a Code 128 barcode image for message data.
	///
	/// **Links**
	///
	/// [CICode128BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICode128BarcodeGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICode128BarcodeGenerator/)
	///
	@objc(CIFilterFactory_CICode128BarcodeGenerator) class CICode128BarcodeGenerator: FilterCommon {
		@objc public init?() {
			super.init(name: "CICode128BarcodeGenerator")
		}

		// MARK: - inputMessage

		///
		/// The message to encode in the Code 128 Barcode
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

		// MARK: - inputQuietSpace

		///
		/// The number of empty white pixels that should surround the barcode.
		///
		///   Class: NSNumber, Type: CIAttributeTypeScalar
		///
		///   minValue: 0.0
		///   maxValue: 100.0
		///
		let inputQuietSpace_Range: ClosedRange<Float> = 0.0 ... 100.0
		@objc public var inputQuietSpace: NSNumber? {
			get {
				return self.filter.value(forKey: "inputQuietSpace") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputQuietSpace_Range), forKey: "inputQuietSpace")
			}
		}

		// MARK: - inputBarcodeHeight

		///
		/// The height of the generated barcode in pixels.
		///
		///   Class: NSNumber, Type: CIAttributeTypeScalar
		///
		///   minValue: 1.0
		///   maxValue: 500.0
		///
		let inputBarcodeHeight_Range: ClosedRange<Float> = 1.0 ... 500.0
		@objc public var inputBarcodeHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBarcodeHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputBarcodeHeight_Range), forKey: "inputBarcodeHeight")
			}
		}
	}
}
