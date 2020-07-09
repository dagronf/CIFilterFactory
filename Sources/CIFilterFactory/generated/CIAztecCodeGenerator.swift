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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

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
	@objc(CIFilterFactory_CIAztecCodeGenerator) class CIAztecCodeGenerator: Core {
		@objc public init?() {
			super.init(name: "CIAztecCodeGenerator")
			filter.setDefaults()
		}

		// MARK: - inputMessage

		///
		/// The message to encode in the Aztec Barcode
		///
		@objc public var inputMessage: NSData? {
			get {
				return filter.value(forKey: "inputMessage") as? NSData
			}
			set {
				filter.setValue(newValue, forKey: "inputMessage")
			}
		}

		// MARK: - inputCorrectionLevel

		///
		/// Aztec error correction value between 5 and 95
		///
		///   minValue: 5.0
		///   maxValue: 95.0
		///
		let inputCorrectionLevel_Range: ClosedRange<Float> = 5.0 ... 95.0
		@objc public var inputCorrectionLevel: NSNumber? {
			get {
				return filter.value(forKey: "inputCorrectionLevel") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCorrectionLevel_Range), forKey: "inputCorrectionLevel")
			}
		}

		// MARK: - inputLayers

		///
		/// Aztec layers value between 1 and 32. Set to nil for automatic.
		///
		///   minValue: 1.0
		///   maxValue: 32.0
		///
		let inputLayers_Range: ClosedRange<Float> = 1.0 ... 32.0
		@objc public var inputLayers: NSNumber? {
			get {
				return filter.value(forKey: "inputLayers") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputLayers_Range), forKey: "inputLayers")
			}
		}

		// MARK: - inputCompactStyle

		///
		/// Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputCompactStyle_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputCompactStyle: NSNumber? {
			get {
				return filter.value(forKey: "inputCompactStyle") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCompactStyle_Range), forKey: "inputCompactStyle")
			}
		}
	}
}