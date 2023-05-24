//
//  DocumentEnhancer.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Document Enhancer
	///
	/// Enhance a document image by removing unwanted shadows, whitening the background, and enhancing contrast.
	///
	/// **CIFilter Name**
	/// - CIDocumentEnhancer
	///
	/// **Availability**
	/// - macOS 10.15, iOS 13, tvOS 13
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - ColorEffect (*CICategoryColorEffect*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	///
	/// **Documentation Links**
	/// - [CIDocumentEnhancer Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDocumentEnhancer)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDocumentEnhancer/)
	@available(macOS 10.15, iOS 13, tvOS 13, *)
	@objc(CIFFDocumentEnhancer) class DocumentEnhancer: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIDocumentEnhancer")
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

		// MARK: - amount (inputAmount)

		/// The amount of enhancement.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `10.0`
		/// - Default Value: `1.0`
		@objc public var amount: Double {
			get {
				self.doubleValue(forKey: "inputAmount", defaultValue: Self.amountDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DocumentEnhancer.amountRange, forKey: "inputAmount")
			}
		}

		/// `amount` default value
		@objc public static let amountDefault: Double = 1.0

		/// `amount` range definition
		public static let amountRange: ClosedRange<Double> = 0.0 ... 10.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - amount: The amount of enhancement.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			amount: Double = DocumentEnhancer.amountDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.amount = amount
		}
	}
}

@available(macOS 10.15, iOS 13, tvOS 13, *)
public extension CIImage {
	/// Apply the 'Document Enhancer' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - amount: The amount of enhancement. (0.0...10.0)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Enhance a document image by removing unwanted shadows, whitening the background, and enhancing contrast.
	///
	/// **Categories**: BuiltIn, ColorEffect, NonSquarePixels, StillImage
	///
	/// **Documentation Links**
	/// - [CIDocumentEnhancer Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDocumentEnhancer)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDocumentEnhancer/)
	@inlinable func applyingDocumentEnhancer(
		amount: Double = CIFF.DocumentEnhancer.amountDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.DocumentEnhancer(
			inputImage: self,
			amount: amount
		)?.outputImage ?? CIImage.empty()
	}
}
