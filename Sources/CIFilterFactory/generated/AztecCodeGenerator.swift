//
//  AztecCodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Aztec Code Generator
	///
	/// Generate an Aztec barcode image for message data.
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
	/// - [CIAztecCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAztecCodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciazteccodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAztecCodeGenerator/)
	///
	/// **Additional output keys**
	/// - outputCGImage
	///
	@available(macOS 10.10, iOS 8, tvOS 8, *)
	@objc(CIFFAztecCodeGenerator) class AztecCodeGenerator: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIAztecCodeGenerator")
		}

		// MARK: - message (inputMessage)

		/// The message to encode in the Aztec Barcode
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

		// MARK: - correctionLevel (inputCorrectionLevel)

		/// Aztec error correction value between 5 and 95
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

		// MARK: - layers (inputLayers)

		/// Aztec layers value between 1 and 32. Set to nil for automatic.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLayers`
		/// - Internal class: `NSNumber`
		@objc public var layers: NSNumber? {
			get {
				return self.keyedValue("inputLayers")
			}
			set {
				self.setKeyedValue(newValue, for: "inputLayers")
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

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			message: Data,
			correctionLevel: NSNumber,
			layers: NSNumber,
			compactStyle: NSNumber
		) {
			self.init()
			self.message = message
			self.correctionLevel = correctionLevel
			self.layers = layers
			self.compactStyle = compactStyle
		}
	}
}
