//
//  CIQRCodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

public extension CIFilter {
	@available(macOS 10.9, iOS 7, *)
	@inlinable @objc static func QRCodeGenerator() -> CIFilterFactory.CIQRCodeGenerator? {
		return CIFilterFactory.CIQRCodeGenerator()
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// QR Code Generator
	///
	/// Generate a QR Code image for message data.
	///
	/// **Links**
	///
	/// [CIQRCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIQRCodeGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIQRCodeGenerator/)
	///
	@objc(CIFilterFactory_CIQRCodeGenerator) class CIQRCodeGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CIQRCodeGenerator")
		}

		// MARK: - Inputs

		///
		/// The message to encode in the QR Code
		///
		///   Class:    NSData
		@objc public dynamic var inputMessage: NSData? {
			get {
				return self.keyedValue("inputMessage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMessage")
			}
		}

		///
		/// QR Code correction level L, M, Q, or H.
		///
		///   Class:    NSString
		///   Default:  M
		@objc public dynamic var inputCorrectionLevel: NSString? {
			get {
				return self.keyedValue("inputCorrectionLevel")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCorrectionLevel")
			}
		}

		// MARK: - Additional Outputs

		@objc public dynamic var outputCGImage: Any? {
			return self.filter.value(forKey: "outputCGImage")
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputMessage: NSData,
			inputCorrectionLevel: NSString = "M"
		) {
			self.init()

			self.inputMessage = inputMessage
			self.inputCorrectionLevel = inputCorrectionLevel
		}
	}
}
