//
//  QRCodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.9, iOS 7, tvOS 7, *)
@objc public extension CIFF {
	///
	/// QR Code Generator
	///
	/// Generate a QR Code image for message data.
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryGenerator
	/// - CICategoryStillImage
	///
	/// **Links**
	/// - [CIQRCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIQRCodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIQRCodeGenerator/)
	///
	@available(macOS 10.9, iOS 7, tvOS 7, *)
	@objc(CIFFQRCodeGenerator) class QRCodeGenerator: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIQRCodeGenerator")
		}

		// MARK: - message (inputMessage)

		/// The message to encode in the QR Code
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

		// MARK: - correctionLevel (inputCorrectionLevel)

		/// QR Code correction level L, M, Q, or H.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCorrectionLevel`
		/// - Internal class: `NSString`
		@objc public var correctionLevel: String? {
			get {
				let tmp: NSString? = self.keyedValue("inputCorrectionLevel")
				return tmp as String?
			}
			set {
				self.setKeyedValue(newValue as NSString?, for: "inputCorrectionLevel")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			message: Data,
			correctionLevel: String
		) {
			self.init()
			self.message = message
			self.correctionLevel = correctionLevel
		}
	}
}
