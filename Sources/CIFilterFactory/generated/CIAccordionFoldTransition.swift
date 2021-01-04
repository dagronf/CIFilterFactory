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

public extension CIFilter {
	@available(macOS 10.10, iOS 8, *)
	@inlinable @objc static func AccordionFoldTransition() -> CIFilterFactory.CIAccordionFoldTransition? {
		return CIFilterFactory.CIAccordionFoldTransition()
	}
}

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
	@objc(CIFilterFactory_CIAccordionFoldTransition) class CIAccordionFoldTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIAccordionFoldTransition")
		}

		// MARK: - Inputs

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
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
		/// The target image for a transition.
		///
		///   Class:    CIImage
		///   Type:     CIAttributeTypeImage
		@objc public dynamic var inputTargetImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputTargetImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTargetImage")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  0
		///   minValue: 0.0
		///
		public static let inputBottomHeight_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputBottomHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBottomHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIAccordionFoldTransition.inputBottomHeight_Range), forKey: "inputBottomHeight")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  3
		///   minValue: 1.0
		///   maxValue: 50.0
		///
		public static let inputNumberOfFolds_Range: ClosedRange<Float> = 1.0 ... 50.0
		@objc public dynamic var inputNumberOfFolds: NSNumber? {
			get {
				return self.filter.value(forKey: "inputNumberOfFolds") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIAccordionFoldTransition.inputNumberOfFolds_Range), forKey: "inputNumberOfFolds")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  0.1
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputFoldShadowAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputFoldShadowAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFoldShadowAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIAccordionFoldTransition.inputFoldShadowAmount_Range), forKey: "inputFoldShadowAmount")
			}
		}

		///
		/// The duration of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeTime
		///   Default:  0
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputTime_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputTime: NSNumber? {
			get {
				return self.filter.value(forKey: "inputTime") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIAccordionFoldTransition.inputTime_Range), forKey: "inputTime")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputTargetImage: CIImage,
			inputBottomHeight: NSNumber = 0,
			inputNumberOfFolds: NSNumber = 3,
			inputFoldShadowAmount: NSNumber = 0.1,
			inputTime: NSNumber = 0
		) {
			self.init()

			self.inputImage = inputImage
			self.inputTargetImage = inputTargetImage
			self.inputBottomHeight = inputBottomHeight
			self.inputNumberOfFolds = inputNumberOfFolds
			self.inputFoldShadowAmount = inputFoldShadowAmount
			self.inputTime = inputTime
		}
	}
}
