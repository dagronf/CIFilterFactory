//
//  ColorClamp.swift  (AUTOMATICALLY GENERATED FILE)
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

@objc public extension CIFF {
	/// Color Clamp
	///
	/// Clamp color to a certain range.
	///
	/// **CIFilter Name**
	/// - CIColorClamp
	///
	/// **Availability**
	/// - macOS 10.9, iOS 7, tvOS 7
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryColorAdjustment
	/// - CICategoryInterlaced
	/// - CICategoryNonSquarePixels
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIColorClamp Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorClamp)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicolorclamp?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIColorClamp/)
	///
	@available(macOS 10.9, iOS 7, tvOS 7, *)
	@objc(CIFFColorClamp) class ColorClamp: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIColorClamp")
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

		// MARK: - minComponents (inputMinComponents)

		/// Lower clamping values.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMinComponents`
		/// - Internal class: `CIVector`
		/// - Default Value: `[0 0 0 0]`
		@objc public var minComponents: CIVector? {
			get {
				self.keyedValue("inputMinComponents")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMinComponents")
			}
		}

		/// `minComponents` default value
		@objc public static let minComponentsDefault = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4)

		// MARK: - maxComponents (inputMaxComponents)

		/// Higher clamping values.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMaxComponents`
		/// - Internal class: `CIVector`
		/// - Default Value: `[1 1 1 1]`
		@objc public var maxComponents: CIVector? {
			get {
				self.keyedValue("inputMaxComponents")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMaxComponents")
			}
		}

		/// `maxComponents` default value
		@objc public static let maxComponentsDefault = CIVector(values: [1.0, 1.0, 1.0, 1.0], count: 4)

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			minComponents: CIVector = ColorClamp.minComponentsDefault,
			maxComponents: CIVector = ColorClamp.maxComponentsDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.minComponents = minComponents
			self.maxComponents = maxComponents
		}
	}
}
