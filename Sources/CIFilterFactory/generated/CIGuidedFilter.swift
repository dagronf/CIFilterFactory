//
//  CIGuidedFilter.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Guided Filter
	///
	/// Upsamples a small image to the size of the guide image using the content of the guide to preserve detail.
	///
	/// **Links**
	///
	/// [CIGuidedFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGuidedFilter)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIGuidedFilter/)
	///
	@objc(CIFilterFactory_CIGuidedFilter) class CIGuidedFilter: Core {
		@objc public init?() {
			super.init(name: "CIGuidedFilter")
			filter.setDefaults()
		}

		// MARK: - inputImage

		///
		/// A small image to upsample.
		///
		@objc public var inputImage: CIImage? {
			get {
				return filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputImage")
			}
		}

		// MARK: - inputGuideImage

		///
		/// A larger image to use as a guide.
		///
		@objc public var inputGuideImage: CIImage? {
			get {
				return filter.value(forKey: "inputGuideImage") as? CIImage
			}
			set {
				filter.setValue(newValue, forKey: "inputGuideImage")
			}
		}

		// MARK: - inputRadius

		///
		/// The distance from the center of the effect.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				filter.setValue(newValue, forKey: "inputRadius")
			}
		}

		// MARK: - inputEpsilon

		///
		/// No Description
		///
		@objc public var inputEpsilon: NSNumber? {
			get {
				return filter.value(forKey: "inputEpsilon") as? NSNumber
			}
			set {
				filter.setValue(newValue, forKey: "inputEpsilon")
			}
		}
	}
}