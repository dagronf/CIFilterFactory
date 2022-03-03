//
//  DepthBlurEffect.swift  (AUTOMATICALLY GENERATED FILE)
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

import AVFoundation
import CoreImage
import CoreML
import Foundation

@available(macOS 10.13, iOS 11, tvOS 11, *)
@objc public extension CIFF {
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
	@available(macOS 10.13, iOS 11, tvOS 11, *)
	@objc(CIFFDepthBlurEffect) class DepthBlurEffect: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIDepthBlurEffect")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - disparityImage (inputDisparityImage)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputDisparityImage`
		/// - Internal class: `CIImage`
		@objc public var disparityImage: CIImage? {
			get {
				return self.keyedValue("inputDisparityImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputDisparityImage")
			}
		}

		// MARK: - matteImage (inputMatteImage)

		/// A matting image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMatteImage`
		/// - Internal class: `CIImage`
		@objc public var matteImage: CIImage? {
			get {
				return self.keyedValue("inputMatteImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMatteImage")
			}
		}

		// MARK: - hairImage (inputHairImage)

		/// A segmentation matte image that corresponds to people’s hair.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputHairImage`
		/// - Internal class: `CIImage`
		@objc public var hairImage: CIImage? {
			get {
				return self.keyedValue("inputHairImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputHairImage")
			}
		}

		// MARK: - glassesImage (inputGlassesImage)

		/// A segmentation matte image that corresponds to people’s glasses.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGlassesImage`
		/// - Internal class: `CIImage`
		@objc public var glassesImage: CIImage? {
			get {
				return self.keyedValue("inputGlassesImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGlassesImage")
			}
		}

		// MARK: - gainMap (inputGainMap)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGainMap`
		/// - Internal class: `CIImage`
		@objc public var gainMap: CIImage? {
			get {
				return self.keyedValue("inputGainMap")
			}
			set {
				self.setKeyedValue(newValue, for: "inputGainMap")
			}
		}

		// MARK: - aperture (inputAperture)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAperture`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		/// - Maximum value: `22.0`
		@objc public var aperture: Double {
			get {
				let number = self.filter.value(forKey: "inputAperture") as? NSNumber
				return number?.doubleValue ?? 0
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: DepthBlurEffect.apertureRange)
				self.filter.setValue(number, forKey: "inputAperture")
			}
		}

		/// `aperture` range definition
		public static let apertureRange: ClosedRange<Double> = 0.0 ... 22.0

		// MARK: - leftEyePositions (inputLeftEyePositions)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLeftEyePositions`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[-1 -1]`
		@objc public var leftEyePositions: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputLeftEyePositions", defaultValue: Self.leftEyePositionsDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputLeftEyePositions")
			}
		}

		/// leftEyePositions default value
		@objc public static let leftEyePositionsDefault = CGPoint(x: -1.0, y: -1.0)

		// MARK: - rightEyePositions (inputRightEyePositions)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRightEyePositions`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[-1 -1]`
		@objc public var rightEyePositions: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputRightEyePositions", defaultValue: Self.rightEyePositionsDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputRightEyePositions")
			}
		}

		/// rightEyePositions default value
		@objc public static let rightEyePositionsDefault = CGPoint(x: -1.0, y: -1.0)

		// MARK: - chinPositions (inputChinPositions)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputChinPositions`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[-1 -1]`
		@objc public var chinPositions: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputChinPositions", defaultValue: Self.chinPositionsDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputChinPositions")
			}
		}

		/// chinPositions default value
		@objc public static let chinPositionsDefault = CGPoint(x: -1.0, y: -1.0)

		// MARK: - nosePositions (inputNosePositions)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNosePositions`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[-1 -1]`
		@objc public var nosePositions: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputNosePositions", defaultValue: Self.nosePositionsDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputNosePositions")
			}
		}

		/// nosePositions default value
		@objc public static let nosePositionsDefault = CGPoint(x: -1.0, y: -1.0)

		// MARK: - focusRect (inputFocusRect)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFocusRect`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeRectangle`
		@objc public var focusRect: CGRect {
			get {
				return CGRect(with: self.filter, key: "inputFocusRect", defaultValue: Self.focusRectDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputFocusRect")
			}
		}

		/// focusRect default value
		@objc public static let focusRectDefault = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)

		// MARK: - lumaNoiseScale (inputLumaNoiseScale)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLumaNoiseScale`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		/// - Maximum value: `0.1`
		@objc public var lumaNoiseScale: Double {
			get {
				let number = self.filter.value(forKey: "inputLumaNoiseScale") as? NSNumber
				return number?.doubleValue ?? 0
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: DepthBlurEffect.lumaNoiseScaleRange)
				self.filter.setValue(number, forKey: "inputLumaNoiseScale")
			}
		}

		/// `lumaNoiseScale` range definition
		public static let lumaNoiseScaleRange: ClosedRange<Double> = 0.0 ... 0.1

		// MARK: - scaleFactor (inputScaleFactor)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputScaleFactor`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		@objc public var scaleFactor: Double {
			get {
				let number = self.filter.value(forKey: "inputScaleFactor") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputScaleFactor")
			}
		}

		// MARK: - calibrationData (inputCalibrationData)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCalibrationData`
		/// - Internal class: `AVCameraCalibrationData`
		@objc public var calibrationData: AVCameraCalibrationData? {
			get {
				return self.keyedValue("inputCalibrationData")
			}
			set {
				self.setKeyedValue(newValue, for: "inputCalibrationData")
			}
		}

		// MARK: - auxDataMetadata (inputAuxDataMetadata)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAuxDataMetadata`
		/// - Internal class: `CGImageMetadataRef`
		@objc public var auxDataMetadata: CGImageMetadata? {
			get {
				return self.keyedValue("inputAuxDataMetadata")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAuxDataMetadata")
			}
		}

		// MARK: - shape (inputShape)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputShape`
		/// - Internal class: `NSString`
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

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			disparityImage: CIImage,
			matteImage: CIImage,
			hairImage: CIImage,
			glassesImage: CIImage,
			gainMap: CIImage,
			aperture: Double = 0,
			leftEyePositions: CGPoint = DepthBlurEffect.leftEyePositionsDefault,
			rightEyePositions: CGPoint = DepthBlurEffect.rightEyePositionsDefault,
			chinPositions: CGPoint = DepthBlurEffect.chinPositionsDefault,
			nosePositions: CGPoint = DepthBlurEffect.nosePositionsDefault,
			focusRect: CGRect,
			lumaNoiseScale: Double = 0,
			scaleFactor: Double = 1,
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