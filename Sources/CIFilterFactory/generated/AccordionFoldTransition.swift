//
//  AccordionFoldTransition.swift  (AUTOMATICALLY GENERATED FILE)
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

import AVFoundation
import CoreImage
import CoreML
import Foundation

@available(macOS 10.10, iOS 8, tvOS 8, *)
@objc public extension CIFF {
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
	@available(macOS 10.10, iOS 8, tvOS 8, *)
	@objc(CIFFAccordionFoldTransition) class AccordionFoldTransition: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIAccordionFoldTransition")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - targetImage (inputTargetImage)

		/// The target image for a transition.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTargetImage`
		/// - Internal class: `CIImage`
		/// - Type: `CIAttributeTypeImage`
		@objc public var targetImage: CIImage? {
			get {
				return self.keyedValue("inputTargetImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputTargetImage")
			}
		}

		// MARK: - bottomHeight (inputBottomHeight)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBottomHeight`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		@objc public var bottomHeight: Double {
			get {
				let number = self.filter.value(forKey: "inputBottomHeight") as? NSNumber
				return number?.doubleValue ?? 0
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: AccordionFoldTransition.bottomHeightRange)
				self.filter.setValue(number, forKey: "inputBottomHeight")
			}
		}

		/// `bottomHeight` range definition
		public static let bottomHeightRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - numberOfFolds (inputNumberOfFolds)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputNumberOfFolds`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `3`
		/// - Minimum value: `1.0`
		/// - Maximum value: `50.0`
		@objc public var numberOfFolds: Double {
			get {
				let number = self.filter.value(forKey: "inputNumberOfFolds") as? NSNumber
				return number?.doubleValue ?? 3
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: AccordionFoldTransition.numberOfFoldsRange)
				self.filter.setValue(number, forKey: "inputNumberOfFolds")
			}
		}

		/// `numberOfFolds` range definition
		public static let numberOfFoldsRange: ClosedRange<Double> = 1.0 ... 50.0

		// MARK: - foldShadowAmount (inputFoldShadowAmount)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFoldShadowAmount`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `0.1`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var foldShadowAmount: Double {
			get {
				let number = self.filter.value(forKey: "inputFoldShadowAmount") as? NSNumber
				return number?.doubleValue ?? 0.1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: AccordionFoldTransition.foldShadowAmountRange)
				self.filter.setValue(number, forKey: "inputFoldShadowAmount")
			}
		}

		/// `foldShadowAmount` range definition
		public static let foldShadowAmountRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - time (inputTime)

		/// The duration of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputTime`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeTime`
		/// - Default value: `0`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var time: Double {
			get {
				let number = self.filter.value(forKey: "inputTime") as? NSNumber
				return number?.doubleValue ?? 0
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: AccordionFoldTransition.timeRange)
				self.filter.setValue(number, forKey: "inputTime")
			}
		}

		/// `time` range definition
		public static let timeRange: ClosedRange<Double> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			targetImage: CIImage,
			bottomHeight: Double = 0,
			numberOfFolds: Double = 3,
			foldShadowAmount: Double = 0.1,
			time: Double = 0
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
