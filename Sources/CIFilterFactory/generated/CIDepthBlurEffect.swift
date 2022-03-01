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

@available(macOS 10.13, iOS 11, tvOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Depth Blur Effect
	///
	/// Applies a variable radius disc blur to an image where areas in the background are softened more than those in the foreground.
	///
	/// **Links**
	///
	/// - [CIDepthBlurEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthBlurEffect)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cidepthblureffect?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDepthBlurEffect/)
	///
	@objc(CIFilterFactory_DepthBlurEffect) class DepthBlurEffect: FilterCore {
		@objc public init?() {
			super.init(name: "CIDepthBlurEffect")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   - Attribute key: `inputImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - disparityImage (inputDisparityImage)

		///
		/// No Description
		///
		///   - Attribute key: `inputDisparityImage`
		///   - Internal class: `CIImage`
		@objc public var disparityImage: CIImage? {
			get {
				return self.keyedValue("inputDisparityImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputDisparityImage")
			}
		}

		// MARK: - matteImage (inputMatteImage)

		///
		/// A matting image.
		///
		///   - Attribute key: `inputMatteImage`
		///   - Internal class: `CIImage`
		@objc public var matteImage: CIImage? {
			get {
				return self.keyedValue("inputMatteImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMatteImage")
			}
		}

		// MARK: - hairImage (inputHairImage)

		///
		/// A segmentation matte image that corresponds to people’s hair.
		///
		///   - Attribute key: `inputHairImage`
		///   - Internal class: `CIImage`
		@objc public var hairImage: CIImage? {
			get {
				return self.keyedValue("inputHairImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputHairImage")
			}
		}

		// MARK: - glassesImage (inputGlassesImage)

		///
		/// A segmentation matte image that corresponds to people’s glasses.
		///
		///   - Attribute key: `inputGlassesImage`
		///   - Internal class: `CIImage`
		@objc public var glassesImage: CIImage? {
			get {
				return self.keyedValue("inputGlassesImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGlassesImage")
			}
		}

		// MARK: - gainMap (inputGainMap)

		///
		/// No Description
		///
		///   - Attribute key: `inputGainMap`
		///   - Internal class: `CIImage`
		@objc public var gainMap: CIImage? {
			get {
				return self.keyedValue("inputGainMap")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGainMap")
			}
		}

		// MARK: - aperture (inputAperture)

		///
		/// No Description
		///
		///   - Attribute key: `inputAperture`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0`
		///   minValue: 0.0
		///   maxValue: 22.0
		///
		public static let aperture_Range: ClosedRange<Float> = 0.0 ... 22.0
		@objc public var aperture: NSNumber? {
			get {
				return self.keyedValue("inputAperture")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DepthBlurEffect.aperture_Range), forKey: "inputAperture")
			}
		}

		// MARK: - leftEyePositions (inputLeftEyePositions)

		///
		/// No Description
		///
		///   - Attribute key: `inputLeftEyePositions`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[-1 -1]`
		@objc public var leftEyePositions: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputLeftEyePositions", defaultValue: Self.leftEyePositions_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputLeftEyePositions")
			}
		}

		/// leftEyePositions default value
		@objc public static let leftEyePositions_default = CGPoint(x: -1.0, y: -1.0)

		// MARK: - rightEyePositions (inputRightEyePositions)

		///
		/// No Description
		///
		///   - Attribute key: `inputRightEyePositions`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[-1 -1]`
		@objc public var rightEyePositions: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputRightEyePositions", defaultValue: Self.rightEyePositions_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputRightEyePositions")
			}
		}

		/// rightEyePositions default value
		@objc public static let rightEyePositions_default = CGPoint(x: -1.0, y: -1.0)

		// MARK: - chinPositions (inputChinPositions)

		///
		/// No Description
		///
		///   - Attribute key: `inputChinPositions`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[-1 -1]`
		@objc public var chinPositions: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputChinPositions", defaultValue: Self.chinPositions_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputChinPositions")
			}
		}

		/// chinPositions default value
		@objc public static let chinPositions_default = CGPoint(x: -1.0, y: -1.0)

		// MARK: - nosePositions (inputNosePositions)

		///
		/// No Description
		///
		///   - Attribute key: `inputNosePositions`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[-1 -1]`
		@objc public var nosePositions: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputNosePositions", defaultValue: Self.nosePositions_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputNosePositions")
			}
		}

		/// nosePositions default value
		@objc public static let nosePositions_default = CGPoint(x: -1.0, y: -1.0)

		// MARK: - focusRect (inputFocusRect)

		///
		/// No Description
		///
		///   - Attribute key: `inputFocusRect`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypeRectangle`
		@objc public var focusRect: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputFocusRect", defaultValue: Self.focusRect_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputFocusRect")
			}
		}

		/// focusRect default value
		@objc public static let focusRect_default = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)

		// MARK: - lumaNoiseScale (inputLumaNoiseScale)

		///
		/// No Description
		///
		///   - Attribute key: `inputLumaNoiseScale`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0`
		///   minValue: 0.0
		///
		public static let lumaNoiseScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var lumaNoiseScale: NSNumber? {
			get {
				return self.keyedValue("inputLumaNoiseScale")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: DepthBlurEffect.lumaNoiseScale_Range), forKey: "inputLumaNoiseScale")
			}
		}

		// MARK: - scaleFactor (inputScaleFactor)

		///
		/// No Description
		///
		///   - Attribute key: `inputScaleFactor`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		@objc public var scaleFactor: NSNumber? {
			get {
				return self.keyedValue("inputScaleFactor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputScaleFactor")
			}
		}

		// MARK: - calibrationData (inputCalibrationData)

		///
		/// No Description
		///
		///   - Attribute key: `inputCalibrationData`
		///   - Internal class: `AVCameraCalibrationData`
		@objc public var calibrationData: AVCameraCalibrationData? {
			get {
				return self.keyedValue("inputCalibrationData")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCalibrationData")
			}
		}

		// MARK: - auxDataMetadata (inputAuxDataMetadata)

		///
		/// No Description
		///
		///   - Attribute key: `inputAuxDataMetadata`
		///   - Internal class: `CGImageMetadataRef`
		@objc public var auxDataMetadata: CGImageMetadata? {
			get {
				return self.keyedValue("inputAuxDataMetadata")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAuxDataMetadata")
			}
		}

		// MARK: - shape (inputShape)

		///
		/// No Description
		///
		///   - Attribute key: `inputShape`
		///   - Internal class: `NSString`
		@objc public var shape: String? {
			get {
				let tmp: NSString? = self.keyedValue("inputShape")
				return tmp as String?
			}
			set {
				self.setKeyedValue(newValue as NSString?, for: "inputShape")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			disparityImage: CIImage,
			matteImage: CIImage,
			hairImage: CIImage,
			glassesImage: CIImage,
			gainMap: CIImage,
			aperture: NSNumber = 0,
			leftEyePositions: CGPoint = DepthBlurEffect.leftEyePositions_default,
			rightEyePositions: CGPoint = DepthBlurEffect.rightEyePositions_default,
			chinPositions: CGPoint = DepthBlurEffect.chinPositions_default,
			nosePositions: CGPoint = DepthBlurEffect.nosePositions_default,
			focusRect: CGRect,
			lumaNoiseScale: NSNumber = 0,
			scaleFactor: NSNumber = 1,
			calibrationData: AVCameraCalibrationData,
			auxDataMetadata: CGImageMetadata,
			shape: String
		) {
			self.init()

			self.image = image
			self.disparityImage = disparityImage
			self.matteImage = matteImage
			self.hairImage = hairImage
			self.glassesImage = glassesImage
			self.gainMap = gainMap
			self.aperture = aperture
			self.leftEyePositions = leftEyePositions
			self.rightEyePositions = rightEyePositions
			self.chinPositions = chinPositions
			self.nosePositions = nosePositions
			self.focusRect = focusRect
			self.lumaNoiseScale = lumaNoiseScale
			self.scaleFactor = scaleFactor
			self.calibrationData = calibrationData
			self.auxDataMetadata = auxDataMetadata
			self.shape = shape
		}
	}
}
