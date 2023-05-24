//
//  DissolveTransition.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Dissolve
	///
	/// Uses a dissolve to transition from one image to another.
	///
	/// **CIFilter Name**
	/// - CIDissolveTransition
	///
	/// **Availability**
	/// - macOS 10.4, iOS 6, tvOS 6
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - Interlaced (*CICategoryInterlaced*)
	/// - NonSquarePixels (*CICategoryNonSquarePixels*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Transition (*CICategoryTransition*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIDissolveTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDissolveTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDissolveTransition/)
	@available(macOS 10.4, iOS 6, tvOS 6, *)
	@objc(CIFFDissolveTransition) class DissolveTransition: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIDissolveTransition")
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

		// MARK: - targetImage (inputTargetImage)

		/// The target image for a transition.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTargetImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var targetImage: CIImage? {
			get {
				self.keyedValue("inputTargetImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputTargetImage")
			}
		}

		// MARK: - time (inputTime)

		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTime`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeTime`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `1.0`
		/// - Default Value: `0.0`
		@objc public var time: Double {
			get {
				self.doubleValue(forKey: "inputTime", defaultValue: Self.timeDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DissolveTransition.timeRange, forKey: "inputTime")
			}
		}

		/// `time` default value
		@objc public static let timeDefault: Double = 0.0

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - targetImage: The target image for a transition.
		///   - time: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			targetImage: CIImage? = nil,
			time: Double = DissolveTransition.timeDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let targetImage = targetImage {
				self.targetImage = targetImage
			}
			self.time = time
		}
	}
}

@available(macOS 10.4, iOS 6, tvOS 6, *)
public extension CIImage {
	/// Apply the 'Dissolve' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - targetImage: The target image for a transition.
	///   - time: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). (0.0...1.0)
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Uses a dissolve to transition from one image to another.
	///
	/// **Categories**: BuiltIn, HighDynamicRange, Interlaced, NonSquarePixels, StillImage, Transition, Video
	///
	/// **Documentation Links**
	/// - [CIDissolveTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDissolveTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDissolveTransition/)
	@inlinable func applyingDissolveTransition(
		targetImage: CIImage,
		time: Double = CIFF.DissolveTransition.timeDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.DissolveTransition(
			inputImage: self,
			targetImage: targetImage,
			time: time
		)?.outputImage ?? CIImage.empty()
	}
}
