//
//  CIStretchCrop.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.6, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Stretch Crop
	///
	/// Distorts an image by stretching and or cropping to fit a target size.
	///
	/// **Links**
	///
	/// [CIStretchCrop Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStretchCrop)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIStretchCrop/)
	///
	@objc(CIFilterFactory_CIStretchCrop) class CIStretchCrop: FilterCore {
		@objc public init?() {
			super.init(name: "CIStretchCrop")
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
		/// The size in pixels of the output image.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [1280 720]
		@objc public dynamic var inputSize: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputSize")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputSize")
			}
		}

		///
		/// Determines if and how much cropping should be used to achieve the target size. If value is 0 then only stretching is used. If 1 then only cropping is used.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.25
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputCropAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputCropAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCropAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIStretchCrop.inputCropAmount_Range), forKey: "inputCropAmount")
			}
		}

		///
		/// Determine how much the center of the image is stretched if stretching is used. If value is 0 then the center of the image maintains the original aspect ratio. If 1 then the image is stretched uniformly.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.25
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		static let inputCenterStretchAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputCenterStretchAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCenterStretchAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIStretchCrop.inputCenterStretchAmount_Range), forKey: "inputCenterStretchAmount")
			}
		}
	}
}
