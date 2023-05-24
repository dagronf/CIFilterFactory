//
//  Pixellate.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Pixelate
	///
	/// Makes an image blocky.
	///
	/// **CIFilter Name**
	/// - CIPixellate
	///
	/// **Availability**
	/// - macOS 10.4, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Stylize (*CICategoryStylize*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIPixellate Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPixellate)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPixellate/)
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFPixellate) class Pixellate: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIPixellate")
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

		// MARK: - scale (inputScale)

		/// The scale determines the size of the squares. Larger values result in larger squares.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputScale`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `1.0`
		/// - Default Value: `8.0`
		@objc public var scale: Double {
			get {
				self.doubleValue(forKey: "inputScale", defaultValue: Self.scaleDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: Pixellate.scaleRange, forKey: "inputScale")
			}
		}

		/// `scale` default value
		@objc public static let scaleDefault: Double = 8.0

		/// `scale` range definition
		public static let scaleRange = PartialRangeFrom<Double>(1.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - center: The center of the effect as x and y pixel coordinates.
		///   - scale: The scale determines the size of the squares. Larger values result in larger squares.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			center: CGPoint = Pixellate.centerDefault,
			scale: Double = Pixellate.scaleDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.center = center
			self.scale = scale
		}
	}
}

@available(macOS 10.4, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Pixelate' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - center: The center of the effect as x and y pixel coordinates.
	///   - scale: The scale determines the size of the squares. Larger values result in larger squares. (1.0...)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Makes an image blocky.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Stylize, Video
	///
	/// **Documentation Links**
	/// - [CIPixellate Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPixellate)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIPixellate/)
	@inlinable func applyingPixellate(
		center: CGPoint = CIFF.Pixellate.centerDefault,
		scale: Double = CIFF.Pixellate.scaleDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.Pixellate(
			inputImage: self,
			center: center,
			scale: scale
		)?.outputImage ?? CIImage.empty()
	}
}
