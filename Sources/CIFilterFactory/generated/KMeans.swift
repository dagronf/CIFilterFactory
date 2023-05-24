//
//  KMeans.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// KMeans
	///
	/// Create a palette of the most common colors found in the image.
	///
	/// **CIFilter Name**
	/// - CIKMeans
	///
	/// **Availability**
	/// - macOS 10.15, iOS 13, tvOS 13
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Reduction (*CICategoryReduction*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIKMeans Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKMeans)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIKMeans/)
	@available(macOS 10.15, iOS 13, tvOS 13, *)
	@objc(CIFFKMeans) class KMeans: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIKMeans")
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

		// MARK: - extent (inputExtent)

		/// A rectangle that defines the extent of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputExtent`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeRectangle`
		/// - Default Value: `CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)`
		@objc public var extent: CGRect {
			get {
				self.cgRectValue(forKey: "inputExtent", defaultValue: Self.extentDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// `extent` default value
		@objc public static let extentDefault = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)

		// MARK: - means (inputMeans)

		/// Specifies the color seeds to use for k-means clustering, either passed as an image or an array of colors.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMeans`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var means: CIImage? {
			get {
				self.keyedValue("inputMeans")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMeans")
			}
		}

		// MARK: - count (inputCount)

		/// Specifies how many k-means color clusters should be used.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeCount`
		/// - Minimum Value: `0`
		/// - Maximum Value: `128`
		/// - Default Value: `8`
		@objc public var count: UInt {
			get {
				self.uintValue(forKey: "inputCount", defaultValue: Self.countDefault)
			}
			set {
				self.setUIntValue(newValue, bounds: KMeans.countRange, forKey: "inputCount")
			}
		}

		/// `count` default value
		@objc public static let countDefault: UInt = 8

		/// `count` range definition
		public static let countRange: ClosedRange<UInt> = 0 ... 128

		// MARK: - passes (inputPasses)

		/// Specifies how many k-means passes should be performed.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPasses`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeCount`
		/// - Minimum Value: `0`
		/// - Maximum Value: `20`
		/// - Default Value: `5`
		@objc public var passes: UInt {
			get {
				self.uintValue(forKey: "inputPasses", defaultValue: Self.passesDefault)
			}
			set {
				self.setUIntValue(newValue, bounds: KMeans.passesRange, forKey: "inputPasses")
			}
		}

		/// `passes` default value
		@objc public static let passesDefault: UInt = 5

		/// `passes` range definition
		public static let passesRange: ClosedRange<UInt> = 0 ... 20

		// MARK: - perceptual (inputPerceptual)

		/// Specifies whether the k-means color palette should be computed in a perceptual color space.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPerceptual`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var perceptual: Bool {
			get {
				self.boolValue(forKey: "inputPerceptual", defaultValue: Self.perceptualDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputPerceptual")
			}
		}

		/// `perceptual` default value
		@objc public static let perceptualDefault: Bool = false

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - extent: A rectangle that defines the extent of the effect.
		///   - means: Specifies the color seeds to use for k-means clustering, either passed as an image or an array of colors.
		///   - count: Specifies how many k-means color clusters should be used.
		///   - passes: Specifies how many k-means passes should be performed.
		///   - perceptual: Specifies whether the k-means color palette should be computed in a perceptual color space.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			extent: CGRect = KMeans.extentDefault,
			means: CIImage? = nil,
			count: UInt = KMeans.countDefault,
			passes: UInt = KMeans.passesDefault,
			perceptual: Bool = KMeans.perceptualDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.extent = extent
			if let means = means {
				self.means = means
			}
			self.count = count
			self.passes = passes
			self.perceptual = perceptual
		}
	}
}

@available(macOS 10.15, iOS 13, tvOS 13, *)
public extension CIImage {
	/// Apply the 'KMeans' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - extent: A rectangle that defines the extent of the effect.
	///   - means: Specifies the color seeds to use for k-means clustering, either passed as an image or an array of colors.
	///   - count: Specifies how many k-means color clusters should be used. (0...128)
	///   - passes: Specifies how many k-means passes should be performed. (0...20)
	///   - perceptual: Specifies whether the k-means color palette should be computed in a perceptual color space.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Create a palette of the most common colors found in the image.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, Reduction, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIKMeans Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKMeans)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIKMeans/)
	@inlinable func applyingKMeans(
		extent: CGRect = CIFF.KMeans.extentDefault,
		means: CIImage,
		count: UInt = CIFF.KMeans.countDefault,
		passes: UInt = CIFF.KMeans.passesDefault,
		perceptual: Bool = CIFF.KMeans.perceptualDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.KMeans(
			inputImage: self,
			extent: extent,
			means: means,
			count: count,
			passes: passes,
			perceptual: perceptual
		)?.outputImage ?? CIImage.empty()
	}
}
