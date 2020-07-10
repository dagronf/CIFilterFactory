//
//  CIPerspectiveTransformWithExtent.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Perspective Transform with Extent
	///
	/// Alters the geometry of an image to simulate the observer changing viewing position. You can use the perspective filter to skew an image.
	///
	/// **Links**
	///
	/// [CIPerspectiveTransformWithExtent Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTransformWithExtent)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPerspectiveTransformWithExtent/)
	///
	@objc(CIFilterFactory_CIPerspectiveTransformWithExtent) class CIPerspectiveTransformWithExtent: FilterCommon {
		@objc public init?() {
			super.init(name: "CIPerspectiveTransformWithExtent")
			self.filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputExtent

		///
		/// A rectangle that defines the extent of the effect.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}

		// MARK: - inputTopLeft

		///
		/// No Description
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
		/// No Description
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
		/// No Description
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
		/// No Description
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
