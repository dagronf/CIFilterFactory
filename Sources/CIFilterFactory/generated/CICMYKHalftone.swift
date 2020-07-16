//
//  CICMYKHalftone.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// CMYK Halftone
	///
	/// Creates a color, halftoned rendition of the source image, using cyan, magenta, yellow, and black inks over a white page.
	///
	/// **Links**
	///
	/// [CICMYKHalftone Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICMYKHalftone)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICMYKHalftone/)
	///
	@objc(CIFilterFactory_CICMYKHalftone) class CICMYKHalftone: FilterCore {
		@objc public init?() {
			super.init(name: "CICMYKHalftone")
		}

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
		/// The x and y position to use as the center of the halftone pattern
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [150 150]
		@objc public dynamic var inputCenter: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputCenter")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputCenter")
			}
		}

		///
		/// The distance between dots in the pattern.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  6
		///   minValue: -2.0
		///
		static let inputWidth_Range: PartialRangeFrom<Float> = Float(-2.0)...
		@objc public dynamic var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CICMYKHalftone.inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The angle of the pattern.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  0
		@objc public dynamic var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The sharpness of the pattern. The larger the value, the sharper the pattern.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  0.7
		///   minValue: 0.0
		///
		static let inputSharpness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CICMYKHalftone.inputSharpness_Range), forKey: "inputSharpness")
			}
		}

		///
		/// The gray component replacement value. The value can vary from 0.0 (none) to 1.0.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 0.0
		///
		static let inputGCR_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputGCR: NSNumber? {
			get {
				return self.filter.value(forKey: "inputGCR") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CICMYKHalftone.inputGCR_Range), forKey: "inputGCR")
			}
		}

		///
		/// The under color removal value. The value can vary from 0.0 to 1.0.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.5
		///   minValue: 0.0
		///
		static let inputUCR_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputUCR: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUCR") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CICMYKHalftone.inputUCR_Range), forKey: "inputUCR")
			}
		}
	}
}
