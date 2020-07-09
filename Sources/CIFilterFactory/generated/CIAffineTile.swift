//
//  CIAffineTile.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Affine Tile
	///
	/// Applies an affine transformation to an image and then tiles the transformed image.
	///
	/// **Links**
	///
	/// [CIAffineTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAffineTile/)
	///
	@objc(CIFilterFactory_CIAffineTile) class CIAffineTile: Core {
		@objc public init?() {
			super.init(name: "CIAffineTile")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputTransform

		///
		/// The transform to apply to the image.
		///
		@objc public var inputTransform: CIFilterFactory.AffineTransform? {
			get {
				#if os(macOS)
					if let value = filter.value(forKey: "inputTransform") as? NSAffineTransform {
						return AffineTransform(value)
					}
					return nil
				#else
					if let value = filter.value(forKey: "inputTransform") as? NSValue {
						return AffineTransform(value.cgAffineTransformValue)
					}
					return nil
				#endif
			}
			set {
				#if os(macOS)
					filter.setValue(newValue?.transform, forKey: "inputTransform")
				#else
					if let value = newValue?.transform {
						let val = NSValue(cgAffineTransform: value)
						filter.setValue(val, forKey: "inputTransform")
					} else {
						filter.setValue(nil, forKey: "inputTransform")
					}
				#endif
			}
		}
	}
}
