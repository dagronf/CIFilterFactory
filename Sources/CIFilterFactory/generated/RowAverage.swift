//
//  RowAverage.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.5, iOS 9, tvOS 9, *)
@objc public extension CIFF {
	///
	/// Row Average
	///
	/// Calculates the average color for each row of the specified area in an image, returning the result in a 1D image.
	///
	/// **Availability**
	/// - macOS 10.5, iOS 9, tvOS 9
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryReduction
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Links**
	/// - [CIRowAverage Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRowAverage)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cirowaverage?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIRowAverage/)
	///
	@available(macOS 10.5, iOS 9, tvOS 9, *)
	@objc(CIFFRowAverage) class RowAverage: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIRowAverage")
		}

		// MARK: - inputImage (inputImage)

		/// The image to process.
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

		// MARK: - extent (inputExtent)

		/// A rectangle that specifies the subregion of the image that you want to process.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputExtent`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeRectangle`
		/// - Default Value: `CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)`
		@objc public var extent: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputExtent", defaultValue: Self.extentDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputExtent")
			}
		}

		/// `extent` default value
		@objc public static let extentDefault = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			extent: CGRect = RowAverage.extentDefault
		) {
			self.init()
			self.inputImage = inputImage
			self.extent = extent
		}
	}
}
