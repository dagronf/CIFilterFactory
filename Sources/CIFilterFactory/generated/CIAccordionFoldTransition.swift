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

@available(macOS 10.10, iOS 8, tvOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Accordion Fold Transition
	///
	/// Transitions from one image to another of a differing dimensions by unfolding.
	///
	/// **Links**
	///
	/// - [CIAccordionFoldTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAccordionFoldTransition)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciaccordionfoldtransition?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIAccordionFoldTransition/)
	///
	@objc(CIFilterFactory_AccordionFoldTransition) class AccordionFoldTransition: FilterCore {
		@objc public init?() {
			super.init(name: "CIAccordionFoldTransition")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   - Attribute key: `inputImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - targetImage (inputTargetImage)

		///
		/// The target image for a transition.
		///
		///   - Attribute key: `inputTargetImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var targetImage: CIImage? {
			get {
				return self.keyedValue("inputTargetImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputTargetImage")
			}
		}

		// MARK: - bottomHeight (inputBottomHeight)

		///
		/// No Description
		///
		///   - Attribute key: `inputBottomHeight`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `0`
		///   minValue: 0.0
		///
		public static let bottomHeight_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var bottomHeight: NSNumber? {
			get {
				return self.keyedValue("inputBottomHeight")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: AccordionFoldTransition.bottomHeight_Range), forKey: "inputBottomHeight")
			}
		}

		// MARK: - numberOfFolds (inputNumberOfFolds)

		///
		/// No Description
		///
		///   - Attribute key: `inputNumberOfFolds`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `3`
		///   minValue: 1.0
		///   maxValue: 50.0
		///
		public static let numberOfFolds_Range: ClosedRange<Float> = 1.0 ... 50.0
		@objc public var numberOfFolds: NSNumber? {
			get {
				return self.keyedValue("inputNumberOfFolds")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: AccordionFoldTransition.numberOfFolds_Range), forKey: "inputNumberOfFolds")
			}
		}

		// MARK: - foldShadowAmount (inputFoldShadowAmount)

		///
		/// No Description
		///
		///   - Attribute key: `inputFoldShadowAmount`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `0.1`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let foldShadowAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var foldShadowAmount: NSNumber? {
			get {
				return self.keyedValue("inputFoldShadowAmount")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: AccordionFoldTransition.foldShadowAmount_Range), forKey: "inputFoldShadowAmount")
			}
		}

		// MARK: - time (inputTime)

		///
		/// The duration of the effect.
		///
		///   - Attribute key: `inputTime`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeTime`
		///   - Default value: `0`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let time_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var time: NSNumber? {
			get {
				return self.keyedValue("inputTime")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: AccordionFoldTransition.time_Range), forKey: "inputTime")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			bottomHeight: NSNumber = 0,
			numberOfFolds: NSNumber = 3,
			foldShadowAmount: NSNumber = 0.1,
			time: NSNumber = 0
		) {
			self.init()

			self.image = image
			self.targetImage = targetImage
			self.bottomHeight = bottomHeight
			self.numberOfFolds = numberOfFolds
			self.foldShadowAmount = foldShadowAmount
			self.time = time
		}
	}
}
