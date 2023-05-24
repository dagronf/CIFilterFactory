//
//  GuidedFilter.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Guided Filter
	///
	/// Upsamples a small image to the size of the guide image using the content of the guide to preserve detail.
	///
	/// **CIFilter Name**
	/// - CIGuidedFilter
	///
	/// **Availability**
	/// - macOS 10.14, iOS 12, tvOS 12
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - GeometryAdjustment (*CICategoryGeometryAdjustment*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIGuidedFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGuidedFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGuidedFilter/)
	@available(macOS 10.14, iOS 12, tvOS 12, *)
	@objc(CIFFGuidedFilter) class GuidedFilter: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIGuidedFilter")
		}

		// MARK: - inputImage (inputImage)

		/// A small image to upsample.
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

		// MARK: - guideImage (inputGuideImage)

		/// A larger image to use as a guide.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGuideImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var guideImage: CIImage? {
			get {
				self.keyedValue("inputGuideImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGuideImage")
			}
		}

		// MARK: - radius (inputRadius)

		/// The distance from the center of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `1.0`
		@objc public var radius: Double {
			get {
				self.doubleValue(forKey: "inputRadius", defaultValue: Self.radiusDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputRadius")
			}
		}

		/// `radius` default value
		@objc public static let radiusDefault: Double = 1.0

		// MARK: - epsilon (inputEpsilon)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputEpsilon`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `0.0001`
		@objc public var epsilon: Double {
			get {
				self.doubleValue(forKey: "inputEpsilon", defaultValue: Self.epsilonDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputEpsilon")
			}
		}

		/// `epsilon` default value
		@objc public static let epsilonDefault: Double = 0.0001

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: A small image to upsample.
		///   - guideImage: A larger image to use as a guide.
		///   - radius: The distance from the center of the effect.
		///   - epsilon: No Description
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			guideImage: CIImage? = nil,
			radius: Double = GuidedFilter.radiusDefault,
			epsilon: Double = GuidedFilter.epsilonDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let guideImage = guideImage {
				self.guideImage = guideImage
			}
			self.radius = radius
			self.epsilon = epsilon
		}
	}
}

@available(macOS 10.14, iOS 12, tvOS 12, *)
public extension CIImage {
	/// Apply the 'Guided Filter' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - guideImage: A larger image to use as a guide.
	///   - radius: The distance from the center of the effect.
	///   - epsilon: No Description
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Upsamples a small image to the size of the guide image using the content of the guide to preserve detail.
	///
	/// **Categories**: BuiltIn, GeometryAdjustment, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIGuidedFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGuidedFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGuidedFilter/)
	@inlinable func applyingGuidedFilter(
		guideImage: CIImage,
		radius: Double = CIFF.GuidedFilter.radiusDefault,
		epsilon: Double = CIFF.GuidedFilter.epsilonDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.GuidedFilter(
			inputImage: self,
			guideImage: guideImage,
			radius: radius,
			epsilon: epsilon
		)?.outputImage ?? CIImage.empty()
	}
}
