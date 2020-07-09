//
//  CIDepthBlurEffect.swift  (AUTOMATICALLY GENERATED FILE)
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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Depth Blur Effect
	///
	/// Applies a variable radius disc blur to an image where areas in the background are softened more than those in the foreground.
	///
	/// **Links**
	///
	/// [CIDepthBlurEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthBlurEffect)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDepthBlurEffect/)
	///
	@objc(CIFilterFactory_CIDepthBlurEffect) class CIDepthBlurEffect: Core {
		@objc public init?() {
			super.init(name: "CIDepthBlurEffect")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputDisparityImage

		///
		/// No Description
		///
		@objc public var inputDisparityImage: CIImage? {
			get {
				return filter.value(forKey: "inputDisparityImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputDisparityImage")
			}
		}

		// MARK: - inputMatteImage

		///
		/// A matting image.
		///
		@objc public var inputMatteImage: CIImage? {
			get {
				return filter.value(forKey: "inputMatteImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputMatteImage")
			}
		}

		// MARK: - inputHairImage

		///
		/// A matting image.
		///
		@objc public var inputHairImage: CIImage? {
			get {
				return filter.value(forKey: "inputHairImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputHairImage")
			}
		}

		// MARK: - inputAperture

		///
		/// No Description
		///
		///   minValue: 0.0
		///   maxValue: 22.0
		///
		let inputAperture_Range: ClosedRange<Float> = 0.0 ... 22.0
		@objc public var inputAperture: NSNumber? {
			get {
				return filter.value(forKey: "inputAperture") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputAperture_Range), forKey: "inputAperture")
			}
		}

		// MARK: - inputLeftEyePositions

		///
		/// No Description
		///
		@objc public var inputLeftEyePositions: CIVector? {
			get {
				return filter.value(forKey: "inputLeftEyePositions") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputLeftEyePositions")
			}
		}

		// MARK: - inputRightEyePositions

		///
		/// No Description
		///
		@objc public var inputRightEyePositions: CIVector? {
			get {
				return filter.value(forKey: "inputRightEyePositions") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputRightEyePositions")
			}
		}

		// MARK: - inputChinPositions

		///
		/// No Description
		///
		@objc public var inputChinPositions: CIVector? {
			get {
				return filter.value(forKey: "inputChinPositions") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputChinPositions")
			}
		}

		// MARK: - inputNosePositions

		///
		/// No Description
		///
		@objc public var inputNosePositions: CIVector? {
			get {
				return filter.value(forKey: "inputNosePositions") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputNosePositions")
			}
		}

		// MARK: - inputFocusRect

		///
		/// No Description
		///
		@objc public var inputFocusRect: CIVector? {
			get {
				return filter.value(forKey: "inputFocusRect") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputFocusRect")
			}
		}

		// MARK: - inputLumaNoiseScale

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputLumaNoiseScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputLumaNoiseScale: NSNumber? {
			get {
				return filter.value(forKey: "inputLumaNoiseScale") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputLumaNoiseScale_Range), forKey: "inputLumaNoiseScale")
			}
		}

		// MARK: - inputScaleFactor

		///
		/// No Description
		///
		@objc public var inputScaleFactor: NSNumber? {
			get {
				return filter.value(forKey: "inputScaleFactor") as? NSNumber
			}
			set {
				filter.setValue(newValue, forKey: "inputScaleFactor")
			}
		}

		// MARK: - inputCalibrationData

		///
		/// No Description
		///
		@objc public var inputCalibrationData: AVCameraCalibrationData? {
			get {
				return filter.value(forKey: "inputCalibrationData") as? AVCameraCalibrationData
			}
			set {
				filter.setValue(newValue, forKey: "inputCalibrationData")
			}
		}

		// MARK: - inputAuxDataMetadata

		///
		/// No Description
		///
		@objc public var inputAuxDataMetadata: CGImageMetadata? {
			get {
				return (filter.value(forKey: "inputAuxDataMetadata") as! CGImageMetadata)
			}
			set {
				filter.setValue(newValue, forKey: "inputAuxDataMetadata")
			}
		}

		// MARK: - inputShape

		///
		/// No Description
		///
		@objc public var inputShape: NSString? {
			get {
				return filter.value(forKey: "inputShape") as? NSString
			}
			set {
				filter.setValue(newValue, forKey: "inputShape")
			}
		}
	}
}
