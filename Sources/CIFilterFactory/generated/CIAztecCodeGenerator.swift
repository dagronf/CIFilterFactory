//
//  CIAztecCodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.10, iOS 8, *)
	@inlinable @objc static func AztecCodeGenerator() -> CIFilterFactory.CIAztecCodeGenerator? {
		return CIFilterFactory.CIAztecCodeGenerator()
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Aztec Code Generator
	///
	/// Generate an Aztec barcode image for message data.
	///
	/// **Links**
	///
	/// [CIAztecCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAztecCodeGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAztecCodeGenerator/)
	///
	@objc(CIFilterFactory_CIAztecCodeGenerator) class CIAztecCodeGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CIAztecCodeGenerator")
		}

		// MARK: - Inputs

		///
		/// The message to encode in the Aztec Barcode
		///
		///   Class:    NSData
		@objc public dynamic var inputMessage: NSData? {
			get {
				return self.filter.value(forKey: "inputMessage") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMessage")
			}
		}

		///
		/// Aztec error correction value between 5 and 95
		///
		///   Class:    NSNumber
		///   Default:  23
		///   minValue: 5.0
		///   maxValue: 95.0
		///
		static let inputCorrectionLevel_Range: ClosedRange<Float> = 5.0 ... 95.0
		@objc public dynamic var inputCorrectionLevel: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCorrectionLevel") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIAztecCodeGenerator.inputCorrectionLevel_Range), forKey: "inputCorrectionLevel")
			}
		}

		///
		/// Aztec layers value between 1 and 32. Set to nil for automatic.
		///
		///   Class:    NSNumber
		///   minValue: 1.0
		///   maxValue: 32.0
		///
		static let inputLayers_Range: ClosedRange<Float> = 1.0 ... 32.0
		@objc public dynamic var inputLayers: NSNumber? {
			get {
				return self.filter.value(forKey: "inputLayers") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIAztecCodeGenerator.inputLayers_Range), forKey: "inputLayers")
			}
		}

		///
		/// Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		///
		///   Class:    NSNumber
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputCompactStyle_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputCompactStyle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCompactStyle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIAztecCodeGenerator.inputCompactStyle_Range), forKey: "inputCompactStyle")
			}
		}

		// MARK: - Additional Outputs

		@objc public dynamic var outputCGImage: Any? {
			return self.filter.value(forKey: "outputCGImage")
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputMessage: NSData,
			inputCorrectionLevel: NSNumber = 23,
			inputLayers: NSNumber,
			inputCompactStyle: NSNumber
		) {
			self.init()

			self.inputMessage = inputMessage
			self.inputCorrectionLevel = inputCorrectionLevel
			self.inputLayers = inputLayers
			self.inputCompactStyle = inputCompactStyle
		}
	}
}
