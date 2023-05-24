//
//  NinePartStretched.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Nine Part Stretched
	///
	/// Distorts an image by stretching an image based on two input breakpoints.
	///
	/// **CIFilter Name**
	/// - CINinePartStretched
	///
	/// **Availability**
	/// - macOS 10.12, iOS 10, tvOS 10
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - DistortionEffect (*CICategoryDistortionEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CINinePartStretched Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINinePartStretched)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CINinePartStretched/)
	@available(macOS 10.12, iOS 10, tvOS 10, *)
	@objc(CIFFNinePartStretched) class NinePartStretched: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CINinePartStretched")
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

		// MARK: - breakpoint0 (inputBreakpoint0)

		/// Lower left corner of image to retain before stretching begins.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBreakpoint0`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 50.0, y: 50.0)`
		@objc public var breakpoint0: CGPoint {
			get {
				self.cgPointValue(forKey: "inputBreakpoint0", defaultValue: Self.breakpoint0Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBreakpoint0")
			}
		}

		/// `breakpoint0` default value
		@objc public static let breakpoint0Default = CGPoint(x: 50.0, y: 50.0)

		// MARK: - breakpoint1 (inputBreakpoint1)

		/// Upper right corner of image to retain after stretching ends.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBreakpoint1`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var breakpoint1: CGPoint {
			get {
				self.cgPointValue(forKey: "inputBreakpoint1", defaultValue: Self.breakpoint1Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBreakpoint1")
			}
		}

		/// `breakpoint1` default value
		@objc public static let breakpoint1Default = CGPoint(x: 150.0, y: 150.0)

		// MARK: - growAmount (inputGrowAmount)

		/// Vector indicating how much image should grow in pixels in both dimensions.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGrowAmount`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default Value: `CGPoint(x: 100.0, y: 100.0)`
		@objc public var growAmount: CGPoint {
			get {
				self.cgPointValue(forKey: "inputGrowAmount", defaultValue: Self.growAmountDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputGrowAmount")
			}
		}

		/// `growAmount` default value
		@objc public static let growAmountDefault = CGPoint(x: 100.0, y: 100.0)

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - breakpoint0: Lower left corner of image to retain before stretching begins.
		///   - breakpoint1: Upper right corner of image to retain after stretching ends.
		///   - growAmount: Vector indicating how much image should grow in pixels in both dimensions.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			breakpoint0: CGPoint = NinePartStretched.breakpoint0Default,
			breakpoint1: CGPoint = NinePartStretched.breakpoint1Default,
			growAmount: CGPoint = NinePartStretched.growAmountDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.breakpoint0 = breakpoint0
			self.breakpoint1 = breakpoint1
			self.growAmount = growAmount
		}
	}
}

@available(macOS 10.12, iOS 10, tvOS 10, *)
public extension CIImage {
	/// Apply the 'Nine Part Stretched' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - breakpoint0: Lower left corner of image to retain before stretching begins.
	///   - breakpoint1: Upper right corner of image to retain after stretching ends.
	///   - growAmount: Vector indicating how much image should grow in pixels in both dimensions.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Distorts an image by stretching an image based on two input breakpoints.
	///
	/// **Categories**: BuiltIn, DistortionEffect, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CINinePartStretched Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINinePartStretched)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CINinePartStretched/)
	@inlinable func applyingNinePartStretched(
		breakpoint0: CGPoint = CIFF.NinePartStretched.breakpoint0Default,
		breakpoint1: CGPoint = CIFF.NinePartStretched.breakpoint1Default,
		growAmount: CGPoint = CIFF.NinePartStretched.growAmountDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.NinePartStretched(
			inputImage: self,
			breakpoint0: breakpoint0,
			breakpoint1: breakpoint1,
			growAmount: growAmount
		)?.outputImage ?? CIImage.empty()
	}
}
