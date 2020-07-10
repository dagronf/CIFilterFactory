//
//  CIKeystoneCorrectionVertical.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Vertical Keystone Correction
	///
	/// Apply vertical keystone correction to an image with guides
	///
	/// **Links**
	///
	/// [CIKeystoneCorrectionVertical Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKeystoneCorrectionVertical)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIKeystoneCorrectionVertical/)
	///
	@objc(CIFilterFactory_CIKeystoneCorrectionVertical) class CIKeystoneCorrectionVertical: FilterCommon {
		@objc public init?() {
			super.init(name: "CIKeystoneCorrectionVertical")
			self.filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to process.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputFocalLength

		///
		/// 35mm equivalent focal length of the input image.
		///
		@objc public var inputFocalLength: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFocalLength") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputFocalLength")
			}
		}

		// MARK: - inputTopLeft

		///
		/// The top left coordinate of the guide.
		///
		@objc public var inputTopLeft: CIVector? {
			get {
				return self.filter.value(forKey: "inputTopLeft") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTopLeft")
			}
		}

		// MARK: - inputTopRight

		///
		/// The top right coordinate of the guide.
		///
		@objc public var inputTopRight: CIVector? {
			get {
				return self.filter.value(forKey: "inputTopRight") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTopRight")
			}
		}

		// MARK: - inputBottomRight

		///
		/// The bottom right coordinate of the guide.
		///
		@objc public var inputBottomRight: CIVector? {
			get {
				return self.filter.value(forKey: "inputBottomRight") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBottomRight")
			}
		}

		// MARK: - inputBottomLeft

		///
		/// The bottom left coordinate of the guide.
		///
		@objc public var inputBottomLeft: CIVector? {
			get {
				return self.filter.value(forKey: "inputBottomLeft") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBottomLeft")
			}
		}
	}
}
