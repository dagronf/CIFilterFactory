//
//  MinimumComponent.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.5, iOS 6, tvOS 6, *)
@objc public extension CIFF {
	///
	/// Minimum Component
	///
	/// Converts an image to grayscale using the minimum of the three color components.
	///
	/// **Availability**
	/// - macOS 10.5, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryColorEffect
	/// - CICategoryInterlaced
	/// - CICategoryNonSquarePixels
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Links**
	/// - [CIMinimumComponent Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMinimumComponent)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciminimumcomponent?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIMinimumComponent/)
	///
	@available(macOS 10.5, iOS 6, tvOS 6, *)
	@objc(CIFFMinimumComponent) class MinimumComponent: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIMinimumComponent")
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

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage)
		{
			self.init()
			self.inputImage = inputImage
		}
	}
}
