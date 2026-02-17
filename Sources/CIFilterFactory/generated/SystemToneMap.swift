//
//  SystemToneMap.swift  (AUTOMATICALLY GENERATED FILE)
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
		/// System Tone Map
		///
		/// Apply a global tone curve to an image that reduces colors of the input image to a desired dynamic range consistent with other frameworks.
		///
		/// **CIFilter Name**
		/// - CISystemToneMap
		///
		/// **Availability**
		/// - macOS 16.0, iOS 19, tvOS 19
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - ColorAdjustment (*CICategoryColorAdjustment*)
		/// - HighDynamicRange (*CICategoryHighDynamicRange*)
		/// - Interlaced (*CICategoryInterlaced*)
		/// - NonSquarePixels (*CICategoryNonSquarePixels*)
		/// - StillImage (*CICategoryStillImage*)
		/// - Video (*CICategoryVideo*)
		///
		/// **Documentation Links**
		/// - [CISystemToneMap Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISystemToneMap)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cisystemtonemap)
		/// - [CIFilter.app documentation](https://cifilter.app/CISystemToneMap/)
		@available(macOS 16.0, iOS 19, tvOS 19, *)
		@objc(CIFFSystemToneMap) class SystemToneMap: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CISystemToneMap")
			}

			// MARK: - inputImage (inputImage)

			/// Specifies input image with content headroom and average light level properties.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputImage`
			/// - Internal class: `CIImage`
			/// - Type: `CIAttributeTypeImage`
			@objc public var inputImage: CIImage? {
				get {
					self.keyedValue("inputImage")
				}
				set {
					self.setKeyedValue(newValue, for: "inputImage")
				}
			}

			// MARK: - displayHeadroom (inputDisplayHeadroom)

			/// Specifies the current headroom of the intended display.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputDisplayHeadroom`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeScalar`
			/// - Minimum Value: `1.0`
			/// - Maximum Value: `32.0`
			/// - Default Value: `1.0`
			@objc public var displayHeadroom: Double {
				get {
					self.doubleValue(forKey: "inputDisplayHeadroom", defaultValue: Self.displayHeadroomDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: SystemToneMap.displayHeadroomRange, forKey: "inputDisplayHeadroom")
				}
			}

			/// `displayHeadroom` default value
			@objc public static let displayHeadroomDefault: Double = 1.0

			/// `displayHeadroom` range definition
			public static let displayHeadroomRange: ClosedRange<Double> = 1.0 ... 32.0

			// MARK: - preferredDynamicRange (inputPreferredDynamicRange)

			/// Specifies the preferred dynamic range behavior of the tone mapping. The value should be kCIDynamicRangeStandard, kCIDynamicRangeConstrainedHigh, kCIDynamicRangeHigh or nil.  If nil then it will behave as kCIDynamicRangeHigh.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputPreferredDynamicRange`
			/// - Internal class: `NSString`
			@objc public var preferredDynamicRange: String? {
				get {
					self.stringValue(forKey: "inputPreferredDynamicRange")
				}
				set {
					self.setKeyedValue(newValue as? NSString, for: "inputPreferredDynamicRange")
				}
			}

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - inputImage: Specifies input image with content headroom and average light level properties.
			///   - displayHeadroom: Specifies the current headroom of the intended display.
			///   - preferredDynamicRange: Specifies the preferred dynamic range behavior of the tone mapping. The value should be kCIDynamicRangeStandard, kCIDynamicRangeConstrainedHigh, kCIDynamicRangeHigh or nil.  If nil then it will behave as kCIDynamicRangeHigh.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				displayHeadroom: Double = SystemToneMap.displayHeadroomDefault,
				preferredDynamicRange: String
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				self.displayHeadroom = displayHeadroom
				self.preferredDynamicRange = preferredDynamicRange
			}
		}
	}

	@available(macOS 16.0, iOS 19, tvOS 19, *)
	public extension CIImage {
		/// Apply the 'System Tone Map' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - displayHeadroom: Specifies the current headroom of the intended display. (1.0...32.0)
		///   - preferredDynamicRange: Specifies the preferred dynamic range behavior of the tone mapping. The value should be kCIDynamicRangeStandard, kCIDynamicRangeConstrainedHigh, kCIDynamicRangeHigh or nil.  If nil then it will behave as kCIDynamicRangeHigh.
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Apply a global tone curve to an image that reduces colors of the input image to a desired dynamic range consistent with other frameworks.
		///
		/// **Categories**: BuiltIn, ColorAdjustment, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
		///
		/// **Documentation Links**
		/// - [CISystemToneMap Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISystemToneMap)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cisystemtonemap)
		/// - [CIFilter.app documentation](https://cifilter.app/CISystemToneMap/)
		@inlinable func applyingSystemToneMap(
			displayHeadroom: Double = CIFF.SystemToneMap.displayHeadroomDefault,
			preferredDynamicRange: String,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.SystemToneMap(
				inputImage: self,
				displayHeadroom: displayHeadroom,
				preferredDynamicRange: preferredDynamicRange
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
