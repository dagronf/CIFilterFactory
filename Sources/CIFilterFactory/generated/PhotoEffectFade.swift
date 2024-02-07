//
//  PhotoEffectFade.swift  (AUTOMATICALLY GENERATED FILE)
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
		/// Photo Effect Fade
		///
		/// Apply a “Fade” style effect to an image.
		///
		/// **CIFilter Name**
		/// - CIPhotoEffectFade
		///
		/// **Availability**
		/// - macOS 10.9, iOS 7, tvOS 7
		///
		/// **Categories**
		/// - BuiltIn (*CICategoryBuiltIn*)
		/// - ColorEffect (*CICategoryColorEffect*)
		/// - HighDynamicRange (*CICategoryHighDynamicRange*)
		/// - Interlaced (*CICategoryInterlaced*)
		/// - NonSquarePixels (*CICategoryNonSquarePixels*)
		/// - StillImage (*CICategoryStillImage*)
		/// - Video (*CICategoryVideo*)
		/// - XMPSerializable (*CICategoryXMPSerializable*)
		///
		/// **Documentation Links**
		/// - [CIPhotoEffectFade Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectFade)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciphotoeffectfade)
		@available(macOS 10.9, iOS 7, tvOS 7, *)
		@objc(CIFFPhotoEffectFade) class PhotoEffectFade: Core {
			/// Create an instance of the filter with all default values
			@objc public init?() {
				super.init(name: "CIPhotoEffectFade")
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

			// MARK: - extrapolate (inputExtrapolate)

			/// If true, then the color effect will be extrapolated if the input image contains RGB component values outside the range 0.0 to 1.0.
			///
			/// CIFilter attribute information
			/// - Attribute key: `inputExtrapolate`
			/// - Internal class: `NSNumber`
			/// - Type: `CIAttributeTypeBoolean`
			/// - Default Value: `false`
			@objc public var extrapolate: Bool {
				get {
					self.boolValue(forKey: "inputExtrapolate", defaultValue: Self.extrapolateDefault)
				}
				set {
					self.setBoolValue(newValue, forKey: "inputExtrapolate")
				}
			}

			/// `extrapolate` default value
			@objc public static let extrapolateDefault: Bool = false

			// MARK: - Convenience creators

			/// Filter initializer
			/// - Parameters:
			///   - inputImage: The image to use as an input for the effect.
			///   - extrapolate: If true, then the color effect will be extrapolated if the input image contains RGB component values outside the range 0.0 to 1.0.
			@objc public convenience init?(
				inputImage: CIImage? = nil,
				extrapolate: Bool = PhotoEffectFade.extrapolateDefault
			) {
				self.init()
				if let inputImage = inputImage {
					self.inputImage = inputImage
				}
				self.extrapolate = extrapolate
			}
		}
	}

	@available(macOS 10.9, iOS 7, tvOS 7, *)
	public extension CIImage {
		/// Apply the 'Photo Effect Fade' filter to this image and return a new filtered image
		///
		/// - Parameters:
		///   - extrapolate: If true, then the color effect will be extrapolated if the input image contains RGB component values outside the range 0.0 to 1.0.
		///   - isActive: If true applies the filter and returns a new image, else returns this image
		/// - Returns: The filtered image, or this image if the filter is not active
		///
		/// Apply a “Fade” style effect to an image.
		///
		/// **Categories**: BuiltIn, ColorEffect, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Video, XMPSerializable
		///
		/// **Documentation Links**
		/// - [CIPhotoEffectFade Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectFade)
		/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciphotoeffectfade)
		@inlinable func applyingPhotoEffectFade(
			extrapolate: Bool = CIFF.PhotoEffectFade.extrapolateDefault,
			isActive: Bool = true
		) -> CIImage {
			guard isActive else { return self }
			return CIFF.PhotoEffectFade(
				inputImage: self,
				extrapolate: extrapolate
			)?.outputImage ?? CIImage.empty()
		}
	}

#endif // canImport(CoreImage)
