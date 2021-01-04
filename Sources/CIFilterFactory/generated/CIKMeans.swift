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

public extension CIFilter {
	@available(macOS 10.15, iOS 13, *)
	@inlinable @objc static func KMeans() -> CIFilterFactory.CIKMeans? {
		return CIFilterFactory.CIKMeans()
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// KMeans
	///
	/// Create a palette of the most common colors found in the image.
	///
	/// **Links**
	///
	/// [CIKMeans Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKMeans)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIKMeans/)
	///
	@objc(CIFilterFactory_CIKMeans) class CIKMeans: FilterCore {
		@objc public init?() {
			super.init(name: "CIKMeans")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// A rectangle that defines the extent of the effect.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeRectangle
		///   Default:  [0 0 640 80]
		@objc public dynamic var inputExtent: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputExtent")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputExtent")
			}
		}

		///
		/// Specifies the color seeds to use for k-means clustering, either passed as an image or an array of colors.
		///
		///   Class:    CIImage
		@objc public dynamic var inputMeans: CIImage? {
			get {
				return self.filter.value(forKey: "inputMeans") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMeans")
			}
		}

		///
		/// Specifies how many k-means color clusters should be used.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeCount
		///   Default:  8
		///   minValue: 0.0
		///   maxValue: 128.0
		///
		public static let inputCount_Range: ClosedRange<Float> = 0.0 ... 128.0
		@objc public dynamic var inputCount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIKMeans.inputCount_Range), forKey: "inputCount")
			}
		}

		///
		/// Specifies how many k-means passes should be performed.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeCount
		///   Default:  5
		///   minValue: 0.0
		///   maxValue: 20.0
		///
		public static let inputPasses_Range: ClosedRange<Float> = 0.0 ... 20.0
		@objc public dynamic var inputPasses: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPasses") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIKMeans.inputPasses_Range), forKey: "inputPasses")
			}
		}

		///
		/// Specifies whether the k-means color palette should be computed in a perceptual color space.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeBoolean
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputPerceptual_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputPerceptual: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPerceptual") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIKMeans.inputPerceptual_Range), forKey: "inputPerceptual")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputExtent: CIFilterFactory.Rect = CIFilterFactory.Rect(x: 0.0, y: 0.0, width: 640.0, height: 80.0),
			inputMeans: CIImage,
			inputCount: NSNumber = 8,
			inputPasses: NSNumber = 5,
			inputPerceptual: NSNumber = 0
		) {
			self.init()

			self.inputImage = inputImage
			self.inputExtent = inputExtent
			self.inputMeans = inputMeans
			self.inputCount = inputCount
			self.inputPasses = inputPasses
			self.inputPerceptual = inputPerceptual
		}
	}
}
