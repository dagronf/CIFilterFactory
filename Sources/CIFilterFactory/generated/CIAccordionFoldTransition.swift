//
//  CIAccordionFoldTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Accordion Fold Transition
	///
	/// Transitions from one image to another of a differing dimensions by unfolding.
	///
	/// **Links**
	///
	/// [CIAccordionFoldTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAccordionFoldTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAccordionFoldTransition/)
	///
	@objc(CIFilterFactory_CIAccordionFoldTransition) class CIAccordionFoldTransition: FilterCommon {
		@objc public init?() {
			super.init(name: "CIAccordionFoldTransition")
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

		// MARK: - inputTargetImage

		///
		/// The target image for a transition.
		///
		@objc public var inputTargetImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputTargetImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTargetImage")
			}
		}

		// MARK: - inputBottomHeight

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputBottomHeight_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputBottomHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBottomHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputBottomHeight_Range), forKey: "inputBottomHeight")
			}
		}

		// MARK: - inputNumberOfFolds

		///
		/// No Description
		///
		///   minValue: 1.0
		///   maxValue: 50.0
		///
		let inputNumberOfFolds_Range: ClosedRange<Float> = 1.0 ... 50.0
		@objc public var inputNumberOfFolds: NSNumber? {
			get {
				return self.filter.value(forKey: "inputNumberOfFolds") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputNumberOfFolds_Range), forKey: "inputNumberOfFolds")
			}
		}

		// MARK: - inputFoldShadowAmount

		///
		/// No Description
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputFoldShadowAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputFoldShadowAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFoldShadowAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputFoldShadowAmount_Range), forKey: "inputFoldShadowAmount")
			}
		}

		// MARK: - inputTime

		///
		/// The duration of the effect.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputTime_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputTime: NSNumber? {
			get {
				return self.filter.value(forKey: "inputTime") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: self.inputTime_Range), forKey: "inputTime")
			}
		}
	}
}
