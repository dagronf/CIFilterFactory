//
//  DepthBlurEffect.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Depth Blur Effect
	///
	/// Applies a variable radius disc blur to an image where areas in the background are softened more than those in the foreground.
	///
	/// **CIFilter Name**
	/// - CIDepthBlurEffect
	///
	/// **Availability**
	/// - macOS 10.13, iOS 11, tvOS 11, macCatalyst 14
	///
	/// **Categories**
	/// - Blur (*CICategoryBlur*)
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CIDepthBlurEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthBlurEffect)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDepthBlurEffect/)
	@available(macOS 10.13, iOS 11, tvOS 11, macCatalyst 14, *)
	@objc(CIFFDepthBlurEffect) class DepthBlurEffect: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CIDepthBlurEffect")
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

		// MARK: - disparityImage (inputDisparityImage)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputDisparityImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var disparityImage: CIImage? {
			get {
				self.keyedValue("inputDisparityImage")
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
		/// - Type: `CIAttributeTypeImage`
		@objc public var matteImage: CIImage? {
			get {
				self.keyedValue("inputMatteImage")
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
		/// - Type: `CIAttributeTypeImage`
		@objc public var hairImage: CIImage? {
			get {
				self.keyedValue("inputHairImage")
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
		/// - Type: `CIAttributeTypeImage`
		@objc public var glassesImage: CIImage? {
			get {
				self.keyedValue("inputGlassesImage")
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
		/// - Type: `CIAttributeTypeImage`
		@objc public var gainMap: CIImage? {
			get {
				self.keyedValue("inputGainMap")
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
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `22.0`
		/// - Default Value: `0.0`
		@objc public var aperture: Double {
			get {
				self.doubleValue(forKey: "inputAperture", defaultValue: Self.apertureDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DepthBlurEffect.apertureRange, forKey: "inputAperture")
			}
		}

		/// `aperture` default value
		@objc public static let apertureDefault: Double = 0.0

		/// `aperture` range definition
		public static let apertureRange: ClosedRange<Double> = 0.0 ... 22.0

		// MARK: - leftEyePositions (inputLeftEyePositions)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLeftEyePositions`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: -1.0, y: -1.0)`
		@objc public var leftEyePositions: CGPoint {
			get {
				self.cgPointValue(forKey: "inputLeftEyePositions", defaultValue: Self.leftEyePositionsDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputLeftEyePositions")
			}
		}

		/// `leftEyePositions` default value
		@objc public static let leftEyePositionsDefault = CGPoint(x: -1.0, y: -1.0)

		// MARK: - rightEyePositions (inputRightEyePositions)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRightEyePositions`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: -1.0, y: -1.0)`
		@objc public var rightEyePositions: CGPoint {
			get {
				self.cgPointValue(forKey: "inputRightEyePositions", defaultValue: Self.rightEyePositionsDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputRightEyePositions")
			}
		}

		/// `rightEyePositions` default value
		@objc public static let rightEyePositionsDefault = CGPoint(x: -1.0, y: -1.0)

		// MARK: - chinPositions (inputChinPositions)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputChinPositions`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: -1.0, y: -1.0)`
		@objc public var chinPositions: CGPoint {
			get {
				self.cgPointValue(forKey: "inputChinPositions", defaultValue: Self.chinPositionsDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputChinPositions")
			}
		}

		/// `chinPositions` default value
		@objc public static let chinPositionsDefault = CGPoint(x: -1.0, y: -1.0)

		// MARK: - nosePositions (inputNosePositions)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNosePositions`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: -1.0, y: -1.0)`
		@objc public var nosePositions: CGPoint {
			get {
				self.cgPointValue(forKey: "inputNosePositions", defaultValue: Self.nosePositionsDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputNosePositions")
			}
		}

		/// `nosePositions` default value
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
				self.cgRectValue(forKey: "inputFocusRect", defaultValue: Self.focusRectDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputFocusRect")
			}
		}

		/// `focusRect` default value
		@objc public static let focusRectDefault = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)

		// MARK: - lumaNoiseScale (inputLumaNoiseScale)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputLumaNoiseScale`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Minimum Value: `0.0`
		/// - Maximum Value: `0.1`
		/// - Default Value: `0.0`
		@objc public var lumaNoiseScale: Double {
			get {
				self.doubleValue(forKey: "inputLumaNoiseScale", defaultValue: Self.lumaNoiseScaleDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: DepthBlurEffect.lumaNoiseScaleRange, forKey: "inputLumaNoiseScale")
			}
		}

		/// `lumaNoiseScale` default value
		@objc public static let lumaNoiseScaleDefault: Double = 0.0

		/// `lumaNoiseScale` range definition
		public static let lumaNoiseScaleRange: ClosedRange<Double> = 0.0 ... 0.1

		// MARK: - scaleFactor (inputScaleFactor)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputScaleFactor`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default Value: `1.0`
		@objc public var scaleFactor: Double {
			get {
				self.doubleValue(forKey: "inputScaleFactor", defaultValue: Self.scaleFactorDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputScaleFactor")
			}
		}

		/// `scaleFactor` default value
		@objc public static let scaleFactorDefault: Double = 1.0

		// MARK: - calibrationData (inputCalibrationData)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCalibrationData`
		/// - Internal class: `AVCameraCalibrationData`
		@objc public var calibrationData: AVCameraCalibrationData? {
			get {
				self.keyedValue("inputCalibrationData")
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
				self.keyedValue("inputAuxDataMetadata")
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
				self.stringValue(forKey: "inputShape")
			}
			set {
				self.setKeyedValue(newValue as? NSString, for: "inputShape")
			}
		}

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to use as an input for the effect.
		///   - disparityImage: No Description
		///   - matteImage: A matting image.
		///   - hairImage: A segmentation matte image that corresponds to people’s hair.
		///   - glassesImage: A segmentation matte image that corresponds to people’s glasses.
		///   - gainMap: No Description
		///   - aperture: No Description
		///   - leftEyePositions: No Description
		///   - rightEyePositions: No Description
		///   - chinPositions: No Description
		///   - nosePositions: No Description
		///   - focusRect: No Description
		///   - lumaNoiseScale: No Description
		///   - scaleFactor: No Description
		///   - calibrationData: No Description
		///   - auxDataMetadata: No Description
		///   - shape: No Description
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			disparityImage: CIImage? = nil,
			matteImage: CIImage? = nil,
			hairImage: CIImage? = nil,
			glassesImage: CIImage? = nil,
			gainMap: CIImage? = nil,
			aperture: Double = DepthBlurEffect.apertureDefault,
			leftEyePositions: CGPoint = DepthBlurEffect.leftEyePositionsDefault,
			rightEyePositions: CGPoint = DepthBlurEffect.rightEyePositionsDefault,
			chinPositions: CGPoint = DepthBlurEffect.chinPositionsDefault,
			nosePositions: CGPoint = DepthBlurEffect.nosePositionsDefault,
			focusRect: CGRect,
			lumaNoiseScale: Double = DepthBlurEffect.lumaNoiseScaleDefault,
			scaleFactor: Double = DepthBlurEffect.scaleFactorDefault,
			calibrationData: AVCameraCalibrationData,
			auxDataMetadata: CGImageMetadata,
			shape: String
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			if let disparityImage = disparityImage {
				self.disparityImage = disparityImage
			}
			if let matteImage = matteImage {
				self.matteImage = matteImage
			}
			if let hairImage = hairImage {
				self.hairImage = hairImage
			}
			if let glassesImage = glassesImage {
				self.glassesImage = glassesImage
			}
			if let gainMap = gainMap {
				self.gainMap = gainMap
			}
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

@available(macOS 10.13, iOS 11, tvOS 11, macCatalyst 14, *)
public extension CIImage {
	/// Apply the 'Depth Blur Effect' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - disparityImage: No Description
	///   - matteImage: A matting image.
	///   - hairImage: A segmentation matte image that corresponds to people’s hair.
	///   - glassesImage: A segmentation matte image that corresponds to people’s glasses.
	///   - gainMap: No Description
	///   - aperture: No Description (0.0...22.0)
	///   - leftEyePositions: No Description
	///   - rightEyePositions: No Description
	///   - chinPositions: No Description
	///   - nosePositions: No Description
	///   - focusRect: No Description
	///   - lumaNoiseScale: No Description (0.0...0.1)
	///   - scaleFactor: No Description
	///   - calibrationData: No Description
	///   - auxDataMetadata: No Description
	///   - shape: No Description
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Applies a variable radius disc blur to an image where areas in the background are softened more than those in the foreground.
	///
	/// **Categories**: Blur, BuiltIn, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CIDepthBlurEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthBlurEffect)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDepthBlurEffect/)
	@inlinable func applyingDepthBlurEffect(
		disparityImage: CIImage,
		matteImage: CIImage,
		hairImage: CIImage,
		glassesImage: CIImage,
		gainMap: CIImage,
		aperture: Double = CIFF.DepthBlurEffect.apertureDefault,
		leftEyePositions: CGPoint = CIFF.DepthBlurEffect.leftEyePositionsDefault,
		rightEyePositions: CGPoint = CIFF.DepthBlurEffect.rightEyePositionsDefault,
		chinPositions: CGPoint = CIFF.DepthBlurEffect.chinPositionsDefault,
		nosePositions: CGPoint = CIFF.DepthBlurEffect.nosePositionsDefault,
		focusRect: CGRect,
		lumaNoiseScale: Double = CIFF.DepthBlurEffect.lumaNoiseScaleDefault,
		scaleFactor: Double = CIFF.DepthBlurEffect.scaleFactorDefault,
		calibrationData: AVCameraCalibrationData,
		auxDataMetadata: CGImageMetadata,
		shape: String,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.DepthBlurEffect(
			inputImage: self,
			disparityImage: disparityImage,
			matteImage: matteImage,
			hairImage: hairImage,
			glassesImage: glassesImage,
			gainMap: gainMap,
			aperture: aperture,
			leftEyePositions: leftEyePositions,
			rightEyePositions: rightEyePositions,
			chinPositions: chinPositions,
			nosePositions: nosePositions,
			focusRect: focusRect,
			lumaNoiseScale: lumaNoiseScale,
			scaleFactor: scaleFactor,
			calibrationData: calibrationData,
			auxDataMetadata: auxDataMetadata,
			shape: shape
		)?.outputImage ?? CIImage.empty()
	}
}
