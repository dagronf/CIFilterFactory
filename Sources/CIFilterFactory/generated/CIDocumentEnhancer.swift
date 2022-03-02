//
//  CIDocumentEnhancer.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.15, iOS 13, tvOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Document Enhancer
	///
	/// Enhance a document image by removing unwanted shadows, whitening the background, and enhancing contrast.
	///
	/// **Links**
	///
	/// - [CIDocumentEnhancer Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDocumentEnhancer)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cidocumentenhancer?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDocumentEnhancer/)
	///
	@objc(CIFilterFactory_DocumentEnhancer) class DocumentEnhancer: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIDocumentEnhancer")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
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

		// MARK: - amount (inputAmount)

		/// The amount of enhancement.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		/// - Maximum value: `10.0`
		@objc public var amount: NSNumber? {
			get {
				return self.keyedValue("inputAmount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DocumentEnhancer.amountRange), forKey: "inputAmount")
			}
		}

		/// `amount` range definition
		public static let amountRange: ClosedRange<Float> = 0.0 ... 10.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			amount: NSNumber = 1
		) {
			self.init()

			self.image = image
			self.amount = amount
		}
	}
}
