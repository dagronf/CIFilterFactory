//
//  CICameraCalibrationLensCorrection.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.14, iOS 12, *)
	@inlinable @objc static func CameraCalibrationLensCorrection() -> CIFilterFactory.CICameraCalibrationLensCorrection? {
		return CIFilterFactory.CICameraCalibrationLensCorrection()
	}
}

@available(macOS 10.14, iOS 12, *)
@objc public extension CIFilterFactory {
	///
	/// Lens Correction for AVC
	///
	/// Geometrically distorts an image by altering the magnification based on the radial distance from the optical center to the farthest radius.
	///
	/// **Links**
	///
	/// [CICameraCalibrationLensCorrection Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICameraCalibrationLensCorrection)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICameraCalibrationLensCorrection/)
	///
	@objc(CIFilterFactory_CICameraCalibrationLensCorrection) class CICameraCalibrationLensCorrection: FilterCore {
		@objc public init?() {
			super.init(name: "CICameraCalibrationLensCorrection")
		}

		// MARK: - Inputs

		///
		/// The image to process.
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
		/// AVCameraCalibrationData for the correction. Will be set from the inputImage if available and can be overridden here.
		///
		///   Class:    AVCameraCalibrationData
		@objc public dynamic var inputAVCameraCalibrationData: AVCameraCalibrationData? {
			get {
				return self.filter.value(forKey: "inputAVCameraCalibrationData") as? AVCameraCalibrationData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAVCameraCalibrationData")
			}
		}

		///
		/// Boolean value used to select the Look Up Table from the AVCameraCalibrationData
		///
		///   Class:    NSNumber
		///   Default:  0
		@objc public dynamic var inputUseInverseLookUpTable: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUseInverseLookUpTable") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputUseInverseLookUpTable")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputAVCameraCalibrationData: AVCameraCalibrationData,
			inputUseInverseLookUpTable: NSNumber = 0
		) {
			self.init()

			self.inputImage = inputImage
			self.inputAVCameraCalibrationData = inputAVCameraCalibrationData
			self.inputUseInverseLookUpTable = inputUseInverseLookUpTable
		}
	}
}
