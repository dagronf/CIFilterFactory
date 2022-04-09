//
//  TemperatureAndTint.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.7, iOS 5, tvOS 5, *)
@objc public extension CIFF {
	///
	/// Temperature and Tint
	///
	/// Adapt the reference white point for an image.
	///
	/// **Availability**
	/// - macOS 10.7, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryColorAdjustment
	/// - CICategoryInterlaced
	/// - CICategoryNonSquarePixels
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Links**
	/// - [CITemperatureAndTint Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITemperatureAndTint)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/citemperatureandtint?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CITemperatureAndTint/)
	///
	@available(macOS 10.7, iOS 5, tvOS 5, *)
	@objc(CIFFTemperatureAndTint) class TemperatureAndTint: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CITemperatureAndTint")
		}

		// MARK: - inputImage (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var inputImage: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - neutral (inputNeutral)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNeutral`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 6500.0, y: 6500.0)`
		@objc public var neutral: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputNeutral", defaultValue: Self.neutralDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputNeutral")
			}
		}

		/// `neutral` default value
		@objc public static let neutralDefault = CGPoint(x: 6500.0, y: 0.0)

		// MARK: - targetNeutral (inputTargetNeutral)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTargetNeutral`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 6500.0, y: 6500.0)`
		@objc public var targetNeutral: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputTargetNeutral", defaultValue: Self.targetNeutralDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputTargetNeutral")
			}
		}

		/// `targetNeutral` default value
		@objc public static let targetNeutralDefault = CGPoint(x: 6500.0, y: 0.0)

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			neutral: CGPoint = TemperatureAndTint.neutralDefault,
			targetNeutral: CGPoint = TemperatureAndTint.targetNeutralDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.neutral = neutral
			self.targetNeutral = targetNeutral
		}
	}
}
