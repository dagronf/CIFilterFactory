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
	@objc(CIFilterFactory_CIDepthBlurEffect) class CIDepthBlurEffect: FilterCommon {
		@objc public init?() {
			super.init(name: "CIDepthBlurEffect")
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class: CIImage, Type: CIAttributeTypeImage
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputDisparityImage

		///
		/// No Description
		///
		///   Class: CIImage, Type: Not specified
		///
		@objc public var inputDisparityImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputDisparityImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputDisparityImage")
			}
		}

		// MARK: - inputMatteImage

		///
		/// A matting image.
		///
		///   Class: CIImage, Type: Not specified
		///
		@objc public var inputMatteImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMatteImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMatteImage")
			}
		}

		// MARK: - inputHairImage

		///
		/// A matting image.
		///
		///   Class: CIImage, Type: Not specified
		///
		@objc public var inputHairImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputHairImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputHairImage")
			}
		}

		// MARK: - inputAperture

		///
		/// No Description
		///
		///   Class: NSNumber, Type: CIAttributeTypeScalar
		///
		///   minValue: 0.0
		///   maxValue: 22.0
		///
		let inputAperture_Range: ClosedRange<Float> = 0.0 ... 22.0
		@objc public var inputAperture: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAperture") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputAperture_Range), forKey: "inputAperture")
			}
		}

		// MARK: - inputLeftEyePositions

		///
		/// No Description
		///
		///   Class: CIVector, Type: CIAttributeTypePosition
		///
		@objc public var inputLeftEyePositions: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputLeftEyePositions")
			}
			set {
				self.filter.setValue(newValue?.point, forKey: "inputLeftEyePositions")
			}
		}

		// MARK: - inputRightEyePositions

		///
		/// No Description
		///
		///   Class: CIVector, Type: CIAttributeTypePosition
		///
		@objc public var inputRightEyePositions: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputRightEyePositions")
			}
			set {
				self.filter.setValue(newValue?.point, forKey: "inputRightEyePositions")
			}
		}

		// MARK: - inputChinPositions

		///
		/// No Description
		///
		///   Class: CIVector, Type: CIAttributeTypePosition
		///
		@objc public var inputChinPositions: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputChinPositions")
			}
			set {
				self.filter.setValue(newValue?.point, forKey: "inputChinPositions")
			}
		}

		// MARK: - inputNosePositions

		///
		/// No Description
		///
		///   Class: CIVector, Type: CIAttributeTypePosition
		///
		@objc public var inputNosePositions: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputNosePositions")
			}
			set {
				self.filter.setValue(newValue?.point, forKey: "inputNosePositions")
			}
		}

		// MARK: - inputFocusRect

		///
		/// No Description
		///
		///   Class: CIVector, Type: CIAttributeTypeRectangle
		///
		@objc public var inputFocusRect: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputFocusRect")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputFocusRect")
			}
		}

		// MARK: - inputLumaNoiseScale

		///
		/// No Description
		///
		///   Class: NSNumber, Type: CIAttributeTypeScalar
		///
		///   minValue: 0.0
		///
		let inputLumaNoiseScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputLumaNoiseScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputLumaNoiseScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputLumaNoiseScale_Range), forKey: "inputLumaNoiseScale")
			}
		}

		// MARK: - inputScaleFactor

		///
		/// No Description
		///
		///   Class: NSNumber, Type: CIAttributeTypeScalar
		///
		@objc public var inputScaleFactor: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScaleFactor") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputScaleFactor")
			}
		}

		// MARK: - inputCalibrationData

		///
		/// No Description
		///
		///   Class: AVCameraCalibrationData, Type: Not specified
		///
		@objc public var inputCalibrationData: AVCameraCalibrationData? {
			get {
				return self.filter.value(forKey: "inputCalibrationData") as? AVCameraCalibrationData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCalibrationData")
			}
		}

		// MARK: - inputAuxDataMetadata

		///
		/// No Description
		///
		///   Class: CGImageMetadataRef, Type: Not specified
		///
		@objc public var inputAuxDataMetadata: CGImageMetadata? {
			get {
				return (self.filter.value(forKey: "inputAuxDataMetadata") as! CGImageMetadata)
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAuxDataMetadata")
			}
		}

		// MARK: - inputShape

		///
		/// No Description
		///
		///   Class: NSString, Type: Not specified
		///
		@objc public var inputShape: NSString? {
			get {
				return self.filter.value(forKey: "inputShape") as? NSString
			}
			set {
				self.filter.setValue(newValue, forKey: "inputShape")
			}
		}
	}
}
