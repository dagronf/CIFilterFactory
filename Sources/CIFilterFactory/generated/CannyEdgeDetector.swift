//
//  CannyEdgeDetector.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Canny Edge Detector
	///
	/// Applies the Canny Edge Detection algorithm to an image.
	///
	/// **CIFilter Name**
	/// - CICannyEdgeDetector
	///
	/// **Availability**
	/// - macOS 14.0, iOS 17, tvOS 17
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Stylize (*CICategoryStylize*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CICannyEdgeDetector Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICannyEdgeDetector)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICannyEdgeDetector/)
	@available(macOS 14.0, iOS 17, tvOS 17, *)
	@objc(CIFFCannyEdgeDetector) class CannyEdgeDetector: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CICannyEdgeDetector")
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

		// MARK: - gaussianSigma (inputGaussianSigma)

		/// The gaussian sigma of blur to apply to the image to reduce high-frequency noise.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGaussianSigma`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.6`
		@objc public var gaussianSigma: Double {
			get {
				self.doubleValue(forKey: "inputGaussianSigma", defaultValue: Self.gaussianSigmaDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: CannyEdgeDetector.gaussianSigmaRange, forKey: "inputGaussianSigma")
			}
		}

		/// `gaussianSigma` default value
		@objc public static let gaussianSigmaDefault: Double = 1.6

		/// `gaussianSigma` range definition
		public static let gaussianSigmaRange = PartialRangeFrom<Double>(0.0)

		// MARK: - perceptual (inputPerceptual)

		/// Specifies whether the edge thresholds should be computed in a perceptual color space.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPerceptual`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var perceptual: Bool {
			get {
				self.boolValue(forKey: "inputPerceptual", defaultValue: Self.perceptualDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputPerceptual")
			}
		}

		/// `perceptual` default value
		@objc public static let perceptualDefault: Bool = false

		// MARK: - thresholdHigh (inputThresholdHigh)

		/// The threshold that determines if gradient magnitude is a strong edge.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputThresholdHigh`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.05`
		@objc public var thresholdHigh: Double {
			get {
				self.doubleValue(forKey: "inputThresholdHigh", defaultValue: Self.thresholdHighDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: CannyEdgeDetector.thresholdHighRange, forKey: "inputThresholdHigh")
			}
		}

		/// `thresholdHigh` default value
		@objc public static let thresholdHighDefault: Double = 0.05

		/// `thresholdHigh` range definition
		public static let thresholdHighRange = PartialRangeFrom<Double>(0.0)

		// MARK: - thresholdLow (inputThresholdLow)

		/// The threshold that determines if gradient magnitude is a weak edge.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputThresholdLow`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Default Value: `0.02`
		@objc public var thresholdLow: Double {
			get {
				self.doubleValue(forKey: "inputThresholdLow", defaultValue: Self.thresholdLowDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: CannyEdgeDetector.thresholdLowRange, forKey: "inputThresholdLow")
			}
		}

		/// `thresholdLow` default value
		@objc public static let thresholdLowDefault: Double = 0.02

		/// `thresholdLow` range definition
		public static let thresholdLowRange = PartialRangeFrom<Double>(0.0)

		// MARK: - hysteresisPasses (inputHysteresisPasses)

		/// The number of hysteresis passes to apply to promote weak edge pixels.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputHysteresisPasses`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeInteger`
		/// - Minimum Value: `0`
		/// - Maximum Value: `20`
		/// - Default Value: `1`
		@objc public var hysteresisPasses: Int {
			get {
				self.intValue(forKey: "inputHysteresisPasses", defaultValue: Self.hysteresisPassesDefault)
			}
			set {
				self.setIntValue(newValue, bounds: CannyEdgeDetector.hysteresisPassesRange, forKey: "inputHysteresisPasses")
			}
		}

		/// `hysteresisPasses` default value
		@objc public static let hysteresisPassesDefault: Int = 1

		/// `hysteresisPasses` range definition
		public static let hysteresisPassesRange: ClosedRange<Int> = 0 ... 20

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - gaussianSigma: The gaussian sigma of blur to apply to the image to reduce high-frequency noise.
		///   - perceptual: Specifies whether the edge thresholds should be computed in a perceptual color space.
		///   - thresholdHigh: The threshold that determines if gradient magnitude is a strong edge.
		///   - thresholdLow: The threshold that determines if gradient magnitude is a weak edge.
		///   - hysteresisPasses: The number of hysteresis passes to apply to promote weak edge pixels.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			gaussianSigma: Double = CannyEdgeDetector.gaussianSigmaDefault,
			perceptual: Bool = CannyEdgeDetector.perceptualDefault,
			thresholdHigh: Double = CannyEdgeDetector.thresholdHighDefault,
			thresholdLow: Double = CannyEdgeDetector.thresholdLowDefault,
			hysteresisPasses: Int = CannyEdgeDetector.hysteresisPassesDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.gaussianSigma = gaussianSigma
			self.perceptual = perceptual
			self.thresholdHigh = thresholdHigh
			self.thresholdLow = thresholdLow
			self.hysteresisPasses = hysteresisPasses
		}
	}
}

@available(macOS 14.0, iOS 17, tvOS 17, *)
public extension CIImage {
	/// Apply the 'Canny Edge Detector' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - gaussianSigma: The gaussian sigma of blur to apply to the image to reduce high-frequency noise. (0.0...)
	///   - perceptual: Specifies whether the edge thresholds should be computed in a perceptual color space.
	///   - thresholdHigh: The threshold that determines if gradient magnitude is a strong edge. (0.0...)
	///   - thresholdLow: The threshold that determines if gradient magnitude is a weak edge. (0.0...)
	///   - hysteresisPasses: The number of hysteresis passes to apply to promote weak edge pixels. (0...20)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Applies the Canny Edge Detection algorithm to an image.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, StillImage, Stylize, Video
	///
	/// **Documentation Links**
	/// - [CICannyEdgeDetector Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICannyEdgeDetector)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICannyEdgeDetector/)
	@inlinable func applyingCannyEdgeDetector(
		gaussianSigma: Double = CIFF.CannyEdgeDetector.gaussianSigmaDefault,
		perceptual: Bool = CIFF.CannyEdgeDetector.perceptualDefault,
		thresholdHigh: Double = CIFF.CannyEdgeDetector.thresholdHighDefault,
		thresholdLow: Double = CIFF.CannyEdgeDetector.thresholdLowDefault,
		hysteresisPasses: Int = CIFF.CannyEdgeDetector.hysteresisPassesDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.CannyEdgeDetector(
			inputImage: self,
			gaussianSigma: gaussianSigma,
			perceptual: perceptual,
			thresholdHigh: thresholdHigh,
			thresholdLow: thresholdLow,
			hysteresisPasses: hysteresisPasses
		)?.outputImage ?? CIImage.empty()
	}
}
