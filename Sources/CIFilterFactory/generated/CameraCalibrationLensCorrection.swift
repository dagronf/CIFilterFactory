//
//  CameraCalibrationLensCorrection.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Lens Correction for AVC
	///
	/// Geometrically distorts an image by altering the magnification based on the radial distance from the optical center to the farthest radius.
	///
	/// **CIFilter Name**
	/// - CICameraCalibrationLensCorrection
	///
	/// **Availability**
	/// - macOS 10.14, iOS 12, tvOS 12, macCatalyst 14
	///
	/// **Categories**
	/// - BuiltIn (*CICategoryBuiltIn*)
	/// - DistortionEffect (*CICategoryDistortionEffect*)
	/// - HighDynamicRange (*CICategoryHighDynamicRange*)
	/// - StillImage (*CICategoryStillImage*)
	/// - Video (*CICategoryVideo*)
	///
	/// **Documentation Links**
	/// - [CICameraCalibrationLensCorrection Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICameraCalibrationLensCorrection)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICameraCalibrationLensCorrection/)
	@available(macOS 10.14, iOS 12, tvOS 12, macCatalyst 14, *)
	@objc(CIFFCameraCalibrationLensCorrection) class CameraCalibrationLensCorrection: Core {
		/// Create an instance of the filter with all default values
		@objc public init?() {
			super.init(name: "CICameraCalibrationLensCorrection")
		}

		// MARK: - inputImage (inputImage)

		/// The image to process.
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

		// MARK: - aVCameraCalibrationData (inputAVCameraCalibrationData)

		/// AVCameraCalibrationData for the correction. Will be set from the input image if available and can be overridden here.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAVCameraCalibrationData`
		/// - Internal class: `AVCameraCalibrationData`
		@objc public var aVCameraCalibrationData: AVCameraCalibrationData? {
			get {
				self.keyedValue("inputAVCameraCalibrationData")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAVCameraCalibrationData")
			}
		}

		// MARK: - useInverseLookUpTable (inputUseInverseLookUpTable)

		/// Boolean value used to select the Look Up Table from the AVCameraCalibrationData.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputUseInverseLookUpTable`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default Value: `false`
		@objc public var useInverseLookUpTable: Bool {
			get {
				self.boolValue(forKey: "inputUseInverseLookUpTable", defaultValue: Self.useInverseLookUpTableDefault)
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputUseInverseLookUpTable")
			}
		}

		/// `useInverseLookUpTable` default value
		@objc public static let useInverseLookUpTableDefault: Bool = false

		// MARK: - Convenience creators

		/// Filter initializer
		/// - Parameters:
		///   - inputImage: The image to process.
		///   - aVCameraCalibrationData: AVCameraCalibrationData for the correction. Will be set from the input image if available and can be overridden here.
		///   - useInverseLookUpTable: Boolean value used to select the Look Up Table from the AVCameraCalibrationData.
		@objc public convenience init?(
			inputImage: CIImage? = nil,
			aVCameraCalibrationData: AVCameraCalibrationData,
			useInverseLookUpTable: Bool = CameraCalibrationLensCorrection.useInverseLookUpTableDefault
		) {
			self.init()
			if let inputImage = inputImage {
				self.inputImage = inputImage
			}
			self.aVCameraCalibrationData = aVCameraCalibrationData
			self.useInverseLookUpTable = useInverseLookUpTable
		}
	}
}

@available(macOS 10.14, iOS 12, tvOS 12, macCatalyst 14, *)
public extension CIImage {
	/// Apply the 'Lens Correction for AVC' filter to this image and return a new filtered image
	///
	/// - Parameters:
	///   - aVCameraCalibrationData: AVCameraCalibrationData for the correction. Will be set from the input image if available and can be overridden here.
	///   - useInverseLookUpTable: Boolean value used to select the Look Up Table from the AVCameraCalibrationData.
	///   - isActive: If true applies the filter and returns a new image, else returns this image
	/// - Returns: The filtered image, or this image if the filter is not active
	///
	/// Geometrically distorts an image by altering the magnification based on the radial distance from the optical center to the farthest radius.
	///
	/// **Categories**: BuiltIn, DistortionEffect, HighDynamicRange, StillImage, Video
	///
	/// **Documentation Links**
	/// - [CICameraCalibrationLensCorrection Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICameraCalibrationLensCorrection)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICameraCalibrationLensCorrection/)
	@inlinable func applyingCameraCalibrationLensCorrection(
		aVCameraCalibrationData: AVCameraCalibrationData,
		useInverseLookUpTable: Bool = CIFF.CameraCalibrationLensCorrection.useInverseLookUpTableDefault,
		isActive: Bool = true
	) -> CIImage {
		guard isActive else { return self }
		return CIFF.CameraCalibrationLensCorrection(
			inputImage: self,
			aVCameraCalibrationData: aVCameraCalibrationData,
			useInverseLookUpTable: useInverseLookUpTable
		)?.outputImage ?? CIImage.empty()
	}
}
