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

public extension CIFilter {
	@available(macOS 10.13, iOS 11, *)
	@inlinable @objc static func DepthBlurEffect() -> CIFilterFactory.CIDepthBlurEffect? {
		return CIFilterFactory.CIDepthBlurEffect()
	}
}

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
	@objc(CIFilterFactory_CIDepthBlurEffect) class CIDepthBlurEffect: FilterCore {
		@objc public init?() {
			super.init(name: "CIDepthBlurEffect")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIImage
		@objc public dynamic var inputDisparityImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputDisparityImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputDisparityImage")
			}
		}

		///
		/// A matting image.
		///
		///   Class:    CIImage
		@objc public dynamic var inputMatteImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMatteImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMatteImage")
			}
		}

		///
		/// A segmentation matte image that corresponds to people’s hair.
		///
		///   Class:    CIImage
		@objc public dynamic var inputHairImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputHairImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputHairImage")
			}
		}

		///
		/// A segmentation matte image that corresponds to people’s glasses.
		///
		///   Class:    CIImage
		@objc public dynamic var inputGlassesImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputGlassesImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputGlassesImage")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIImage
		@objc public dynamic var inputGainMap: CIImage? {
			get {
				return self.filter.value(forKey: "inputGainMap") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputGainMap")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 22.0
		///
		public static let inputAperture_Range: ClosedRange<Float> = 0.0 ... 22.0
		@objc public dynamic var inputAperture: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAperture") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDepthBlurEffect.inputAperture_Range), forKey: "inputAperture")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [-1 -1]
		@objc public dynamic var inputLeftEyePositions: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputLeftEyePositions")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputLeftEyePositions")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [-1 -1]
		@objc public dynamic var inputRightEyePositions: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputRightEyePositions")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputRightEyePositions")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [-1 -1]
		@objc public dynamic var inputChinPositions: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputChinPositions")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputChinPositions")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [-1 -1]
		@objc public dynamic var inputNosePositions: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputNosePositions")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputNosePositions")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeRectangle
		@objc public dynamic var inputFocusRect: CIFilterFactory.Rect? {
			get {
				return CIFilterFactory.Rect(with: self.filter, key: "inputFocusRect")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputFocusRect")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0
		///   minValue: 0.0
		///
		public static let inputLumaNoiseScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputLumaNoiseScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputLumaNoiseScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDepthBlurEffect.inputLumaNoiseScale_Range), forKey: "inputLumaNoiseScale")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		@objc public dynamic var inputScaleFactor: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScaleFactor") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputScaleFactor")
			}
		}

		///
		/// No Description
		///
		///   Class:    AVCameraCalibrationData
		@objc public dynamic var inputCalibrationData: AVCameraCalibrationData? {
			get {
				return self.filter.value(forKey: "inputCalibrationData") as? AVCameraCalibrationData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCalibrationData")
			}
		}

		///
		/// No Description
		///
		///   Class:    CGImageMetadataRef
		@objc public dynamic var inputAuxDataMetadata: CGImageMetadata? {
			get {
				return (self.filter.value(forKey: "inputAuxDataMetadata") as! CGImageMetadata)
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAuxDataMetadata")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSString
		@objc public dynamic var inputShape: NSString? {
			get {
				return self.filter.value(forKey: "inputShape") as? NSString
			}
			set {
				self.filter.setValue(newValue, forKey: "inputShape")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputDisparityImage: CIImage,
			inputMatteImage: CIImage,
			inputHairImage: CIImage,
			inputGlassesImage: CIImage,
			inputGainMap: CIImage,
			inputAperture: NSNumber = 0,
			inputLeftEyePositions: CIFilterFactory.Point = CIFilterFactory.Point(x: -1.0, y: -1.0),
			inputRightEyePositions: CIFilterFactory.Point = CIFilterFactory.Point(x: -1.0, y: -1.0),
			inputChinPositions: CIFilterFactory.Point = CIFilterFactory.Point(x: -1.0, y: -1.0),
			inputNosePositions: CIFilterFactory.Point = CIFilterFactory.Point(x: -1.0, y: -1.0),
			inputFocusRect: CIFilterFactory.Rect,
			inputLumaNoiseScale: NSNumber = 0,
			inputScaleFactor: NSNumber = 1,
			inputCalibrationData: AVCameraCalibrationData,
			inputAuxDataMetadata: CGImageMetadata,
			inputShape: NSString
		) {
			self.init()

			self.inputImage = inputImage
			self.inputDisparityImage = inputDisparityImage
			self.inputMatteImage = inputMatteImage
			self.inputHairImage = inputHairImage
			self.inputGlassesImage = inputGlassesImage
			self.inputGainMap = inputGainMap
			self.inputAperture = inputAperture
			self.inputLeftEyePositions = inputLeftEyePositions
			self.inputRightEyePositions = inputRightEyePositions
			self.inputChinPositions = inputChinPositions
			self.inputNosePositions = inputNosePositions
			self.inputFocusRect = inputFocusRect
			self.inputLumaNoiseScale = inputLumaNoiseScale
			self.inputScaleFactor = inputScaleFactor
			self.inputCalibrationData = inputCalibrationData
			self.inputAuxDataMetadata = inputAuxDataMetadata
			self.inputShape = inputShape
		}
	}
}
