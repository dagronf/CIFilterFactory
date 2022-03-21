//
//  GuidedFilter.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.14, iOS 12, tvOS 12, *)
@objc public extension CIFF {
	///
	/// Guided Filter
	///
	/// Upsamples a small image to the size of the guide image using the content of the guide to preserve detail.
	///
	/// **Links**
	///
	/// - [CIGuidedFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGuidedFilter)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciguidedfilter?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIGuidedFilter/)
	///
	@available(macOS 10.14, iOS 12, tvOS 12, *)
	@objc(CIFFGuidedFilter) class GuidedFilter: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIGuidedFilter")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// A small image to upsample.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
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
		@objc public var guideImage: CIImage? {
			get {
				return self.keyedValue("inputGuideImage")
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
		/// - Default value: `1`
		@objc public var radius: Double {
			get {
				let number = self.filter.value(forKey: "inputRadius") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputRadius")
			}
		}

		// MARK: - epsilon (inputEpsilon)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputEpsilon`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.0001`
		@objc public var epsilon: Double {
			get {
				let number = self.filter.value(forKey: "inputEpsilon") as? NSNumber
				return number?.doubleValue ?? 0.0001
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputEpsilon")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			guideImage: CIImage,
			radius: Double = 1,
			epsilon: Double = 0.0001
		) {
			self.init()

			self.image = image
			self.guideImage = guideImage
			self.radius = radius
			self.epsilon = epsilon
		}
	}
}
