//
//  CIDroste.swift  (AUTOMATICALLY GENERATED FILE)
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
	import UIKit // For access to NSValue.cgAffineTransformValue
#endif

@available(macOS 10.6, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Droste
	///
	/// Performs M.C. Escher Droste style deformation
	///
	/// **Links**
	///
	/// [CIDroste Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDroste)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDroste/)
	///
	@objc(CIFilterFactory_CIDroste) class CIDroste: Core {
		@objc public init?() {
			super.init(name: "CIDroste")
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

		// MARK: - inputInsetPoint0

		///
		/// No Description
		///
		@objc public var inputInsetPoint0: CIVector? {
			get {
				return filter.value(forKey: "inputInsetPoint0") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputInsetPoint0")
			}
		}

		// MARK: - inputInsetPoint1

		///
		/// No Description
		///
		@objc public var inputInsetPoint1: CIVector? {
			get {
				return filter.value(forKey: "inputInsetPoint1") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputInsetPoint1")
			}
		}

		// MARK: - inputStrands

		///
		/// No Description
		///
		///   minValue: -10.0
		///   maxValue: 10.0
		///
		let inputStrands_Range: ClosedRange<Float> = -10.0 ... 10.0
		@objc public var inputStrands: NSNumber? {
			get {
				return filter.value(forKey: "inputStrands") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputStrands_Range), forKey: "inputStrands")
			}
		}

		// MARK: - inputPeriodicity

		///
		/// No Description
		///
		///   minValue: 1.0
		///
		let inputPeriodicity_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputPeriodicity: NSNumber? {
			get {
				return filter.value(forKey: "inputPeriodicity") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputPeriodicity_Range), forKey: "inputPeriodicity")
			}
		}

		// MARK: - inputRotation

		///
		/// No Description
		///
		@objc public var inputRotation: NSNumber? {
			get {
				return filter.value(forKey: "inputRotation") as? NSNumber
			}
			set {
				filter.setValue(newValue, forKey: "inputRotation")
			}
		}

		// MARK: - inputZoom

		///
		/// No Description
		///
		@objc public var inputZoom: NSNumber? {
			get {
				return filter.value(forKey: "inputZoom") as? NSNumber
			}
			set {
				filter.setValue(newValue, forKey: "inputZoom")
			}
		}
	}
}
