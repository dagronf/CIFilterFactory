//
//  CIAreaMinMaxRed.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.13, iOS 11, *)
	@inlinable @objc static func AreaMinMaxRed() -> CIFilterFactory.CIAreaMinMaxRed? {
		return CIFilterFactory.CIAreaMinMaxRed()
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Area Min and Max Red
	///
	/// Calculates the minimum and maximum red component value for the specified area in an image. The result is returned in the red and green channels of a one pixel image.
	///
	/// **Links**
	///
	/// [CIAreaMinMaxRed Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinMaxRed)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAreaMinMaxRed/)
	///
	@objc(CIFilterFactory_CIAreaMinMaxRed) class CIAreaMinMaxRed: FilterCore {
		@objc public init?() {
			super.init(name: "CIAreaMinMaxRed")
		}

		// MARK: - Inputs

		///
		/// The image to process.
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
		/// A rectangle that specifies the subregion of the image that you want to process.
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

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputExtent: CIFilterFactory.Rect = CIFilterFactory.Rect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)
		) {
			self.init()

			self.inputImage = inputImage
			self.inputExtent = inputExtent
		}
	}
}
