//
//  ToneMapHeadroom.swift  (AUTOMATICALLY GENERATED FILE)
//
//  Copyright © 2024 Darren Ford. All rights reserved.
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
		/// Tone Map Headroom
		///
		/// Apply a global tone curve to an image that reduces colors from a source headroom value to a target headroom value.
		///
		/// **CIFilter Name**
		/// - CIToneMapHeadroom
		///
		/// **Availability**
		/// - macOS 15.0, iOS 18, tvOS 18
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
		/// - [CIToneMapHeadroom Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIToneMapHeadroom)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/citonemapheadroom)
		/// - [CIFilter.app documentation](https://cifilter.app/CIToneMapHeadroom/)
		/// **Additional output keys**
		/// - outputValue:
		///
		@available(macOS 15.0, iOS 18, tvOS 18, *)
		@objc(CIFFToneMapHeadroom) class ToneMapHeadroom: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIToneMapHeadroom")
			}

			// MARK: - inputImage (inputImage)

			/// The image to use as an input for the effect.
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

			// MARK: - sourceHeadroom (inputSourceHeadroom)

			/// Specifies the headroom of the input image.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputSourceHeadroom`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeScalar`
			/// - Minimum Value: `1.0`
			/// - Maximum Value: `32.0`
			@objc public var sourceHeadroom: Double {
				get {
					self.doubleValue(forKey: "inputSourceHeadroom", defaultValue: Self.sourceHeadroomDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: ToneMapHeadroom.sourceHeadroomRange, forKey: "inputSourceHeadroom")
				}
			}

			/// `sourceHeadroom` default value
			@objc public static let sourceHeadroomDefault: Double = 0

			/// `sourceHeadroom` range definition
			public static let sourceHeadroomRange: ClosedRange<Double> = 1.0 ... 32.0

			// MARK: - targetHeadroom (inputTargetHeadroom)

			/// Specifies the target headroom of the output image.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputTargetHeadroom`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeScalar`
			/// - Minimum Value: `1.0`
			/// - Maximum Value: `32.0`
			/// - Default Value: `1.0`
			@objc public var targetHeadroom: Double {
				get {
					self.doubleValue(forKey: "inputTargetHeadroom", defaultValue: Self.targetHeadroomDefault)
				}
				set {
					self.setDoubleValue(newValue, bounds: ToneMapHeadroom.targetHeadroomRange, forKey: "inputTargetHeadroom")
				}
			}

			/// `targetHeadroom` default value
			@objc public static let targetHeadroomDefault: Double = 1.0

			/// `targetHeadroom` range definition
			public static let targetHeadroomRange: ClosedRange<Double> = 1.0 ... 32.0

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - inputImage: The image to use as an input for the effect.
			///   - sourceHeadroom: Specifies the headroom of the input image.
			///   - targetHeadroom: Specifies the target headroom of the output image.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				sourceHeadroom: Double,
				targetHeadroom: Double = ToneMapHeadroom.targetHeadroomDefault
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				self.sourceHeadroom = sourceHeadroom
				self.targetHeadroom = targetHeadroom
			}
		}
	}

	@available(macOS 15.0, iOS 18, tvOS 18, *)
	public extension CIImage {
		/// Apply the 'Tone Map Headroom' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - sourceHeadroom: Specifies the headroom of the input image. (1.0...32.0)
		///   - targetHeadroom: Specifies the target headroom of the output image. (1.0...32.0)
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Apply a global tone curve to an image that reduces colors from a source headroom value to a target headroom value.
		///
		/// **Categories**: BuiltIn, ColorAdjustment, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video
		///
		/// **Documentation Links**
		/// - [CIToneMapHeadroom Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIToneMapHeadroom)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/citonemapheadroom)
		/// - [CIFilter.app documentation](https://cifilter.app/CIToneMapHeadroom/)
		@inlinable func applyingToneMapHeadroom(
			sourceHeadroom: Double,
			targetHeadroom: Double = CIFF.ToneMapHeadroom.targetHeadroomDefault,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.ToneMapHeadroom(
				inputImage: self,
				sourceHeadroom: sourceHeadroom,
				targetHeadroom: targetHeadroom
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
