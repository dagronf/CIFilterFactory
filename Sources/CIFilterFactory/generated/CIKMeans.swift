//
//  CIKMeans.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.15, iOS 13, tvOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// KMeans
	///
	/// Create a palette of the most common colors found in the image.
	///
	/// **Links**
	///
	/// - [CIKMeans Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKMeans)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cikmeans?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIKMeans/)
	///
	@objc(CIFilterFactory_KMeans) class KMeans: FilterCore {
		@objc public init?() {
			super.init(name: "CIKMeans")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   - Attribute key: `inputImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - extent (inputExtent)

		///
		/// A rectangle that defines the extent of the effect.
		///
		///   - Attribute key: `inputExtent`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypeRectangle`
		///   - Default value: `[0 0 640 80]`
		@objc public var extent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extent_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// extent default value
		@objc public static let extent_default = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 640.0)

		// MARK: - means (inputMeans)

		///
		/// Specifies the color seeds to use for k-means clustering, either passed as an image or an array of colors.
		///
		///   - Attribute key: `inputMeans`
		///   - Internal class: `CIImage`
		@objc public var means: CIImage? {
			get {
				return self.keyedValue("inputMeans")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMeans")
			}
		}

		// MARK: - count (inputCount)

		///
		/// Specifies how many k-means color clusters should be used.
		///
		///   - Attribute key: `inputCount`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeCount`
		///   - Default value: `8`
		///   minValue: 0.0
		///   maxValue: 128.0
		///
		public static let count_Range: ClosedRange<Float> = 0.0 ... 128.0
		@objc public var count: NSNumber? {
			get {
				return self.keyedValue("inputCount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: KMeans.count_Range), forKey: "inputCount")
			}
		}

		// MARK: - passes (inputPasses)

		///
		/// Specifies how many k-means passes should be performed.
		///
		///   - Attribute key: `inputPasses`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeCount`
		///   - Default value: `5`
		///   minValue: 0.0
		///   maxValue: 20.0
		///
		public static let passes_Range: ClosedRange<Float> = 0.0 ... 20.0
		@objc public var passes: NSNumber? {
			get {
				return self.keyedValue("inputPasses")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: KMeans.passes_Range), forKey: "inputPasses")
			}
		}

		// MARK: - perceptual (inputPerceptual)

		///
		/// Specifies whether the k-means color palette should be computed in a perceptual color space.
		///
		///   - Attribute key: `inputPerceptual`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeBoolean`
		///   - Default value: `0`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let perceptual_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var perceptual: NSNumber? {
			get {
				return self.keyedValue("inputPerceptual")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: KMeans.perceptual_Range), forKey: "inputPerceptual")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			extent: CGRect = KMeans.extent_default,
			means: CIImage,
			count: NSNumber = 8,
			passes: NSNumber = 5,
			perceptual: NSNumber = 0
		) {
			self.init()

			self.image = image
			self.extent = extent
			self.means = means
			self.count = count
			self.passes = passes
			self.perceptual = perceptual
		}
	}
}
