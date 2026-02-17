//
//  RoundedQRCodeGenerator.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2026 Darren Ford. All rights reserved.
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

#if canImport(CoreImage)

	import AVFoundation
	import CoreImage
	import CoreML
	import Foundation

	@objc public extension CIFF {
		/// Rounded QR Code Generator
		///
		/// Generate a QR Code image for message data.
		///
		/// **CIFilter Name**
		/// - CIRoundedQRCodeGenerator
		///
		/// **Availability**
		/// - macOS 16.0, iOS 19, tvOS 19
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - Generator (*CICategoryGenerator*)
		/// - StillImage (*CICategoryStillImage*)
		///
		/// **Documentation Links**
		/// - [CIRoundedQRCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRoundedQRCodeGenerator)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciroundedqrcodegenerator)
		/// - [CIFilter.app documentation](https://cifilter.app/CIRoundedQRCodeGenerator/)
		/// **Additional output keys**
		/// - outputCGImage
		///
		@available(macOS 16.0, iOS 19, tvOS 19, *)
		@objc(CIFFRoundedQRCodeGenerator) class RoundedQRCodeGenerator: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIRoundedQRCodeGenerator")
			}

			// MARK: - message (inputMessage)

			/// The message to encode in the QR Code
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

			/// QR Code correction level L, M, Q, or H.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputCorrectionLevel`
			/// - Internal class: `NSString`
			@objc public var correctionLevel: String? {
				get {
					self.stringValue(forKey: "inputCorrectionLevel")
				}
				set {
					self.setKeyedValue(newValue as? NSString, for: "inputCorrectionLevel")
				}
			}

			// MARK: - scale (inputScale)

			/// The scale factor to enlarge the QRCode by.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputScale`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeScalar`
			/// - Minimum Value: `8.0`
			/// - Maximum Value: `64.0`
			/// - Default Value: `16.0`
			@objc public var scale: Double {
				get {
					self.doubleValue(forKey: "inputScale", defaultValue: Self.scaleDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: RoundedQRCodeGenerator.scaleRange, forKey: "inputScale")
				}
			}

			/// `scale` default value
			@objc public static let scaleDefault: Double = 16.0

			/// `scale` range definition
			public static let scaleRange: ClosedRange<Double> = 8.0 ... 64.0

			// MARK: - roundedMarkers (inputRoundedMarkers)

			/// If 1, then the Finder Patterns in the QRCode should have a rounded appearance. If 2, then the Alignment Patterns will also be rounded
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputRoundedMarkers`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeInteger`
			/// - Minimum Value: `0`
			/// - Maximum Value: `2`
			/// - Default Value: `1`
			@objc public var roundedMarkers: Int {
				get {
					self.intValue(forKey: "inputRoundedMarkers", defaultValue: Self.roundedMarkersDefault)
				}
				set {
					self.setIntValue(newValue, bounds: RoundedQRCodeGenerator.roundedMarkersRange, forKey: "inputRoundedMarkers")
				}
			}

			/// `roundedMarkers` default value
			@objc public static let roundedMarkersDefault: Int = 1

			/// `roundedMarkers` range definition
			public static let roundedMarkersRange: ClosedRange<Int> = 0 ... 2

			// MARK: - roundedData (inputRoundedData)

			/// If true then the data points in the QRCode should have a rounded appearance.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputRoundedData`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeBoolean`
			/// - Default Value: `false`
			@objc public var roundedData: Bool {
				get {
					self.boolValue(forKey: "inputRoundedData", defaultValue: Self.roundedDataDefault)
				}
				set {
					self.setBoolValue(newValue, forKey: "inputRoundedData")
				}
			}

			/// `roundedData` default value
			@objc public static let roundedDataDefault: Bool = false

			// MARK: - centerSpaceSize (inputCenterSpaceSize)

			/// The fraction of the center space of the QRCode to fill with Color 1. If the size is 0.0 or the Correction Level is L or M, the center of the QRCode will be unaltered. The size will be limited to 0.25 if the Correction Level is Q. The size will be limited to 0.33 if the Correction Level is H.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputCenterSpaceSize`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeScalar`
			/// - Minimum Value: `0.0`
			/// - Maximum Value: `0.3333333333333333`
			/// - Default Value: `0.25`
			@objc public var centerSpaceSize: Double {
				get {
					self.doubleValue(forKey: "inputCenterSpaceSize", defaultValue: Self.centerSpaceSizeDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: RoundedQRCodeGenerator.centerSpaceSizeRange, forKey: "inputCenterSpaceSize")
				}
			}

			/// `centerSpaceSize` default value
			@objc public static let centerSpaceSizeDefault: Double = 0.25

			/// `centerSpaceSize` range definition
			public static let centerSpaceSizeRange: ClosedRange<Double> = 0.0 ... 0.3333333333333333

			// MARK: - color0 (inputColor0)

			/// The background color for the QRCode
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputColor0`
			/// - Internal class: `CIColor`
			/// - Type: `CIAttributeTypeColor`
			@objc public var color0: CIColor? {
				get {
					self.keyedValue("inputColor0")
				}
				set {
					self.setKeyedValue(newValue, for: "inputColor0")
				}
			}

			// MARK: - color1 (inputColor1)

			/// The foreground color for the QRCode
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputColor1`
			/// - Internal class: `CIColor`
			/// - Type: `CIAttributeTypeColor`
			@objc public var color1: CIColor? {
				get {
					self.keyedValue("inputColor1")
				}
				set {
					self.setKeyedValue(newValue, for: "inputColor1")
				}
			}

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - message: The message to encode in the QR Code
			///   - correctionLevel: QR Code correction level L, M, Q, or H.
			///   - scale: The scale factor to enlarge the QRCode by.
			///   - roundedMarkers: If 1, then the Finder Patterns in the QRCode should have a rounded appearance. If 2, then the Alignment Patterns will also be rounded
			///   - roundedData: If true then the data points in the QRCode should have a rounded appearance.
			///   - centerSpaceSize: The fraction of the center space of the QRCode to fill with Color 1. If the size is 0.0 or the Correction Level is L or M, the center of the QRCode will be unaltered. The size will be limited to 0.25 if the Correction Level is Q. The size will be limited to 0.33 if the Correction Level is H.
			///   - color0: The background color for the QRCode
			///   - color1: The foreground color for the QRCode
			@objc public convenience init?(
				message: Data,
				correctionLevel: String,
				scale: Double = RoundedQRCodeGenerator.scaleDefault,
				roundedMarkers: Int = RoundedQRCodeGenerator.roundedMarkersDefault,
				roundedData: Bool = RoundedQRCodeGenerator.roundedDataDefault,
				centerSpaceSize: Double = RoundedQRCodeGenerator.centerSpaceSizeDefault,
				color0: CIColor,
				color1: CIColor
			) {
				self.init()
				self.message = message
				self.correctionLevel = correctionLevel
				self.scale = scale
				self.roundedMarkers = roundedMarkers
				self.roundedData = roundedData
				self.centerSpaceSize = centerSpaceSize
				self.color0 = color0
				self.color1 = color1
			}
		}
	}

	@available(macOS 16.0, iOS 19, tvOS 19, *)
	public extension CIImage {
		/// Create a new CIImage using the 'Rounded QR Code Generator' filter
		///
		/// - Parameters:
		///   - message: The message to encode in the QR Code
		///   - correctionLevel: QR Code correction level L, M, Q, or H.
		///   - scale: The scale factor to enlarge the QRCode by. (8.0...64.0)
		///   - roundedMarkers: If 1, then the Finder Patterns in the QRCode should have a rounded appearance. If 2, then the Alignment Patterns will also be rounded (0...2)
		///   - roundedData: If true then the data points in the QRCode should have a rounded appearance.
		///   - centerSpaceSize: The fraction of the center space of the QRCode to fill with Color 1. If the size is 0.0 or the Correction Level is L or M, the center of the QRCode will be unaltered. The size will be limited to 0.25 if the Correction Level is Q. The size will be limited to 0.33 if the Correction Level is H. (0.0...0.3333333333333333)
		///   - color0: The background color for the QRCode
		///   - color1: The foreground color for the QRCode
		/// - Returns: A new image by running the filter, or nil if the image could not be created
		///
		/// Generate a QR Code image for message data.
		///
		/// **Categories**: BuiltIn, Generator, StillImage
		///
		/// **Documentation Links**
		/// - [CIRoundedQRCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRoundedQRCodeGenerator)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciroundedqrcodegenerator)
		/// - [CIFilter.app documentation](https://cifilter.app/CIRoundedQRCodeGenerator/)
		@inlinable static func createUsingRoundedQRCodeGenerator(
			message: Data,
			correctionLevel: String,
			scale: Double = CIFF.RoundedQRCodeGenerator.scaleDefault,
			roundedMarkers: Int = CIFF.RoundedQRCodeGenerator.roundedMarkersDefault,
			roundedData: Bool = CIFF.RoundedQRCodeGenerator.roundedDataDefault,
			centerSpaceSize: Double = CIFF.RoundedQRCodeGenerator.centerSpaceSizeDefault,
			color0: CIColor,
			color1: CIColor
		) -> CIImage? {
			return CIFF.RoundedQRCodeGenerator(
				message: message,
				correctionLevel: correctionLevel,
				scale: scale,
				roundedMarkers: roundedMarkers,
				roundedData: roundedData,
				centerSpaceSize: centerSpaceSize,
				color0: color0,
				color1: color1
			)?.outputImage
		}
	}

#endif // canImport(CoreImage)
