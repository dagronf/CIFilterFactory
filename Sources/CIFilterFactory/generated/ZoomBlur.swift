//
//  ZoomBlur.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Zoom Blur
	///
	/// Simulates the effect of zooming the camera while capturing the image.
	///
	/// **CIFilter Name**
	/// - CIZoomBlur
	///
	/// **Availability**
	/// - macOS 10.4, iOS 8.3, tvOS 8.3
	///
	/// **Categories**
	/// - Blur (*CICategoryBlur*)
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIZoomBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIZoomBlur)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIZoomBlur/)
	@available(macOS 10.4, iOS 8.3, tvOS 8.3, *)
	@objc(CIFFZoomBlur) class ZoomBlur: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIZoomBlur")
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

		// MARK: - center (inputCenter)

		/// The center of the effect as x and y pixel coordinates.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var center: CGPoint {
			get {
				self.cgPointValue(forKey: "inputCenter", defaultValue: Self.centerDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// `center` default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - amount (inputAmount)

		/// The zoom-in amount. Larger values result in more zooming in.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default Value: `20.0`
		@objc public var amount: Double {
			get {
				self.doubleValue(forKey: "inputAmount", defaultValue: Self.amountDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputAmount")
			}
		}

		/// `amount` default value
		@objc public static let amountDefault: Double = 20.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - amount: The zoom-in amount. Larger values result in more zooming in.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			center: CGPoint = ZoomBlur.centerDefault,
			amount: Double = ZoomBlur.amountDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.center = center
			self.amount = amount
		}
	}
}

@available(macOS 10.4, iOS 8.3, tvOS 8.3, *)
public extension CIImage {
	/// Apply the 'Zoom Blur' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - amount: The zoom-in amount. Larger values result in more zooming in.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Simulates the effect of zooming the camera while capturing the image.
	///
	/// **Categories**: Blur, BuiltIn, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIZoomBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIZoomBlur)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIZoomBlur/)
	@inlinable func applyingZoomBlur(
		center: CGPoint = CIFF.ZoomBlur.centerDefault,
		amount: Double = CIFF.ZoomBlur.amountDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.ZoomBlur(
			inputImage: self,
			center: center,
			amount: amount
		)?.outputImage ?? CIImage.empty()
	}
}
