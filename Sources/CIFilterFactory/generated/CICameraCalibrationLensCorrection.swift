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

#if !os(macOS)
	// For access to NSValue.cgAffineTransformValue
	import UIKit
#endif

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
	@objc(CIFilterFactory_CICameraCalibrationLensCorrection) class CICameraCalibrationLensCorrection: Core {
		@objc public init?() {
			super.init(name: "CICameraCalibrationLensCorrection")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to process.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputAVCameraCalibrationData

		///
		/// AVCameraCalibrationData for the correction. Will be set from the inputImage if available and can be overridden here.
		///
		@objc public var inputAVCameraCalibrationData: AVCameraCalibrationData? {
			get {
				return filter.value(forKey: "inputAVCameraCalibrationData") as? AVCameraCalibrationData
			}
			set {
				filter.setValue(newValue, forKey: "inputAVCameraCalibrationData")
			}
		}

		// MARK: - inputUseInverseLookUpTable

		///
		/// Boolean value used to select the Look Up Table from the AVCameraCalibrationData
		///
		@objc public var inputUseInverseLookUpTable: NSNumber? {
			get {
				return filter.value(forKey: "inputUseInverseLookUpTable") as? NSNumber
			}
			set {
				filter.setValue(newValue, forKey: "inputUseInverseLookUpTable")
			}
		}
	}
}