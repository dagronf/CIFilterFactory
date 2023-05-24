//
//  AztecCodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Aztec Code Generator
	///
	/// Generate an Aztec barcode image for message data.
	///
	/// **CIFilter Name**
	/// - CIAztecCodeGenerator
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
	/// - [CIAztecCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAztecCodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAztecCodeGenerator/)
	/// **Additional output keys**
	/// - outputCGImage
	///
	@available(macOS 10.10, iOS 8, tvOS 8, *)
	@objc(CIFFAztecCodeGenerator) class AztecCodeGenerator: Core {
		/// Create an instance of the filter with all default values
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
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `5`
		/// - Maximum Value: `95`
		/// - Default Value: `23`
		@objc public var correctionLevel: Int {
			get {
				self.intValue(forKey: "inputCorrectionLevel", defaultValue: Self.correctionLevelDefault)
			}
			set {
				self.setIntValue(newValue, bounds: AztecCodeGenerator.correctionLevelRange, forKey: "inputCorrectionLevel")
			}
		}

		/// `correctionLevel` default value
		@objc public static let correctionLevelDefault: Int = 23

		/// `correctionLevel` range definition
		public static let correctionLevelRange: ClosedRange<Int> = 5 ... 95

		// MARK: - layers (inputLayers)

		/// Aztec layers value between 1 and 32. Set to nil for automatic.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLayers`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `1`
		/// - Maximum Value: `32`
		@objc public var layers: Int {
			get {
				self.intValue(forKey: "inputLayers", defaultValue: Self.layersDefault)
			}
			set {
				self.setIntValue(newValue, bounds: AztecCodeGenerator.layersRange, forKey: "inputLayers")
			}
		}

		/// `layers` default value
		@objc public static let layersDefault: Int = 0

		/// `layers` range definition
		public static let layersRange: ClosedRange<Int> = 1 ... 32

		// MARK: - compactStyle (inputCompactStyle)

		/// Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCompactStyle`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var compactStyle: Bool {
			get {
				self.boolValue(forKey: "inputCompactStyle", defaultValue: Self.compactStyleDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputCompactStyle")
			}
		}

		/// `compactStyle` default value
		@objc public static let compactStyleDefault: Bool = false

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
		///   - message: The message to encode in the Aztec Barcode
		///   - correctionLevel: Aztec error correction value between 5 and 95
		///   - layers: Aztec layers value between 1 and 32. Set to nil for automatic.
		///   - compactStyle: Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		@objc public convenience init?(
			message: Data,
			correctionLevel: Int = AztecCodeGenerator.correctionLevelDefault,
			layers: Int,
			compactStyle: Bool = AztecCodeGenerator.compactStyleDefault
		) {
			self.init()
			self.message = message
			self.correctionLevel = correctionLevel
			self.layers = layers
			self.compactStyle = compactStyle
		}
	}
}

@available(macOS 10.10, iOS 8, tvOS 8, *)
public extension CIImage {
	/// Create a new CIImage using the 'Aztec Code Generator' filter
	///
	/// - Parameters:
	///   - message: The message to encode in the Aztec Barcode
	///   - correctionLevel: Aztec error correction value between 5 and 95 (5...95)
	///   - layers: Aztec layers value between 1 and 32. Set to nil for automatic. (1...32)
	///   - compactStyle: Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
	/// - Returns: A new image by running the filter, or nil if the image could not be created
	///
	/// Generate an Aztec barcode image for message data.
	///
	/// **Categories**: BuiltIn, Generator, StillImage
	///
	/// **Documentation Links**
	/// - [CIAztecCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAztecCodeGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAztecCodeGenerator/)
	@inlinable static func createUsingAztecCodeGenerator(
		message: Data,
		correctionLevel: Int = CIFF.AztecCodeGenerator.correctionLevelDefault,
		layers: Int,
		compactStyle: Bool = CIFF.AztecCodeGenerator.compactStyleDefault
	) -> CIImage? {
		return CIFF.AztecCodeGenerator(
			message: message,
			correctionLevel: correctionLevel,
			layers: layers,
			compactStyle: compactStyle
		)?.outputImage
	}
}
