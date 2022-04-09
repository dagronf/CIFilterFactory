//
//  CameraCalibrationLensCorrection.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.14, iOS 12, tvOS 12, *)
@objc public extension CIFF {
	///
	/// Lens Correction for AVC
	///
	/// Geometrically distorts an image by altering the magnification based on the radial distance from the optical center to the farthest radius.
	///
	/// **Availability**
	/// - macOS 10.14, iOS 12, tvOS 12
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryDistortionEffect
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Links**
	/// - [CICameraCalibrationLensCorrection Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICameraCalibrationLensCorrection)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicameracalibrationlenscorrection?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICameraCalibrationLensCorrection/)
	///
	@available(macOS 10.14, iOS 12, tvOS 12, *)
	@objc(CIFFCameraCalibrationLensCorrection) class CameraCalibrationLensCorrection: Core {
		/// Create an instance of the filter
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
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - aVCameraCalibrationData (inputAVCameraCalibrationData)

		/// AVCameraCalibrationData for the correction. Will be set from the inputImage if available and can be overridden here.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputAVCameraCalibrationData`
		/// - Internal class: `AVCameraCalibrationData`
		@objc public var aVCameraCalibrationData: AVCameraCalibrationData? {
			get {
				return self.keyedValue("inputAVCameraCalibrationData")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAVCameraCalibrationData")
			}
		}

		// MARK: - useInverseLookUpTable (inputUseInverseLookUpTable)

		/// Boolean value used to select the Look Up Table from the AVCameraCalibrationData
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputUseInverseLookUpTable`
		/// - Internal class: `NSNumber`
		@objc public var useInverseLookUpTable: NSNumber? {
			get {
				return self.keyedValue("inputUseInverseLookUpTable")
			}
			set {
				self.setKeyedValue(newValue, for: "inputUseInverseLookUpTable")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			inputImage: CIImage,
			aVCameraCalibrationData: AVCameraCalibrationData,
			useInverseLookUpTable: NSNumber
		) {
			self.init()
			self.inputImage = inputImage
			self.aVCameraCalibrationData = aVCameraCalibrationData
			self.useInverseLookUpTable = useInverseLookUpTable
		}
	}
}
