//
// CIFilterFactory.swift
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
//  Automatically generated on 2020-07-09 00:05:47 +0000.  Do not edit.

import AVFoundation
import CoreImage
import CoreML
import Foundation

#if !os(macOS)
	import UIKit // For access to NSValue.cgAffineTransformValue
#endif

@objc public class AffineTransform: NSObject {
	#if os(macOS)
		@objc var transform: NSAffineTransform
		@objc public init(_ transform: NSAffineTransform) {
			self.transform = transform
			super.init()
		}

	#else
		@objc var transform: CGAffineTransform
		@objc public init(_ transform: CGAffineTransform) {
			self.transform = transform
			super.init()
		}
	#endif
}

@objc public class CIFilterFactory: NSObject {
	@objc(CIFilterCore) public class Core: NSObject {
		let filter: CIFilter
		fileprivate init?(name: String) {
			guard let filter = CIFilter(name: name) else {
				return nil
			}
			self.filter = filter
			super.init()
		}

		fileprivate init?(with filter: CIFilter, expectedName: String) {
			if filter.name != expectedName {
				return nil
			}
			self.filter = filter
			super.init()
		}

		/// Returns a CIImage object that encapsulates the operations configured in the filter.
		@objc public dynamic var outputImage: CIImage? {
			return self.filter.outputImage
		}

		/// The name of the filter
		@objc public lazy var name: String = {
			self.filter.name
		}()

		/// The localized version of the filter name that is displayed in the user interface
		@objc public lazy var displayName: String = {
			self.filter.attributes[kCIAttributeFilterDisplayName] as? String ?? self.name
		}()

		/// Returns the localized name for the specified filter.
		@available(macOS 10.10, iOS 9, *)
		@objc public lazy var localizedName: String = {
			CIFilter.localizedName(forFilterName: self.name) ?? self.name
		}()

		/// Returns the localized description of a filter for display in the user interface.
		@available(macOS 10.10, iOS 9, *)
		@objc public lazy var localizedDescription: String? = {
			CIFilter.localizedDescription(forFilterName: self.name)
		}()

		/// Returns a dictionary containing key/value pairs describing the filter
		@objc public var attributes: [String: Any] {
			return self.filter.attributes
		}

		/// Returns the URL for the `CIFilter.io` webpage describing the filter
		@objc public lazy var cifilterOnlineDocumentationURL: URL? = {
			URL(string: "https://cifilter.io/\(self.name)/")
		}()

		/// The localized reference documentation for the filter. The reference should provide developers with technical details.
		@available(macOS 10.10, iOS 9, *)
		@objc public var onlineDocumentationURL: URL? {
			return filter.attributes[kCIAttributeReferenceDocumentation] as? URL
		}
	}
}

private extension NSNumber {
	func clamped(bounds: PartialRangeFrom<Float>) -> NSNumber {
		if bounds.lowerBound > self.floatValue {
			return NSNumber(value: bounds.lowerBound)
		}
		return self
	}

	func clamped(bounds: PartialRangeThrough<Float>) -> NSNumber {
		if bounds.upperBound < self.floatValue {
			return NSNumber(value: bounds.upperBound)
		}
		return self
	}

	func clamped(bounds: ClosedRange<Float>) -> NSNumber {
		var value = max(bounds.lowerBound, self.floatValue)
		value = min(bounds.upperBound, value)
		return NSNumber(value: value)
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
	@objc(CIFilterFactory_CIAccordionFoldTransition) class CIAccordionFoldTransition: Core {
		@objc public init?() {
			super.init(name: "CIAccordionFoldTransition")
			self.filter.setDefaults()
		}

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
				self.filter.setValue(newValue?.clamped(bounds: inputBottomHeight_Range), forKey: "inputBottomHeight")
			}
		}

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
				self.filter.setValue(newValue?.clamped(bounds: inputNumberOfFolds_Range), forKey: "inputNumberOfFolds")
			}
		}

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
				self.filter.setValue(newValue?.clamped(bounds: inputFoldShadowAmount_Range), forKey: "inputFoldShadowAmount")
			}
		}

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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Addition
	///
	/// Adds color components to achieve a brightening effect. This filter is typically used to add highlights and lens flare effects.
	///
	/// **Links**
	///
	/// [CIAdditionCompositing Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAdditionCompositing)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAdditionCompositing/)
	///
	@objc(CIFilterFactory_CIAdditionCompositing) class CIAdditionCompositing: Core {
		@objc public init?() {
			super.init(name: "CIAdditionCompositing")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Affine Clamp
	///
	/// Performs an affine transformation on a source image and then clamps the pixels at the edge of the transformed image, extending them outwards. This filter performs similarly to the “Affine Transform” filter except that it produces an image with infinite extent. You can use this filter when you need to blur an image but you want to avoid a soft, black fringe along the edges.
	///
	/// **Links**
	///
	/// [CIAffineClamp Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineClamp)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAffineClamp/)
	///
	@objc(CIFilterFactory_CIAffineClamp) class CIAffineClamp: Core {
		@objc public init?() {
			super.init(name: "CIAffineClamp")
			self.filter.setDefaults()
		}

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

		///
		/// The transform to apply to the image.
		///
		@objc public var inputTransform: AffineTransform? {
			get {
				#if os(macOS)
					if let value = self.filter.value(forKey: "inputTransform") as? NSAffineTransform {
						return AffineTransform(value)
					}
					return nil
				#else
					if let value = self.filter.value(forKey: "inputTransform") as? NSValue {
						return AffineTransform(value.cgAffineTransformValue)
					}
					return nil
				#endif
			}
			set {
				#if os(macOS)
					self.filter.setValue(newValue?.transform, forKey: "inputTransform")
				#else
					if let value = newValue?.transform {
						let val = NSValue(cgAffineTransform: value)
						self.filter.setValue(val, forKey: "inputTransform")
					} else {
						self.filter.setValue(nil, forKey: "inputTransform")
					}
				#endif
			}
		}
	}
}

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
			self.filter.setDefaults()
		}

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

		///
		/// The transform to apply to the image.
		///
		@objc public var inputTransform: AffineTransform? {
			get {
				#if os(macOS)
					if let value = self.filter.value(forKey: "inputTransform") as? NSAffineTransform {
						return AffineTransform(value)
					}
					return nil
				#else
					if let value = self.filter.value(forKey: "inputTransform") as? NSValue {
						return AffineTransform(value.cgAffineTransformValue)
					}
					return nil
				#endif
			}
			set {
				#if os(macOS)
					self.filter.setValue(newValue?.transform, forKey: "inputTransform")
				#else
					if let value = newValue?.transform {
						let val = NSValue(cgAffineTransform: value)
						self.filter.setValue(val, forKey: "inputTransform")
					} else {
						self.filter.setValue(nil, forKey: "inputTransform")
					}
				#endif
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Affine Transform
	///
	/// Applies an affine transformation to an image. You can scale, translate, or rotate the input image. You can also apply a combination of these operations.
	///
	/// **Links**
	///
	/// [CIAffineTransform Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineTransform)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAffineTransform/)
	///
	@objc(CIFilterFactory_CIAffineTransform) class CIAffineTransform: Core {
		@objc public init?() {
			super.init(name: "CIAffineTransform")
			self.filter.setDefaults()
		}

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

		///
		/// A transform to apply to the image.
		///
		@objc public var inputTransform: AffineTransform? {
			get {
				#if os(macOS)
					if let value = self.filter.value(forKey: "inputTransform") as? NSAffineTransform {
						return AffineTransform(value)
					}
					return nil
				#else
					if let value = self.filter.value(forKey: "inputTransform") as? NSValue {
						return AffineTransform(value.cgAffineTransformValue)
					}
					return nil
				#endif
			}
			set {
				#if os(macOS)
					self.filter.setValue(newValue?.transform, forKey: "inputTransform")
				#else
					if let value = newValue?.transform {
						let val = NSValue(cgAffineTransform: value)
						self.filter.setValue(val, forKey: "inputTransform")
					} else {
						self.filter.setValue(nil, forKey: "inputTransform")
					}
				#endif
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Area Average
	///
	/// Calculates the average color for the specified area in an image, returning the result in a pixel.
	///
	/// **Links**
	///
	/// [CIAreaAverage Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaAverage)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAreaAverage/)
	///
	@objc(CIFilterFactory_CIAreaAverage) class CIAreaAverage: Core {
		@objc public init?() {
			super.init(name: "CIAreaAverage")
			self.filter.setDefaults()
		}

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

		///
		/// A rectangle that specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}
	}
}

@available(macOS 10.5, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Area Histogram
	///
	/// Calculates histograms of the R, G, B, and A channels of the specified area of an image. The output image is a one pixel tall image containing the histogram data for all four channels.
	///
	/// **Links**
	///
	/// [CIAreaHistogram Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaHistogram)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAreaHistogram/)
	///
	@objc(CIFilterFactory_CIAreaHistogram) class CIAreaHistogram: Core {
		@objc public init?() {
			super.init(name: "CIAreaHistogram")
			self.filter.setDefaults()
		}

		///
		/// The image whose histogram you want to calculate.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// A rectangle that, after intersection with the image extent, specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}

		///
		/// The scale value to use for the histogram values. If the scale is 1.0, then the bins in the resulting image will add up to 1.0.
		///
		///   minValue: 0.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}

		///
		/// The number of bins for the histogram. This value will determine the width of the output image.
		///
		///   minValue: 1.0
		///   maxValue: 2048.0
		///
		let inputCount_Range: ClosedRange<Float> = 1.0 ... 2048.0
		@objc public var inputCount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCount_Range), forKey: "inputCount")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Area Maximum
	///
	/// Calculates the maximum component values for the specified area in an image, returning the result in a pixel.
	///
	/// **Links**
	///
	/// [CIAreaMaximum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMaximum)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAreaMaximum/)
	///
	@objc(CIFilterFactory_CIAreaMaximum) class CIAreaMaximum: Core {
		@objc public init?() {
			super.init(name: "CIAreaMaximum")
			self.filter.setDefaults()
		}

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

		///
		/// A rectangle that specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Area Maximum Alpha
	///
	/// Finds and returns the pixel with the maximum alpha value.
	///
	/// **Links**
	///
	/// [CIAreaMaximumAlpha Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMaximumAlpha)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAreaMaximumAlpha/)
	///
	@objc(CIFilterFactory_CIAreaMaximumAlpha) class CIAreaMaximumAlpha: Core {
		@objc public init?() {
			super.init(name: "CIAreaMaximumAlpha")
			self.filter.setDefaults()
		}

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

		///
		/// A rectangle that specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Area Minimum
	///
	/// Calculates the minimum component values for the specified area in an image, returning the result in a pixel.
	///
	/// **Links**
	///
	/// [CIAreaMinimum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinimum)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAreaMinimum/)
	///
	@objc(CIFilterFactory_CIAreaMinimum) class CIAreaMinimum: Core {
		@objc public init?() {
			super.init(name: "CIAreaMinimum")
			self.filter.setDefaults()
		}

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

		///
		/// A rectangle that specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Area Minimum Alpha
	///
	/// Finds and returns the pixel with the minimum alpha value.
	///
	/// **Links**
	///
	/// [CIAreaMinimumAlpha Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinimumAlpha)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAreaMinimumAlpha/)
	///
	@objc(CIFilterFactory_CIAreaMinimumAlpha) class CIAreaMinimumAlpha: Core {
		@objc public init?() {
			super.init(name: "CIAreaMinimumAlpha")
			self.filter.setDefaults()
		}

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

		///
		/// A rectangle that specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}
	}
}

@available(macOS 10.14, iOS 12, *)
@objc public extension CIFilterFactory {
	///
	/// Area Min and Max
	///
	/// Calculates the per-component minimum and maximum value for the specified area in an image. The result is returned in a 2x1 image where the component minimum values are stored in the pixel on the left.
	///
	/// **Links**
	///
	/// [CIAreaMinMax Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinMax)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAreaMinMax/)
	///
	@objc(CIFilterFactory_CIAreaMinMax) class CIAreaMinMax: Core {
		@objc public init?() {
			super.init(name: "CIAreaMinMax")
			self.filter.setDefaults()
		}

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

		///
		/// A rectangle that specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Area Min and Max Red
	///
	/// Calculates the minimum and maximum red component value for the specified area in an image. The result is returned in the red and green channels of a one pixel image.
	///
	/// **Links**
	///
	/// [CIAreaMinMaxRed Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinMaxRed)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAreaMinMaxRed/)
	///
	@objc(CIFilterFactory_CIAreaMinMaxRed) class CIAreaMinMaxRed: Core {
		@objc public init?() {
			super.init(name: "CIAreaMinMaxRed")
			self.filter.setDefaults()
		}

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

		///
		/// A rectangle that specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Attributed Text Image Generator
	///
	/// Generate an image attributed string.
	///
	/// **Links**
	///
	/// [CIAttributedTextImageGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAttributedTextImageGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAttributedTextImageGenerator/)
	///
	@objc(CIFilterFactory_CIAttributedTextImageGenerator) class CIAttributedTextImageGenerator: Core {
		@objc public init?() {
			super.init(name: "CIAttributedTextImageGenerator")
			self.filter.setDefaults()
		}

		///
		/// No Description
		///
		@objc public var inputText: NSAttributedString? {
			get {
				return self.filter.value(forKey: "inputText") as? NSAttributedString
			}
			set {
				self.filter.setValue(newValue, forKey: "inputText")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputScaleFactor_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScaleFactor: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScaleFactor") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScaleFactor_Range), forKey: "inputScaleFactor")
			}
		}
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Aztec Code Generator
	///
	/// Generate an Aztec barcode image for message data.
	///
	/// **Links**
	///
	/// [CIAztecCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAztecCodeGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIAztecCodeGenerator/)
	///
	@objc(CIFilterFactory_CIAztecCodeGenerator) class CIAztecCodeGenerator: Core {
		@objc public init?() {
			super.init(name: "CIAztecCodeGenerator")
			self.filter.setDefaults()
		}

		///
		/// The message to encode in the Aztec Barcode
		///
		@objc public var inputMessage: NSData? {
			get {
				return self.filter.value(forKey: "inputMessage") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMessage")
			}
		}

		///
		/// Aztec error correction value between 5 and 95
		///
		///   minValue: 5.0
		///   maxValue: 95.0
		///
		let inputCorrectionLevel_Range: ClosedRange<Float> = 5.0 ... 95.0
		@objc public var inputCorrectionLevel: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCorrectionLevel") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCorrectionLevel_Range), forKey: "inputCorrectionLevel")
			}
		}

		///
		/// Aztec layers value between 1 and 32. Set to nil for automatic.
		///
		///   minValue: 1.0
		///   maxValue: 32.0
		///
		let inputLayers_Range: ClosedRange<Float> = 1.0 ... 32.0
		@objc public var inputLayers: NSNumber? {
			get {
				return self.filter.value(forKey: "inputLayers") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputLayers_Range), forKey: "inputLayers")
			}
		}

		///
		/// Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputCompactStyle_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputCompactStyle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCompactStyle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCompactStyle_Range), forKey: "inputCompactStyle")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Barcode Generator
	///
	/// Generate a barcode image from a CIBarcodeDescriptor.
	///
	/// **Links**
	///
	/// [CIBarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBarcodeGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBarcodeGenerator/)
	///
	@objc(CIFilterFactory_CIBarcodeGenerator) class CIBarcodeGenerator: Core {
		@objc public init?() {
			super.init(name: "CIBarcodeGenerator")
			self.filter.setDefaults()
		}

		///
		/// The CIBarcodeDescription object to generate an image for.
		///
		@objc public var inputBarcodeDescriptor: CIBarcodeDescriptor? {
			get {
				return self.filter.value(forKey: "inputBarcodeDescriptor") as? CIBarcodeDescriptor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBarcodeDescriptor")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Bars Swipe Transition
	///
	/// Transitions from one image to another by swiping rectangular portions of the foreground image to disclose the target image.
	///
	/// **Links**
	///
	/// [CIBarsSwipeTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBarsSwipeTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBarsSwipeTransition/)
	///
	@objc(CIFilterFactory_CIBarsSwipeTransition) class CIBarsSwipeTransition: Core {
		@objc public init?() {
			super.init(name: "CIBarsSwipeTransition")
			self.filter.setDefaults()
		}

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

		///
		/// The angle (in radians) of the bars.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of each bar.
		///
		///   minValue: 2.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(2.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The offset of one bar with respect to another
		///
		///   minValue: 1.0
		///
		let inputBarOffset_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputBarOffset: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBarOffset") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputBarOffset_Range), forKey: "inputBarOffset")
			}
		}

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Bicubic Scale Transform
	///
	/// Produces a high-quality, scaled version of a source image. The parameters of B and C for this filter determine the sharpness or softness of the resampling. The most commonly used B and C values are 0.0 and 0.75, respectively.
	///
	/// **Links**
	///
	/// [CIBicubicScaleTransform Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBicubicScaleTransform)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBicubicScaleTransform/)
	///
	@objc(CIFilterFactory_CIBicubicScaleTransform) class CIBicubicScaleTransform: Core {
		@objc public init?() {
			super.init(name: "CIBicubicScaleTransform")
			self.filter.setDefaults()
		}

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

		///
		/// The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image.
		///
		///   minValue: 0.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}

		///
		/// The additional horizontal scaling factor to use on the image.
		///
		///   minValue: 0.0
		///
		let inputAspectRatio_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputAspectRatio: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAspectRatio") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputAspectRatio_Range), forKey: "inputAspectRatio")
			}
		}

		///
		/// Specifies the value of B to use for the cubic resampling function.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputB_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputB: NSNumber? {
			get {
				return self.filter.value(forKey: "inputB") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputB_Range), forKey: "inputB")
			}
		}

		///
		/// Specifies the value of C to use for the cubic resampling function.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputC_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputC: NSNumber? {
			get {
				return self.filter.value(forKey: "inputC") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputC_Range), forKey: "inputC")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Blend With Alpha Mask
	///
	/// Uses values from a grayscale mask to interpolate between an image and the background. When a mask alpha value is 0.0, the result is the background. When the mask alpha value is 1.0, the result is the image.
	///
	/// **Links**
	///
	/// [CIBlendWithAlphaMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithAlphaMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBlendWithAlphaMask/)
	///
	@objc(CIFilterFactory_CIBlendWithAlphaMask) class CIBlendWithAlphaMask: Core {
		@objc public init?() {
			super.init(name: "CIBlendWithAlphaMask")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}

		///
		/// A masking image.
		///
		@objc public var inputMaskImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMaskImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMaskImage")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Blend With Blue Mask
	///
	/// Uses values from a mask image to interpolate between an image and the background. When a mask blue value is 0.0, the result is the background. When the mask blue value is 1.0, the result is the image.
	///
	/// **Links**
	///
	/// [CIBlendWithBlueMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithBlueMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBlendWithBlueMask/)
	///
	@objc(CIFilterFactory_CIBlendWithBlueMask) class CIBlendWithBlueMask: Core {
		@objc public init?() {
			super.init(name: "CIBlendWithBlueMask")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}

		///
		/// A masking image.
		///
		@objc public var inputMaskImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMaskImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMaskImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Blend With Mask
	///
	/// Uses values from a grayscale mask to interpolate between an image and the background. When a mask green value is 0.0, the result is the background. When the mask green value is 1.0, the result is the image.
	///
	/// **Links**
	///
	/// [CIBlendWithMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBlendWithMask/)
	///
	@objc(CIFilterFactory_CIBlendWithMask) class CIBlendWithMask: Core {
		@objc public init?() {
			super.init(name: "CIBlendWithMask")
			self.filter.setDefaults()
		}

		///
		/// The image to use as a foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}

		///
		/// A grayscale mask. When a mask value is 0.0, the result is the background. When the mask value is 1.0, the result is the image.
		///
		@objc public var inputMaskImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMaskImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMaskImage")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Blend With Red Mask
	///
	/// Uses values from a mask image to interpolate between an image and the background. When a mask red value is 0.0, the result is the background. When the mask red value is 1.0, the result is the image.
	///
	/// **Links**
	///
	/// [CIBlendWithRedMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithRedMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBlendWithRedMask/)
	///
	@objc(CIFilterFactory_CIBlendWithRedMask) class CIBlendWithRedMask: Core {
		@objc public init?() {
			super.init(name: "CIBlendWithRedMask")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}

		///
		/// A masking image.
		///
		@objc public var inputMaskImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMaskImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMaskImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Bloom
	///
	/// Softens edges and applies a pleasant glow to an image.
	///
	/// **Links**
	///
	/// [CIBloom Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBloom)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBloom/)
	///
	@objc(CIFilterFactory_CIBloom) class CIBloom: Core {
		@objc public init?() {
			super.init(name: "CIBloom")
			self.filter.setDefaults()
		}

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

		///
		/// The radius determines how many pixels are used to create the effect. The larger the radius, the greater the effect.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The intensity of the effect. A value of 0.0 is no effect. A value of 1.0 is the maximum effect.
		///
		///   minValue: 0.0
		///
		let inputIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputIntensity_Range), forKey: "inputIntensity")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Bokeh Blur
	///
	/// Smooths an image using a disc-shaped convolution kernel.
	///
	/// **Links**
	///
	/// [CIBokehBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBokehBlur)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBokehBlur/)
	///
	@objc(CIFilterFactory_CIBokehBlur) class CIBokehBlur: Core {
		@objc public init?() {
			super.init(name: "CIBokehBlur")
			self.filter.setDefaults()
		}

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

		///
		/// The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
		///
		///   minValue: 0.0
		///   maxValue: 500.0
		///
		let inputRadius_Range: ClosedRange<Float> = 0.0 ... 500.0
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The amount of extra emphasis at the ring of the bokeh.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputRingAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputRingAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRingAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRingAmount_Range), forKey: "inputRingAmount")
			}
		}

		///
		/// The size of extra emphasis at the ring of the bokeh
		///
		///   minValue: 0.0
		///
		let inputRingSize_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRingSize: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRingSize") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRingSize_Range), forKey: "inputRingSize")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///   maxValue: 10.0
		///
		let inputSoftness_Range: ClosedRange<Float> = 0.0 ... 10.0
		@objc public var inputSoftness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSoftness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSoftness_Range), forKey: "inputSoftness")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Box Blur
	///
	/// Smooths or sharpens an image using a box-shaped convolution kernel.
	///
	/// **Links**
	///
	/// [CIBoxBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBoxBlur)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBoxBlur/)
	///
	@objc(CIFilterFactory_CIBoxBlur) class CIBoxBlur: Core {
		@objc public init?() {
			super.init(name: "CIBoxBlur")
			self.filter.setDefaults()
		}

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

		///
		/// The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
		///
		///   minValue: 1.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Bump Distortion
	///
	/// Creates a concave or convex bump that originates at a specified point in the image.
	///
	/// **Links**
	///
	/// [CIBumpDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBumpDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBumpDistortion/)
	///
	@objc(CIFilterFactory_CIBumpDistortion) class CIBumpDistortion: Core {
		@objc public init?() {
			super.init(name: "CIBumpDistortion")
			self.filter.setDefaults()
		}

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

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The scale of the effect determines the curvature of the bump. A value of 0.0 has no effect. Positive values create an outward bump; negative values create an inward bump.
		///
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputScale")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Bump Distortion Linear
	///
	/// Creates a bump that originates from a linear portion of the image.
	///
	/// **Links**
	///
	/// [CIBumpDistortionLinear Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBumpDistortionLinear)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIBumpDistortionLinear/)
	///
	@objc(CIFilterFactory_CIBumpDistortionLinear) class CIBumpDistortionLinear: Core {
		@objc public init?() {
			super.init(name: "CIBumpDistortionLinear")
			self.filter.setDefaults()
		}

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

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The angle (in radians) of the line around which the distortion occurs.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The scale of the effect.
		///
		///   minValue: -1.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(-1.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}
	}
}

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
			self.filter.setDefaults()
		}

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

		///
		/// AVCameraCalibrationData for the correction. Will be set from the inputImage if available and can be overridden here.
		///
		@objc public var inputAVCameraCalibrationData: AVCameraCalibrationData? {
			get {
				return self.filter.value(forKey: "inputAVCameraCalibrationData") as? AVCameraCalibrationData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAVCameraCalibrationData")
			}
		}

		///
		/// Boolean value used to select the Look Up Table from the AVCameraCalibrationData
		///
		@objc public var inputUseInverseLookUpTable: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUseInverseLookUpTable") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputUseInverseLookUpTable")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Checkerboard
	///
	/// Generates a pattern of squares of alternating colors. You can specify the size, colors, and the sharpness of the pattern.
	///
	/// **Links**
	///
	/// [CICheckerboardGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICheckerboardGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICheckerboardGenerator/)
	///
	@objc(CIFilterFactory_CICheckerboardGenerator) class CICheckerboardGenerator: Core {
		@objc public init?() {
			super.init(name: "CICheckerboardGenerator")
			self.filter.setDefaults()
		}

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// A color to use for the first set of squares.
		///
		@objc public var inputColor0: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor0")
			}
		}

		///
		/// A color to use for the second set of squares.
		///
		@objc public var inputColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}

		///
		/// The width of the squares in the pattern.
		///
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWidth")
			}
		}

		///
		/// The sharpness of the edges in pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputSharpness_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Circle Splash Distortion
	///
	/// Distorts the pixels starting at the circumference of a circle and emanating outward.
	///
	/// **Links**
	///
	/// [CICircleSplashDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircleSplashDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICircleSplashDistortion/)
	///
	@objc(CIFilterFactory_CICircleSplashDistortion) class CICircleSplashDistortion: Core {
		@objc public init?() {
			super.init(name: "CICircleSplashDistortion")
			self.filter.setDefaults()
		}

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

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Circular Screen
	///
	/// Simulates a circular-shaped halftone screen.
	///
	/// **Links**
	///
	/// [CICircularScreen Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircularScreen)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICircularScreen/)
	///
	@objc(CIFilterFactory_CICircularScreen) class CICircularScreen: Core {
		@objc public init?() {
			super.init(name: "CICircularScreen")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the circular screen pattern
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The distance between each circle in the pattern.
		///
		///   minValue: 1.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The sharpness of the circles. The larger the value, the sharper the circles.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputSharpness_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Circular Wrap Distortion
	///
	/// Wraps an image around a transparent circle. The distortion of the image increases with the distance from the center of the circle.
	///
	/// **Links**
	///
	/// [CICircularWrap Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircularWrap)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICircularWrap/)
	///
	@objc(CIFilterFactory_CICircularWrap) class CICircularWrap: Core {
		@objc public init?() {
			super.init(name: "CICircularWrap")
			self.filter.setDefaults()
		}

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

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The angle of the effect.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}
	}
}

@available(macOS 10.12, iOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// Clamp
	///
	/// Clamps an image so the pixels with the specified extent are left unchanged but those at the boundary of the extent are extended outwards. This filter produces an image with infinite extent. You can use this filter when you need to blur an image but you want to avoid a soft, black fringe along the edges.
	///
	/// **Links**
	///
	/// [CIClamp Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIClamp)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIClamp/)
	///
	@objc(CIFilterFactory_CIClamp) class CIClamp: Core {
		@objc public init?() {
			super.init(name: "CIClamp")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// CMYK Halftone
	///
	/// Creates a color, halftoned rendition of the source image, using cyan, magenta, yellow, and black inks over a white page.
	///
	/// **Links**
	///
	/// [CICMYKHalftone Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICMYKHalftone)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICMYKHalftone/)
	///
	@objc(CIFilterFactory_CICMYKHalftone) class CICMYKHalftone: Core {
		@objc public init?() {
			super.init(name: "CICMYKHalftone")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the halftone pattern
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The distance between dots in the pattern.
		///
		///   minValue: -2.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(-2.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The angle of the pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The sharpness of the pattern. The larger the value, the sharper the pattern.
		///
		///   minValue: 0.0
		///
		let inputSharpness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSharpness_Range), forKey: "inputSharpness")
			}
		}

		///
		/// The gray component replacement value. The value can vary from 0.0 (none) to 1.0.
		///
		///   minValue: 0.0
		///
		let inputGCR_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputGCR: NSNumber? {
			get {
				return self.filter.value(forKey: "inputGCR") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputGCR_Range), forKey: "inputGCR")
			}
		}

		///
		/// The under color removal value. The value can vary from 0.0 to 1.0.
		///
		///   minValue: 0.0
		///
		let inputUCR_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputUCR: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUCR") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputUCR_Range), forKey: "inputUCR")
			}
		}
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Code 128 Barcode Generator
	///
	/// Generate a Code 128 barcode image for message data.
	///
	/// **Links**
	///
	/// [CICode128BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICode128BarcodeGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICode128BarcodeGenerator/)
	///
	@objc(CIFilterFactory_CICode128BarcodeGenerator) class CICode128BarcodeGenerator: Core {
		@objc public init?() {
			super.init(name: "CICode128BarcodeGenerator")
			self.filter.setDefaults()
		}

		///
		/// The message to encode in the Code 128 Barcode
		///
		@objc public var inputMessage: NSData? {
			get {
				return self.filter.value(forKey: "inputMessage") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMessage")
			}
		}

		///
		/// The number of empty white pixels that should surround the barcode.
		///
		///   minValue: 0.0
		///   maxValue: 100.0
		///
		let inputQuietSpace_Range: ClosedRange<Float> = 0.0 ... 100.0
		@objc public var inputQuietSpace: NSNumber? {
			get {
				return self.filter.value(forKey: "inputQuietSpace") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputQuietSpace_Range), forKey: "inputQuietSpace")
			}
		}

		///
		/// The height of the generated barcode in pixels.
		///
		///   minValue: 1.0
		///   maxValue: 500.0
		///
		let inputBarcodeHeight_Range: ClosedRange<Float> = 1.0 ... 500.0
		@objc public var inputBarcodeHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBarcodeHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputBarcodeHeight_Range), forKey: "inputBarcodeHeight")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Blend Mode
	///
	/// Uses the luminance values of the background with the hue and saturation values of the source image. This mode preserves the gray levels in the image.
	///
	/// **Links**
	///
	/// [CIColorBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorBlendMode/)
	///
	@objc(CIFilterFactory_CIColorBlendMode) class CIColorBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIColorBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Burn Blend Mode
	///
	/// Darkens the background image samples to reflect the source image samples. Source image sample values that specify white do not produce a change.
	///
	/// **Links**
	///
	/// [CIColorBurnBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorBurnBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorBurnBlendMode/)
	///
	@objc(CIFilterFactory_CIColorBurnBlendMode) class CIColorBurnBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIColorBurnBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Color Clamp
	///
	/// Clamp color to a certain range.
	///
	/// **Links**
	///
	/// [CIColorClamp Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorClamp)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorClamp/)
	///
	@objc(CIFilterFactory_CIColorClamp) class CIColorClamp: Core {
		@objc public init?() {
			super.init(name: "CIColorClamp")
			self.filter.setDefaults()
		}

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

		///
		/// Lower clamping values
		///
		@objc public var inputMinComponents: CIVector? {
			get {
				return self.filter.value(forKey: "inputMinComponents") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMinComponents")
			}
		}

		///
		/// Higher clamping values
		///
		@objc public var inputMaxComponents: CIVector? {
			get {
				return self.filter.value(forKey: "inputMaxComponents") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMaxComponents")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Controls
	///
	/// Adjusts saturation, brightness, and contrast values.
	///
	/// **Links**
	///
	/// [CIColorControls Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorControls)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorControls/)
	///
	@objc(CIFilterFactory_CIColorControls) class CIColorControls: Core {
		@objc public init?() {
			super.init(name: "CIColorControls")
			self.filter.setDefaults()
		}

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

		///
		/// The amount of saturation to apply. The larger the value, the more saturated the result.
		///
		///   minValue: 0.0
		///
		let inputSaturation_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSaturation: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSaturation") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSaturation_Range), forKey: "inputSaturation")
			}
		}

		///
		/// The amount of brightness to apply. The larger the value, the brighter the result.
		///
		///   minValue: -1.0
		///
		let inputBrightness_Range: PartialRangeFrom<Float> = Float(-1.0)...
		@objc public var inputBrightness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBrightness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputBrightness_Range), forKey: "inputBrightness")
			}
		}

		///
		/// The amount of contrast to apply. The larger the value, the more contrast in the resulting image.
		///
		///   minValue: 0.0
		///
		let inputContrast_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputContrast_Range), forKey: "inputContrast")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Color Cross Polynomial
	///
	/// Adjusts the color of an image with polynomials.
	///
	/// **Links**
	///
	/// [CIColorCrossPolynomial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCrossPolynomial)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorCrossPolynomial/)
	///
	@objc(CIFilterFactory_CIColorCrossPolynomial) class CIColorCrossPolynomial: Core {
		@objc public init?() {
			super.init(name: "CIColorCrossPolynomial")
			self.filter.setDefaults()
		}

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

		///
		/// Polynomial coefficients for red channel
		///
		@objc public var inputRedCoefficients: CIVector? {
			get {
				return self.filter.value(forKey: "inputRedCoefficients") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRedCoefficients")
			}
		}

		///
		/// Polynomial coefficients for green channel
		///
		@objc public var inputGreenCoefficients: CIVector? {
			get {
				return self.filter.value(forKey: "inputGreenCoefficients") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputGreenCoefficients")
			}
		}

		///
		/// Polynomial coefficients for blue channel
		///
		@objc public var inputBlueCoefficients: CIVector? {
			get {
				return self.filter.value(forKey: "inputBlueCoefficients") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBlueCoefficients")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Cube
	///
	/// Uses a three-dimensional color table to transform the source image pixels.
	///
	/// **Links**
	///
	/// [CIColorCube Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCube)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorCube/)
	///
	@objc(CIFilterFactory_CIColorCube) class CIColorCube: Core {
		@objc public init?() {
			super.init(name: "CIColorCube")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		///   minValue: 2.0
		///   maxValue: 128.0
		///
		let inputCubeDimension_Range: ClosedRange<Float> = 2.0 ... 128.0
		@objc public var inputCubeDimension: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCubeDimension") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCubeDimension_Range), forKey: "inputCubeDimension")
			}
		}

		///
		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		@objc public var inputCubeData: NSData? {
			get {
				return self.filter.value(forKey: "inputCubeData") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCubeData")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Color Cubes Mixed With Mask
	///
	/// Uses two three-dimensional color tables in a specified colorspace to transform the source image pixels. The mask image is used as an interpolant to mix the output of the two cubes.
	///
	/// **Links**
	///
	/// [CIColorCubesMixedWithMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubesMixedWithMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorCubesMixedWithMask/)
	///
	@objc(CIFilterFactory_CIColorCubesMixedWithMask) class CIColorCubesMixedWithMask: Core {
		@objc public init?() {
			super.init(name: "CIColorCubesMixedWithMask")
			self.filter.setDefaults()
		}

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

		///
		/// A masking image.
		///
		@objc public var inputMaskImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMaskImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMaskImage")
			}
		}

		///
		/// No Description
		///
		///   minValue: 2.0
		///   maxValue: 128.0
		///
		let inputCubeDimension_Range: ClosedRange<Float> = 2.0 ... 128.0
		@objc public var inputCubeDimension: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCubeDimension") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCubeDimension_Range), forKey: "inputCubeDimension")
			}
		}

		///
		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		@objc public var inputCube0Data: NSData? {
			get {
				return self.filter.value(forKey: "inputCube0Data") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCube0Data")
			}
		}

		///
		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		@objc public var inputCube1Data: NSData? {
			get {
				return self.filter.value(forKey: "inputCube1Data") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCube1Data")
			}
		}

		///
		/// No Description
		///
		@objc public var inputColorSpace: NSObject? {
			get {
				return self.filter.value(forKey: "inputColorSpace") as? NSObject
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColorSpace")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Color Cube with ColorSpace
	///
	/// Uses a three-dimensional color table in a specified colorspace to transform the source image pixels.
	///
	/// **Links**
	///
	/// [CIColorCubeWithColorSpace Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubeWithColorSpace)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorCubeWithColorSpace/)
	///
	@objc(CIFilterFactory_CIColorCubeWithColorSpace) class CIColorCubeWithColorSpace: Core {
		@objc public init?() {
			super.init(name: "CIColorCubeWithColorSpace")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		///   minValue: 2.0
		///   maxValue: 128.0
		///
		let inputCubeDimension_Range: ClosedRange<Float> = 2.0 ... 128.0
		@objc public var inputCubeDimension: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCubeDimension") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCubeDimension_Range), forKey: "inputCubeDimension")
			}
		}

		///
		/// Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.
		///
		@objc public var inputCubeData: NSData? {
			get {
				return self.filter.value(forKey: "inputCubeData") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCubeData")
			}
		}

		///
		/// No Description
		///
		@objc public var inputColorSpace: NSObject? {
			get {
				return self.filter.value(forKey: "inputColorSpace") as? NSObject
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColorSpace")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Color Curves
	///
	/// Uses a three-channel one-dimensional color table to transform the source image pixels. The color table must be composed of floating-point RGB values.
	///
	/// **Links**
	///
	/// [CIColorCurves Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCurves)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorCurves/)
	///
	@objc(CIFilterFactory_CIColorCurves) class CIColorCurves: Core {
		@objc public init?() {
			super.init(name: "CIColorCurves")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputCurvesData: NSData? {
			get {
				return self.filter.value(forKey: "inputCurvesData") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCurvesData")
			}
		}

		///
		/// No Description
		///
		@objc public var inputCurvesDomain: CIVector? {
			get {
				return self.filter.value(forKey: "inputCurvesDomain") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCurvesDomain")
			}
		}

		///
		/// No Description
		///
		@objc public var inputColorSpace: NSObject? {
			get {
				return self.filter.value(forKey: "inputColorSpace") as? NSObject
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColorSpace")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Dodge Blend Mode
	///
	/// Brightens the background image samples to reflect the source image samples. Source image sample values that specify black do not produce a change.
	///
	/// **Links**
	///
	/// [CIColorDodgeBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorDodgeBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorDodgeBlendMode/)
	///
	@objc(CIFilterFactory_CIColorDodgeBlendMode) class CIColorDodgeBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIColorDodgeBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Invert
	///
	/// Inverts the colors in an image.
	///
	/// **Links**
	///
	/// [CIColorInvert Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorInvert)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorInvert/)
	///
	@objc(CIFilterFactory_CIColorInvert) class CIColorInvert: Core {
		@objc public init?() {
			super.init(name: "CIColorInvert")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Color Map
	///
	/// Performs a nonlinear transformation of source color values using mapping values provided in a table.
	///
	/// **Links**
	///
	/// [CIColorMap Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMap)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorMap/)
	///
	@objc(CIFilterFactory_CIColorMap) class CIColorMap: Core {
		@objc public init?() {
			super.init(name: "CIColorMap")
			self.filter.setDefaults()
		}

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

		///
		/// The image data from this image transforms the source image values.
		///
		@objc public var inputGradientImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputGradientImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputGradientImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Matrix
	///
	/// Multiplies source color values and adds a bias factor to each color component.
	///
	/// **Links**
	///
	/// [CIColorMatrix Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMatrix)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorMatrix/)
	///
	@objc(CIFilterFactory_CIColorMatrix) class CIColorMatrix: Core {
		@objc public init?() {
			super.init(name: "CIColorMatrix")
			self.filter.setDefaults()
		}

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

		///
		/// The amount of red to multiply the source color values by.
		///
		@objc public var inputRVector: CIVector? {
			get {
				return self.filter.value(forKey: "inputRVector") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRVector")
			}
		}

		///
		/// The amount of green to multiply the source color values by.
		///
		@objc public var inputGVector: CIVector? {
			get {
				return self.filter.value(forKey: "inputGVector") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputGVector")
			}
		}

		///
		/// The amount of blue to multiply the source color values by.
		///
		@objc public var inputBVector: CIVector? {
			get {
				return self.filter.value(forKey: "inputBVector") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBVector")
			}
		}

		///
		/// The amount of alpha to multiply the source color values by.
		///
		@objc public var inputAVector: CIVector? {
			get {
				return self.filter.value(forKey: "inputAVector") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAVector")
			}
		}

		///
		/// A vector that’s added to each color component.
		///
		@objc public var inputBiasVector: CIVector? {
			get {
				return self.filter.value(forKey: "inputBiasVector") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBiasVector")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Color Monochrome
	///
	/// Remaps colors so they fall within shades of a single color.
	///
	/// **Links**
	///
	/// [CIColorMonochrome Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMonochrome)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorMonochrome/)
	///
	@objc(CIFilterFactory_CIColorMonochrome) class CIColorMonochrome: Core {
		@objc public init?() {
			super.init(name: "CIColorMonochrome")
			self.filter.setDefaults()
		}

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

		///
		/// The monochrome color to apply to the image.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// The intensity of the monochrome effect. A value of 1.0 creates a monochrome image using the supplied color. A value of 0.0 has no effect on the image.
		///
		///   minValue: 0.0
		///
		let inputIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputIntensity_Range), forKey: "inputIntensity")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Color Polynomial
	///
	/// Adjusts the color of an image with polynomials.
	///
	/// **Links**
	///
	/// [CIColorPolynomial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPolynomial)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorPolynomial/)
	///
	@objc(CIFilterFactory_CIColorPolynomial) class CIColorPolynomial: Core {
		@objc public init?() {
			super.init(name: "CIColorPolynomial")
			self.filter.setDefaults()
		}

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

		///
		/// Polynomial coefficients for red channel
		///
		@objc public var inputRedCoefficients: CIVector? {
			get {
				return self.filter.value(forKey: "inputRedCoefficients") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRedCoefficients")
			}
		}

		///
		/// Polynomial coefficients for green channel
		///
		@objc public var inputGreenCoefficients: CIVector? {
			get {
				return self.filter.value(forKey: "inputGreenCoefficients") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputGreenCoefficients")
			}
		}

		///
		/// Polynomial coefficients for blue channel
		///
		@objc public var inputBlueCoefficients: CIVector? {
			get {
				return self.filter.value(forKey: "inputBlueCoefficients") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBlueCoefficients")
			}
		}

		///
		/// Polynomial coefficients for alpha channel
		///
		@objc public var inputAlphaCoefficients: CIVector? {
			get {
				return self.filter.value(forKey: "inputAlphaCoefficients") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAlphaCoefficients")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Color Posterize
	///
	/// Remaps red, green, and blue color components to the number of brightness values you specify for each color component. This filter flattens colors to achieve a look similar to that of a silk-screened poster.
	///
	/// **Links**
	///
	/// [CIColorPosterize Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPosterize)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColorPosterize/)
	///
	@objc(CIFilterFactory_CIColorPosterize) class CIColorPosterize: Core {
		@objc public init?() {
			super.init(name: "CIColorPosterize")
			self.filter.setDefaults()
		}

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

		///
		/// The number of brightness levels to use for each color component. Lower values result in a more extreme poster effect.
		///
		///   minValue: 1.0
		///
		let inputLevels_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputLevels: NSNumber? {
			get {
				return self.filter.value(forKey: "inputLevels") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputLevels_Range), forKey: "inputLevels")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Column Average
	///
	/// Calculates the average color for each column of the specified area in an image, returning the result in a 1D image.
	///
	/// **Links**
	///
	/// [CIColumnAverage Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColumnAverage)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIColumnAverage/)
	///
	@objc(CIFilterFactory_CIColumnAverage) class CIColumnAverage: Core {
		@objc public init?() {
			super.init(name: "CIColumnAverage")
			self.filter.setDefaults()
		}

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

		///
		/// A rectangle that specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Comic Effect
	///
	/// Simulates a comic book drawing by outlining edges and applying a color halftone effect.
	///
	/// **Links**
	///
	/// [CIComicEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIComicEffect)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIComicEffect/)
	///
	@objc(CIFilterFactory_CIComicEffect) class CIComicEffect: Core {
		@objc public init?() {
			super.init(name: "CIComicEffect")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Constant Color
	///
	/// Generates a solid color. You typically use the output of this filter as the input to another filter.
	///
	/// **Links**
	///
	/// [CIConstantColorGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConstantColorGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIConstantColorGenerator/)
	///
	@objc(CIFilterFactory_CIConstantColorGenerator) class CIConstantColorGenerator: Core {
		@objc public init?() {
			super.init(name: "CIConstantColorGenerator")
			self.filter.setDefaults()
		}

		///
		/// The color to generate.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// 3 by 3 convolution
	///
	/// Convolution with 3 by 3 matrix
	///
	/// **Links**
	///
	/// [CIConvolution3X3 Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution3X3)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIConvolution3X3/)
	///
	@objc(CIFilterFactory_CIConvolution3X3) class CIConvolution3X3: Core {
		@objc public init?() {
			super.init(name: "CIConvolution3X3")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputWeights: CIVector? {
			get {
				return self.filter.value(forKey: "inputWeights") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWeights")
			}
		}

		///
		/// No Description
		///
		@objc public var inputBias: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBias") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBias")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// 5 by 5 convolution
	///
	/// Convolution with 5 by 5 matrix
	///
	/// **Links**
	///
	/// [CIConvolution5X5 Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution5X5)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIConvolution5X5/)
	///
	@objc(CIFilterFactory_CIConvolution5X5) class CIConvolution5X5: Core {
		@objc public init?() {
			super.init(name: "CIConvolution5X5")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputWeights: CIVector? {
			get {
				return self.filter.value(forKey: "inputWeights") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWeights")
			}
		}

		///
		/// No Description
		///
		@objc public var inputBias: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBias") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBias")
			}
		}
	}
}

@available(macOS 10.9, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// 7 by 7 convolution
	///
	/// Convolution with 7 by 7 matrix
	///
	/// **Links**
	///
	/// [CIConvolution7X7 Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution7X7)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIConvolution7X7/)
	///
	@objc(CIFilterFactory_CIConvolution7X7) class CIConvolution7X7: Core {
		@objc public init?() {
			super.init(name: "CIConvolution7X7")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputWeights: CIVector? {
			get {
				return self.filter.value(forKey: "inputWeights") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWeights")
			}
		}

		///
		/// No Description
		///
		@objc public var inputBias: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBias") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBias")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Horizontal 9 Convolution
	///
	/// Horizontal Convolution with 9 values
	///
	/// **Links**
	///
	/// [CIConvolution9Horizontal Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution9Horizontal)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIConvolution9Horizontal/)
	///
	@objc(CIFilterFactory_CIConvolution9Horizontal) class CIConvolution9Horizontal: Core {
		@objc public init?() {
			super.init(name: "CIConvolution9Horizontal")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputWeights: CIVector? {
			get {
				return self.filter.value(forKey: "inputWeights") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWeights")
			}
		}

		///
		/// No Description
		///
		@objc public var inputBias: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBias") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBias")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Vertical 9 Convolution
	///
	/// Vertical Convolution with 9 values
	///
	/// **Links**
	///
	/// [CIConvolution9Vertical Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution9Vertical)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIConvolution9Vertical/)
	///
	@objc(CIFilterFactory_CIConvolution9Vertical) class CIConvolution9Vertical: Core {
		@objc public init?() {
			super.init(name: "CIConvolution9Vertical")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputWeights: CIVector? {
			get {
				return self.filter.value(forKey: "inputWeights") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWeights")
			}
		}

		///
		/// No Description
		///
		@objc public var inputBias: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBias") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBias")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Copy Machine
	///
	/// Transitions from one image to another by simulating the effect of a copy machine.
	///
	/// **Links**
	///
	/// [CICopyMachineTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICopyMachineTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICopyMachineTransition/)
	///
	@objc(CIFilterFactory_CICopyMachineTransition) class CICopyMachineTransition: Core {
		@objc public init?() {
			super.init(name: "CICopyMachineTransition")
			self.filter.setDefaults()
		}

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

		///
		/// The color of the copier light.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The angle of the copier light.
		///
		///   minValue: 0.0
		///
		let inputAngle_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputAngle_Range), forKey: "inputAngle")
			}
		}

		///
		/// The width of the copier light.
		///
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWidth")
			}
		}

		///
		/// The opacity of the copier light. A value of 0.0 is transparent. A value of 1.0 is opaque.
		///
		///   minValue: 0.0
		///
		let inputOpacity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputOpacity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputOpacity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputOpacity_Range), forKey: "inputOpacity")
			}
		}
	}
}

@available(macOS 10.14, iOS 12, *)
@objc public extension CIFilterFactory {
	///
	/// CoreML Model Filter
	///
	/// Generates output image by applying input CoreML model to the input image.
	///
	/// **Links**
	///
	/// [CICoreMLModelFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICoreMLModelFilter)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICoreMLModelFilter/)
	///
	@objc(CIFilterFactory_CICoreMLModelFilter) class CICoreMLModelFilter: Core {
		@objc public init?() {
			super.init(name: "CICoreMLModelFilter")
			self.filter.setDefaults()
		}

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

		///
		/// The CoreML model to be used for applying effect on the image.
		///
		@objc public var inputModel: MLModel? {
			get {
				return self.filter.value(forKey: "inputModel") as? MLModel
			}
			set {
				self.filter.setValue(newValue, forKey: "inputModel")
			}
		}

		///
		/// A number to specify which output of a multi-head CoreML model should be used for applying effect on the image.
		///
		///   minValue: 0.0
		///   maxValue: 10.0
		///
		let inputHeadIndex_Range: ClosedRange<Float> = 0.0 ... 10.0
		@objc public var inputHeadIndex: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHeadIndex") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputHeadIndex_Range), forKey: "inputHeadIndex")
			}
		}

		///
		/// A boolean value to specify that Softmax normalization should be applied to the output of the model.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputSoftmaxNormalization_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputSoftmaxNormalization: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSoftmaxNormalization") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSoftmaxNormalization_Range), forKey: "inputSoftmaxNormalization")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Crop
	///
	/// Applies a crop to an image. The size and shape of the cropped image depend on the rectangle you specify.
	///
	/// **Links**
	///
	/// [CICrop Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICrop)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICrop/)
	///
	@objc(CIFilterFactory_CICrop) class CICrop: Core {
		@objc public init?() {
			super.init(name: "CICrop")
			self.filter.setDefaults()
		}

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

		///
		/// The rectangle that specifies the crop to apply to the image.
		///
		@objc public var inputRectangle: CIVector? {
			get {
				return self.filter.value(forKey: "inputRectangle") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRectangle")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Crystallize
	///
	/// Creates polygon-shaped color blocks by aggregating source pixel-color values.
	///
	/// **Links**
	///
	/// [CICrystallize Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICrystallize)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CICrystallize/)
	///
	@objc(CIFilterFactory_CICrystallize) class CICrystallize: Core {
		@objc public init?() {
			super.init(name: "CICrystallize")
			self.filter.setDefaults()
		}

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

		///
		/// The radius determines how many pixels are used to create the effect. The larger the radius, the larger the resulting crystals.
		///
		///   minValue: 1.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Darken Blend Mode
	///
	/// Creates composite image samples by choosing the darker samples (from either the source image or the background). The result is that the background image samples are replaced by any source image samples that are darker. Otherwise, the background image samples are left unchanged.
	///
	/// **Links**
	///
	/// [CIDarkenBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDarkenBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDarkenBlendMode/)
	///
	@objc(CIFilterFactory_CIDarkenBlendMode) class CIDarkenBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIDarkenBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Depth Blur Effect
	///
	/// Applies a variable radius disc blur to an image where areas in the background are softened more than those in the foreground.
	///
	/// **Links**
	///
	/// [CIDepthBlurEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthBlurEffect)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDepthBlurEffect/)
	///
	@objc(CIFilterFactory_CIDepthBlurEffect) class CIDepthBlurEffect: Core {
		@objc public init?() {
			super.init(name: "CIDepthBlurEffect")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputDisparityImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputDisparityImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputDisparityImage")
			}
		}

		///
		/// A matting image.
		///
		@objc public var inputMatteImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMatteImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMatteImage")
			}
		}

		///
		/// A matting image.
		///
		@objc public var inputHairImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputHairImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputHairImage")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///   maxValue: 22.0
		///
		let inputAperture_Range: ClosedRange<Float> = 0.0 ... 22.0
		@objc public var inputAperture: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAperture") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputAperture_Range), forKey: "inputAperture")
			}
		}

		///
		/// No Description
		///
		@objc public var inputLeftEyePositions: CIVector? {
			get {
				return self.filter.value(forKey: "inputLeftEyePositions") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputLeftEyePositions")
			}
		}

		///
		/// No Description
		///
		@objc public var inputRightEyePositions: CIVector? {
			get {
				return self.filter.value(forKey: "inputRightEyePositions") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRightEyePositions")
			}
		}

		///
		/// No Description
		///
		@objc public var inputChinPositions: CIVector? {
			get {
				return self.filter.value(forKey: "inputChinPositions") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputChinPositions")
			}
		}

		///
		/// No Description
		///
		@objc public var inputNosePositions: CIVector? {
			get {
				return self.filter.value(forKey: "inputNosePositions") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputNosePositions")
			}
		}

		///
		/// No Description
		///
		@objc public var inputFocusRect: CIVector? {
			get {
				return self.filter.value(forKey: "inputFocusRect") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputFocusRect")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputLumaNoiseScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputLumaNoiseScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputLumaNoiseScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputLumaNoiseScale_Range), forKey: "inputLumaNoiseScale")
			}
		}

		///
		/// No Description
		///
		@objc public var inputScaleFactor: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScaleFactor") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputScaleFactor")
			}
		}

		///
		/// No Description
		///
		@objc public var inputCalibrationData: AVCameraCalibrationData? {
			get {
				return self.filter.value(forKey: "inputCalibrationData") as? AVCameraCalibrationData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCalibrationData")
			}
		}

		///
		/// No Description
		///
		@objc public var inputAuxDataMetadata: CGImageMetadata? {
			get {
				return (self.filter.value(forKey: "inputAuxDataMetadata") as! CGImageMetadata)
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAuxDataMetadata")
			}
		}

		///
		/// No Description
		///
		@objc public var inputShape: NSString? {
			get {
				return self.filter.value(forKey: "inputShape") as? NSString
			}
			set {
				self.filter.setValue(newValue, forKey: "inputShape")
			}
		}
	}
}

@available(macOS 10.6, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Depth of Field
	///
	/// Simulates miniaturization effect created by Tilt & Shift lens by performing depth of field effects.
	///
	/// **Links**
	///
	/// [CIDepthOfField Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthOfField)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDepthOfField/)
	///
	@objc(CIFilterFactory_CIDepthOfField) class CIDepthOfField: Core {
		@objc public init?() {
			super.init(name: "CIDepthOfField")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputPoint0: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint0") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint0")
			}
		}

		///
		/// No Description
		///
		@objc public var inputPoint1: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint1") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint1")
			}
		}

		///
		/// The amount to adjust the saturation.
		///
		///   minValue: 0.0
		///
		let inputSaturation_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSaturation: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSaturation") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSaturation_Range), forKey: "inputSaturation")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputUnsharpMaskRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputUnsharpMaskRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUnsharpMaskRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputUnsharpMaskRadius_Range), forKey: "inputUnsharpMaskRadius")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputUnsharpMaskIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputUnsharpMaskIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputUnsharpMaskIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputUnsharpMaskIntensity_Range), forKey: "inputUnsharpMaskIntensity")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Depth To Disparity
	///
	/// Convert a depth data image to disparity data.
	///
	/// **Links**
	///
	/// [CIDepthToDisparity Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthToDisparity)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDepthToDisparity/)
	///
	@objc(CIFilterFactory_CIDepthToDisparity) class CIDepthToDisparity: Core {
		@objc public init?() {
			super.init(name: "CIDepthToDisparity")
			self.filter.setDefaults()
		}

		///
		/// The input depth data image to convert to disparity data.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Difference Blend Mode
	///
	/// Subtracts either the source image sample color from the background image sample color, or the reverse, depending on which sample has the greater brightness value. Source image sample values that are black produce no change; white inverts the background color values.
	///
	/// **Links**
	///
	/// [CIDifferenceBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDifferenceBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDifferenceBlendMode/)
	///
	@objc(CIFilterFactory_CIDifferenceBlendMode) class CIDifferenceBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIDifferenceBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Disc Blur
	///
	/// Smooths an image using a disc-shaped convolution kernel.
	///
	/// **Links**
	///
	/// [CIDiscBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDiscBlur)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDiscBlur/)
	///
	@objc(CIFilterFactory_CIDiscBlur) class CIDiscBlur: Core {
		@objc public init?() {
			super.init(name: "CIDiscBlur")
			self.filter.setDefaults()
		}

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

		///
		/// The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Disintegrate With Mask
	///
	/// Transitions from one image to another using the shape defined by a mask.
	///
	/// **Links**
	///
	/// [CIDisintegrateWithMaskTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisintegrateWithMaskTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDisintegrateWithMaskTransition/)
	///
	@objc(CIFilterFactory_CIDisintegrateWithMaskTransition) class CIDisintegrateWithMaskTransition: Core {
		@objc public init?() {
			super.init(name: "CIDisintegrateWithMaskTransition")
			self.filter.setDefaults()
		}

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

		///
		/// An image that defines the shape to use when disintegrating from the source to the target image.
		///
		@objc public var inputMaskImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputMaskImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMaskImage")
			}
		}

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The radius of the shadow created by the mask.
		///
		///   minValue: 0.0
		///
		let inputShadowRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputShadowRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputShadowRadius_Range), forKey: "inputShadowRadius")
			}
		}

		///
		/// The density of the shadow created by the mask.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputShadowDensity_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputShadowDensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowDensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputShadowDensity_Range), forKey: "inputShadowDensity")
			}
		}

		///
		/// The offset of the shadow created by the mask.
		///
		@objc public var inputShadowOffset: CIVector? {
			get {
				return self.filter.value(forKey: "inputShadowOffset") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputShadowOffset")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Disparity To Depth
	///
	/// Convert a disparity data image to depth data.
	///
	/// **Links**
	///
	/// [CIDisparityToDepth Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisparityToDepth)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDisparityToDepth/)
	///
	@objc(CIFilterFactory_CIDisparityToDepth) class CIDisparityToDepth: Core {
		@objc public init?() {
			super.init(name: "CIDisparityToDepth")
			self.filter.setDefaults()
		}

		///
		/// The input disparity data image to convert to depth data.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Displacement Distortion
	///
	/// Applies the grayscale values of the second image to the first image. The output image has a texture defined by the grayscale values.
	///
	/// **Links**
	///
	/// [CIDisplacementDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisplacementDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDisplacementDistortion/)
	///
	@objc(CIFilterFactory_CIDisplacementDistortion) class CIDisplacementDistortion: Core {
		@objc public init?() {
			super.init(name: "CIDisplacementDistortion")
			self.filter.setDefaults()
		}

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

		///
		/// An image whose grayscale values will be applied to the source image.
		///
		@objc public var inputDisplacementImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputDisplacementImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputDisplacementImage")
			}
		}

		///
		/// The amount of texturing of the resulting image. The larger the value, the greater the texturing.
		///
		///   minValue: 0.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Dissolve
	///
	/// Uses a dissolve to transition from one image to another.
	///
	/// **Links**
	///
	/// [CIDissolveTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDissolveTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDissolveTransition/)
	///
	@objc(CIFilterFactory_CIDissolveTransition) class CIDissolveTransition: Core {
		@objc public init?() {
			super.init(name: "CIDissolveTransition")
			self.filter.setDefaults()
		}

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

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}
	}
}

@available(macOS 10.14, iOS 12, *)
@objc public extension CIFilterFactory {
	///
	/// Dither
	///
	/// Apply dithering to an image. This operation is usually performed in a perceptual color space.
	///
	/// **Links**
	///
	/// [CIDither Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDither)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDither/)
	///
	@objc(CIFilterFactory_CIDither) class CIDither: Core {
		@objc public init?() {
			super.init(name: "CIDither")
			self.filter.setDefaults()
		}

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

		///
		/// The intensity of the effect.
		///
		///   minValue: 0.0
		///   maxValue: 5.0
		///
		let inputIntensity_Range: ClosedRange<Float> = 0.0 ... 5.0
		@objc public var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputIntensity_Range), forKey: "inputIntensity")
			}
		}
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Divide Blend Mode
	///
	/// Divides the background image sample color from the source image sample color.
	///
	/// **Links**
	///
	/// [CIDivideBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDivideBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDivideBlendMode/)
	///
	@objc(CIFilterFactory_CIDivideBlendMode) class CIDivideBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIDivideBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Document Enhancer
	///
	/// Enhance a document image by removing unwanted shadows, whitening the background, and enhancing contrast.
	///
	/// **Links**
	///
	/// [CIDocumentEnhancer Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDocumentEnhancer)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDocumentEnhancer/)
	///
	@objc(CIFilterFactory_CIDocumentEnhancer) class CIDocumentEnhancer: Core {
		@objc public init?() {
			super.init(name: "CIDocumentEnhancer")
			self.filter.setDefaults()
		}

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

		///
		/// The amount of enhancement.
		///
		///   minValue: 0.0
		///   maxValue: 10.0
		///
		let inputAmount_Range: ClosedRange<Float> = 0.0 ... 10.0
		@objc public var inputAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputAmount_Range), forKey: "inputAmount")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Dot Screen
	///
	/// Simulates the dot patterns of a halftone screen.
	///
	/// **Links**
	///
	/// [CIDotScreen Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDotScreen)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDotScreen/)
	///
	@objc(CIFilterFactory_CIDotScreen) class CIDotScreen: Core {
		@objc public init?() {
			super.init(name: "CIDotScreen")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the dot screen pattern
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle of the pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The distance between dots in the pattern.
		///
		///   minValue: 1.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The sharpness of the pattern. The larger the value, the sharper the pattern.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputSharpness_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}

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
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputInsetPoint0: CIVector? {
			get {
				return self.filter.value(forKey: "inputInsetPoint0") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputInsetPoint0")
			}
		}

		///
		/// No Description
		///
		@objc public var inputInsetPoint1: CIVector? {
			get {
				return self.filter.value(forKey: "inputInsetPoint1") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputInsetPoint1")
			}
		}

		///
		/// No Description
		///
		///   minValue: -10.0
		///   maxValue: 10.0
		///
		let inputStrands_Range: ClosedRange<Float> = -10.0 ... 10.0
		@objc public var inputStrands: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStrands") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputStrands_Range), forKey: "inputStrands")
			}
		}

		///
		/// No Description
		///
		///   minValue: 1.0
		///
		let inputPeriodicity_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputPeriodicity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPeriodicity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputPeriodicity_Range), forKey: "inputPeriodicity")
			}
		}

		///
		/// No Description
		///
		@objc public var inputRotation: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRotation") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRotation")
			}
		}

		///
		/// No Description
		///
		@objc public var inputZoom: NSNumber? {
			get {
				return self.filter.value(forKey: "inputZoom") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputZoom")
			}
		}
	}
}

@available(macOS 10.12, iOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// Edge Preserve Upsample Filter
	///
	/// Upsamples a small image to the size of the input image using the luminance of the input image as a guide to preserve detail.
	///
	/// **Links**
	///
	/// [CIEdgePreserveUpsampleFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdgePreserveUpsampleFilter)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIEdgePreserveUpsampleFilter/)
	///
	@objc(CIFilterFactory_CIEdgePreserveUpsampleFilter) class CIEdgePreserveUpsampleFilter: Core {
		@objc public init?() {
			super.init(name: "CIEdgePreserveUpsampleFilter")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputSmallImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputSmallImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputSmallImage")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///   maxValue: 5.0
		///
		let inputSpatialSigma_Range: ClosedRange<Float> = 0.0 ... 5.0
		@objc public var inputSpatialSigma: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSpatialSigma") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSpatialSigma_Range), forKey: "inputSpatialSigma")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputLumaSigma_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputLumaSigma: NSNumber? {
			get {
				return self.filter.value(forKey: "inputLumaSigma") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputLumaSigma_Range), forKey: "inputLumaSigma")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Edges
	///
	/// Finds all edges in an image and displays them in color.
	///
	/// **Links**
	///
	/// [CIEdges Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdges)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIEdges/)
	///
	@objc(CIFilterFactory_CIEdges) class CIEdges: Core {
		@objc public init?() {
			super.init(name: "CIEdges")
			self.filter.setDefaults()
		}

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

		///
		/// The intensity of the edges. The larger the value, the higher the intensity.
		///
		///   minValue: 0.0
		///
		let inputIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputIntensity_Range), forKey: "inputIntensity")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Edge Work
	///
	/// Produces a stylized black-and-white rendition of an image that looks similar to a woodblock cutout.
	///
	/// **Links**
	///
	/// [CIEdgeWork Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdgeWork)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIEdgeWork/)
	///
	@objc(CIFilterFactory_CIEdgeWork) class CIEdgeWork: Core {
		@objc public init?() {
			super.init(name: "CIEdgeWork")
			self.filter.setDefaults()
		}

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

		///
		/// The thickness of the edges. The larger the value, the thicker the edges.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Eightfold Reflected Tile
	///
	/// Produces a tiled image from a source image by applying an 8-way reflected symmetry.
	///
	/// **Links**
	///
	/// [CIEightfoldReflectedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEightfoldReflectedTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIEightfoldReflectedTile/)
	///
	@objc(CIFilterFactory_CIEightfoldReflectedTile) class CIEightfoldReflectedTile: Core {
		@objc public init?() {
			super.init(name: "CIEightfoldReflectedTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Exclusion Blend Mode
	///
	/// Produces an effect similar to that produced by the “Difference Blend Mode” filter but with lower contrast. Source image sample values that are black do not produce a change; white inverts the background color values.
	///
	/// **Links**
	///
	/// [CIExclusionBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExclusionBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIExclusionBlendMode/)
	///
	@objc(CIFilterFactory_CIExclusionBlendMode) class CIExclusionBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIExclusionBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Exposure Adjust
	///
	/// Adjusts the exposure setting for an image similar to the way you control exposure for a camera when you change the F-stop.
	///
	/// **Links**
	///
	/// [CIExposureAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExposureAdjust)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIExposureAdjust/)
	///
	@objc(CIFilterFactory_CIExposureAdjust) class CIExposureAdjust: Core {
		@objc public init?() {
			super.init(name: "CIExposureAdjust")
			self.filter.setDefaults()
		}

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

		///
		/// The amount to adjust the exposure of the image by. The larger the value, the brighter the exposure.
		///
		@objc public var inputEV: NSNumber? {
			get {
				return self.filter.value(forKey: "inputEV") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputEV")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// False Color
	///
	/// Maps luminance to a color ramp of two colors. False color is often used to process astronomical and other scientific data, such as ultraviolet and x-ray images.
	///
	/// **Links**
	///
	/// [CIFalseColor Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFalseColor)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIFalseColor/)
	///
	@objc(CIFilterFactory_CIFalseColor) class CIFalseColor: Core {
		@objc public init?() {
			super.init(name: "CIFalseColor")
			self.filter.setDefaults()
		}

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

		///
		/// The first color to use for the color ramp.
		///
		@objc public var inputColor0: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor0")
			}
		}

		///
		/// The second color to use for the color ramp.
		///
		@objc public var inputColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Flash
	///
	/// Transitions from one image to another by creating a flash. The flash originates from a point you specify. Small at first, it rapidly expands until the image frame is completely filled with the flash color. As the color fades, the target image begins to appear.
	///
	/// **Links**
	///
	/// [CIFlashTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFlashTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIFlashTransition/)
	///
	@objc(CIFilterFactory_CIFlashTransition) class CIFlashTransition: Core {
		@objc public init?() {
			super.init(name: "CIFlashTransition")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The extent of the flash.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}

		///
		/// The color of the light rays emanating from the flash.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The radius of the light rays emanating from the flash.
		///
		///   minValue: 0.0
		///
		let inputMaxStriationRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputMaxStriationRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMaxStriationRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputMaxStriationRadius_Range), forKey: "inputMaxStriationRadius")
			}
		}

		///
		/// The strength of the light rays emanating from the flash.
		///
		///   minValue: 0.0
		///
		let inputStriationStrength_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputStriationStrength: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationStrength") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputStriationStrength_Range), forKey: "inputStriationStrength")
			}
		}

		///
		/// The contrast of the light rays emanating from the flash.
		///
		///   minValue: 0.0
		///
		let inputStriationContrast_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputStriationContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputStriationContrast_Range), forKey: "inputStriationContrast")
			}
		}

		///
		/// The amount of fade between the flash and the target image. The higher the value, the more flash time and the less fade time.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputFadeThreshold_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputFadeThreshold: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFadeThreshold") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputFadeThreshold_Range), forKey: "inputFadeThreshold")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Fourfold Reflected Tile
	///
	/// Produces a tiled image from a source image by applying a 4-way reflected symmetry.
	///
	/// **Links**
	///
	/// [CIFourfoldReflectedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldReflectedTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIFourfoldReflectedTile/)
	///
	@objc(CIFilterFactory_CIFourfoldReflectedTile) class CIFourfoldReflectedTile: Core {
		@objc public init?() {
			super.init(name: "CIFourfoldReflectedTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The primary angle for the repeating reflected tile. Small values create thin diamond tiles, and higher values create fatter reflected tiles.
		///
		@objc public var inputAcuteAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAcuteAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAcuteAngle")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Fourfold Rotated Tile
	///
	/// Produces a tiled image from a source image by rotating the source at increments of 90 degrees.
	///
	/// **Links**
	///
	/// [CIFourfoldRotatedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldRotatedTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIFourfoldRotatedTile/)
	///
	@objc(CIFilterFactory_CIFourfoldRotatedTile) class CIFourfoldRotatedTile: Core {
		@objc public init?() {
			super.init(name: "CIFourfoldRotatedTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Fourfold Translated Tile
	///
	/// Produces a tiled image from a source image by applying 4 translation operations.
	///
	/// **Links**
	///
	/// [CIFourfoldTranslatedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldTranslatedTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIFourfoldTranslatedTile/)
	///
	@objc(CIFilterFactory_CIFourfoldTranslatedTile) class CIFourfoldTranslatedTile: Core {
		@objc public init?() {
			super.init(name: "CIFourfoldTranslatedTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The primary angle for the repeating translated tile. Small values create thin diamond tiles, and higher values create fatter translated tiles.
		///
		@objc public var inputAcuteAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAcuteAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAcuteAngle")
			}
		}
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Gabor Gradients
	///
	/// Applies multichannel 5 by 5 Gabor gradient filter to an image. The resulting image has maximum horizontal gradient in the red channel and the maximum vertical gradient in the green channel. The gradient values can be positive or negative.
	///
	/// **Links**
	///
	/// [CIGaborGradients Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaborGradients)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIGaborGradients/)
	///
	@objc(CIFilterFactory_CIGaborGradients) class CIGaborGradients: Core {
		@objc public init?() {
			super.init(name: "CIGaborGradients")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Gamma Adjust
	///
	/// Adjusts midtone brightness. This filter is typically used to compensate for nonlinear effects of displays. Adjusting the gamma effectively changes the slope of the transition between black and white.
	///
	/// **Links**
	///
	/// [CIGammaAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGammaAdjust)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIGammaAdjust/)
	///
	@objc(CIFilterFactory_CIGammaAdjust) class CIGammaAdjust: Core {
		@objc public init?() {
			super.init(name: "CIGammaAdjust")
			self.filter.setDefaults()
		}

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

		///
		/// A gamma value to use to correct image brightness. The larger the value, the darker the result.
		///
		@objc public var inputPower: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPower") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPower")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Gaussian Blur
	///
	/// Spreads source pixels by an amount specified by a Gaussian distribution.
	///
	/// **Links**
	///
	/// [CIGaussianBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaussianBlur)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIGaussianBlur/)
	///
	@objc(CIFilterFactory_CIGaussianBlur) class CIGaussianBlur: Core {
		@objc public init?() {
			super.init(name: "CIGaussianBlur")
			self.filter.setDefaults()
		}

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

		///
		/// The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Gaussian Gradient
	///
	/// Generates a gradient that varies from one color to another using a Gaussian distribution.
	///
	/// **Links**
	///
	/// [CIGaussianGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaussianGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIGaussianGradient/)
	///
	@objc(CIFilterFactory_CIGaussianGradient) class CIGaussianGradient: Core {
		@objc public init?() {
			super.init(name: "CIGaussianGradient")
			self.filter.setDefaults()
		}

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The first color to use in the gradient.
		///
		@objc public var inputColor0: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor0")
			}
		}

		///
		/// The second color to use in the gradient.
		///
		@objc public var inputColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}

		///
		/// The radius of the Gaussian distribution.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.4, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Glass Distortion
	///
	/// Distorts an image by applying a glass-like texture. The raised portions of the output image are the result of applying a texture map.
	///
	/// **Links**
	///
	/// [CIGlassDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIGlassDistortion/)
	///
	@objc(CIFilterFactory_CIGlassDistortion) class CIGlassDistortion: Core {
		@objc public init?() {
			super.init(name: "CIGlassDistortion")
			self.filter.setDefaults()
		}

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

		///
		/// A texture to apply to the source image.
		///
		@objc public var inputTexture: CIImage? {
			get {
				return self.filter.value(forKey: "inputTexture") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTexture")
			}
		}

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The amount of texturing of the resulting image. The larger the value, the greater the texturing.
		///
		///   minValue: 0.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Glass Lozenge
	///
	/// Creates a lozenge-shaped lens and distorts the portion of the image over which the lens is placed.
	///
	/// **Links**
	///
	/// [CIGlassLozenge Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassLozenge)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIGlassLozenge/)
	///
	@objc(CIFilterFactory_CIGlassLozenge) class CIGlassLozenge: Core {
		@objc public init?() {
			super.init(name: "CIGlassLozenge")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position that defines the center of the circle at one end of the lozenge.
		///
		@objc public var inputPoint0: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint0") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint0")
			}
		}

		///
		/// The x and y position that defines the center of the circle at the other end of the lozenge.
		///
		@objc public var inputPoint1: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint1") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint1")
			}
		}

		///
		/// The radius of the lozenge. The larger the radius, the wider the extent of the distortion.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The refraction of the glass.
		///
		///   minValue: 0.0
		///
		let inputRefraction_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRefraction: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRefraction") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRefraction_Range), forKey: "inputRefraction")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Glide Reflected Tile
	///
	/// Produces a tiled image from a source image by translating and smearing the image.
	///
	/// **Links**
	///
	/// [CIGlideReflectedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlideReflectedTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIGlideReflectedTile/)
	///
	@objc(CIFilterFactory_CIGlideReflectedTile) class CIGlideReflectedTile: Core {
		@objc public init?() {
			super.init(name: "CIGlideReflectedTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Gloom
	///
	/// Dulls the highlights of an image.
	///
	/// **Links**
	///
	/// [CIGloom Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGloom)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIGloom/)
	///
	@objc(CIFilterFactory_CIGloom) class CIGloom: Core {
		@objc public init?() {
			super.init(name: "CIGloom")
			self.filter.setDefaults()
		}

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

		///
		/// The radius determines how many pixels are used to create the effect. The larger the radius, the greater the effect.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The intensity of the effect. A value of 0.0 is no effect. A value of 1.0 is the maximum effect.
		///
		///   minValue: 0.0
		///
		let inputIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputIntensity_Range), forKey: "inputIntensity")
			}
		}
	}
}

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
			self.filter.setDefaults()
		}

		///
		/// A small image to upsample.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// A larger image to use as a guide.
		///
		@objc public var inputGuideImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputGuideImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputGuideImage")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}

		///
		/// No Description
		///
		@objc public var inputEpsilon: NSNumber? {
			get {
				return self.filter.value(forKey: "inputEpsilon") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputEpsilon")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Hard Light Blend Mode
	///
	/// Either multiplies or screens colors, depending on the source image sample color. If the source image sample color is lighter than 50% gray, the background is lightened, similar to screening. If the source image sample color is darker than 50% gray, the background is darkened, similar to multiplying. If the source image sample color is equal to 50% gray, the source image is not changed. Image samples that are equal to pure black or pure white result in pure black or white. The overall effect is similar to what you would achieve by shining a harsh spotlight on the source image.
	///
	/// **Links**
	///
	/// [CIHardLightBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHardLightBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHardLightBlendMode/)
	///
	@objc(CIFilterFactory_CIHardLightBlendMode) class CIHardLightBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIHardLightBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Hatched Screen
	///
	/// Simulates the hatched pattern of a halftone screen.
	///
	/// **Links**
	///
	/// [CIHatchedScreen Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHatchedScreen)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHatchedScreen/)
	///
	@objc(CIFilterFactory_CIHatchedScreen) class CIHatchedScreen: Core {
		@objc public init?() {
			super.init(name: "CIHatchedScreen")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the hatched screen pattern
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle of the pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The distance between lines in the pattern.
		///
		///   minValue: 1.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The amount of sharpening to apply.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputSharpness_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Height Field From Mask
	///
	/// Produces a continuous three-dimensional, loft-shaped height field from a grayscale mask. The white values of the mask define those pixels that are inside the height field while the black values define those pixels that are outside. The field varies smoothly and continuously inside the mask, reaching the value 0 at the edge of the mask. You can use this filter with the Shaded Material filter to produce extremely realistic shaded objects.
	///
	/// **Links**
	///
	/// [CIHeightFieldFromMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHeightFieldFromMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHeightFieldFromMask/)
	///
	@objc(CIFilterFactory_CIHeightFieldFromMask) class CIHeightFieldFromMask: Core {
		@objc public init?() {
			super.init(name: "CIHeightFieldFromMask")
			self.filter.setDefaults()
		}

		///
		/// The white values of the mask define those pixels that are inside the height field while the black values define those pixels that are outside. The field varies smoothly and continuously inside the mask, reaching the value 0 at the edge of the mask.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The distance from the edge of the mask for the smooth transition is proportional to the input radius. Larger values make the transition smoother and more pronounced. Smaller values make the transition approximate a fillet radius.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Hexagonal Pixelate
	///
	/// Displays an image as colored hexagons whose color is an average of the pixels they replace.
	///
	/// **Links**
	///
	/// [CIHexagonalPixellate Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHexagonalPixellate)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHexagonalPixellate/)
	///
	@objc(CIFilterFactory_CIHexagonalPixellate) class CIHexagonalPixellate: Core {
		@objc public init?() {
			super.init(name: "CIHexagonalPixellate")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The scale determines the size of the hexagons. Larger values result in larger hexagons.
		///
		///   minValue: 1.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}
	}
}

@available(macOS 10.7, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Highlight and Shadow Adjust
	///
	/// Adjust the tonal mapping of an image while preserving spatial detail
	///
	/// **Links**
	///
	/// [CIHighlightShadowAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHighlightShadowAdjust)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHighlightShadowAdjust/)
	///
	@objc(CIFilterFactory_CIHighlightShadowAdjust) class CIHighlightShadowAdjust: Core {
		@objc public init?() {
			super.init(name: "CIHighlightShadowAdjust")
			self.filter.setDefaults()
		}

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

		///
		/// Shadow Highlight Radius
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The amount of adjustment to the shadows of the image.
		///
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		let inputShadowAmount_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public var inputShadowAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputShadowAmount_Range), forKey: "inputShadowAmount")
			}
		}

		///
		/// The amount of adjustment to the highlights of the image.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputHighlightAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputHighlightAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHighlightAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputHighlightAmount_Range), forKey: "inputHighlightAmount")
			}
		}
	}
}

@available(iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Histogram Display
	///
	/// Generates a displayable histogram image from the output of the “Area Histogram” filter.
	///
	/// **Links**
	///
	/// [CIHistogramDisplayFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHistogramDisplayFilter)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHistogramDisplayFilter/)
	///
	@objc(CIFilterFactory_CIHistogramDisplayFilter) class CIHistogramDisplayFilter: Core {
		@objc public init?() {
			super.init(name: "CIHistogramDisplayFilter")
			self.filter.setDefaults()
		}

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

		///
		/// The height of the displayable histogram image.
		///
		///   minValue: 1.0
		///   maxValue: 200.0
		///
		let inputHeight_Range: ClosedRange<Float> = 1.0 ... 200.0
		@objc public var inputHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputHeight_Range), forKey: "inputHeight")
			}
		}

		///
		/// The fraction of the right portion of the histogram image to make lighter.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputHighLimit_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputHighLimit: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHighLimit") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputHighLimit_Range), forKey: "inputHighLimit")
			}
		}

		///
		/// The fraction of the left portion of the histogram image to make darker
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputLowLimit_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputLowLimit: NSNumber? {
			get {
				return self.filter.value(forKey: "inputLowLimit") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputLowLimit_Range), forKey: "inputLowLimit")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Hole Distortion
	///
	/// Creates a circular area that pushes the image pixels outward, distorting those pixels closest to the circle the most.
	///
	/// **Links**
	///
	/// [CIHoleDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHoleDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHoleDistortion/)
	///
	@objc(CIFilterFactory_CIHoleDistortion) class CIHoleDistortion: Core {
		@objc public init?() {
			super.init(name: "CIHoleDistortion")
			self.filter.setDefaults()
		}

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

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Hue Adjust
	///
	/// Changes the overall hue, or tint, of the source pixels.
	///
	/// **Links**
	///
	/// [CIHueAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueAdjust)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHueAdjust/)
	///
	@objc(CIFilterFactory_CIHueAdjust) class CIHueAdjust: Core {
		@objc public init?() {
			super.init(name: "CIHueAdjust")
			self.filter.setDefaults()
		}

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

		///
		/// An angle (in radians) to use to correct the hue of an image.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Hue Blend Mode
	///
	/// Uses the luminance and saturation values of the background with the hue of the source image.
	///
	/// **Links**
	///
	/// [CIHueBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHueBlendMode/)
	///
	@objc(CIFilterFactory_CIHueBlendMode) class CIHueBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIHueBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.12, iOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// Hue/Saturation/Value Gradient
	///
	/// Generates a color wheel that shows hues and saturations for a specified value.
	///
	/// **Links**
	///
	/// [CIHueSaturationValueGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueSaturationValueGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIHueSaturationValueGradient/)
	///
	@objc(CIFilterFactory_CIHueSaturationValueGradient) class CIHueSaturationValueGradient: Core {
		@objc public init?() {
			super.init(name: "CIHueSaturationValueGradient")
			self.filter.setDefaults()
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputValue_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputValue: NSNumber? {
			get {
				return self.filter.value(forKey: "inputValue") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputValue_Range), forKey: "inputValue")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputSoftness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSoftness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSoftness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSoftness_Range), forKey: "inputSoftness")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputDither_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputDither: NSNumber? {
			get {
				return self.filter.value(forKey: "inputDither") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputDither_Range), forKey: "inputDither")
			}
		}

		///
		/// The CGColorSpaceRef that the color wheel should be generated in.
		///
		@objc public var inputColorSpace: NSObject? {
			get {
				return self.filter.value(forKey: "inputColorSpace") as? NSObject
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColorSpace")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Kaleidoscope
	///
	/// Produces a kaleidoscopic image from a source image by applying 12-way symmetry.
	///
	/// **Links**
	///
	/// [CIKaleidoscope Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKaleidoscope)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIKaleidoscope/)
	///
	@objc(CIFilterFactory_CIKaleidoscope) class CIKaleidoscope: Core {
		@objc public init?() {
			super.init(name: "CIKaleidoscope")
			self.filter.setDefaults()
		}

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

		///
		/// The number of reflections in the pattern.
		///
		///   minValue: 1.0
		///
		let inputCount_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputCount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCount_Range), forKey: "inputCount")
			}
		}

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle of reflection.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Combined Keystone Correction
	///
	/// Apply keystone correction to an image with combined horizontal and vertical guides
	///
	/// **Links**
	///
	/// [CIKeystoneCorrectionCombined Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKeystoneCorrectionCombined)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIKeystoneCorrectionCombined/)
	///
	@objc(CIFilterFactory_CIKeystoneCorrectionCombined) class CIKeystoneCorrectionCombined: Core {
		@objc public init?() {
			super.init(name: "CIKeystoneCorrectionCombined")
			self.filter.setDefaults()
		}

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

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Horizontal Keystone Correction
	///
	/// Apply horizontal keystone correction to an image with guides
	///
	/// **Links**
	///
	/// [CIKeystoneCorrectionHorizontal Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKeystoneCorrectionHorizontal)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIKeystoneCorrectionHorizontal/)
	///
	@objc(CIFilterFactory_CIKeystoneCorrectionHorizontal) class CIKeystoneCorrectionHorizontal: Core {
		@objc public init?() {
			super.init(name: "CIKeystoneCorrectionHorizontal")
			self.filter.setDefaults()
		}

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
	@objc(CIFilterFactory_CIKeystoneCorrectionVertical) class CIKeystoneCorrectionVertical: Core {
		@objc public init?() {
			super.init(name: "CIKeystoneCorrectionVertical")
			self.filter.setDefaults()
		}

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

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// KMeans
	///
	/// Create a palette of the most common colors found in the image.
	///
	/// **Links**
	///
	/// [CIKMeans Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKMeans)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIKMeans/)
	///
	@objc(CIFilterFactory_CIKMeans) class CIKMeans: Core {
		@objc public init?() {
			super.init(name: "CIKMeans")
			self.filter.setDefaults()
		}

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

		///
		/// Specifies the color seeds to use for k-means clustering, either passed as an image or an array of colors.
		///
		@objc public var inputMeans: CIImage? {
			get {
				return self.filter.value(forKey: "inputMeans") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMeans")
			}
		}

		///
		/// Specifies how many k-means color clusters should be used.
		///
		///   minValue: 0.0
		///   maxValue: 128.0
		///
		let inputCount_Range: ClosedRange<Float> = 0.0 ... 128.0
		@objc public var inputCount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCount_Range), forKey: "inputCount")
			}
		}

		///
		/// Specifies how many k-means passes should be performed.
		///
		///   minValue: 0.0
		///   maxValue: 20.0
		///
		let inputPasses_Range: ClosedRange<Float> = 0.0 ... 20.0
		@objc public var inputPasses: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPasses") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputPasses_Range), forKey: "inputPasses")
			}
		}

		///
		/// Specifies whether the k-means color palette should be computed in a perceptual color space.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputPerceptual_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputPerceptual: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPerceptual") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputPerceptual_Range), forKey: "inputPerceptual")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Lab ∆E
	///
	/// Produces an image with the Lab ∆E difference values between two images. The result image will contain ∆E 1994 values between 0.0 and 100.0 where 2.0 is considered a just noticeable difference.
	///
	/// **Links**
	///
	/// [CILabDeltaE Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILabDeltaE)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILabDeltaE/)
	///
	@objc(CIFilterFactory_CILabDeltaE) class CILabDeltaE: Core {
		@objc public init?() {
			super.init(name: "CILabDeltaE")
			self.filter.setDefaults()
		}

		///
		/// The first input image for comparison.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The second input image for comparison.
		///
		@objc public var inputImage2: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage2") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage2")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Lanczos Scale Transform
	///
	/// Produces a high-quality, scaled version of a source image. You typically use this filter to scale down an image.
	///
	/// **Links**
	///
	/// [CILanczosScaleTransform Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILanczosScaleTransform)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILanczosScaleTransform/)
	///
	@objc(CIFilterFactory_CILanczosScaleTransform) class CILanczosScaleTransform: Core {
		@objc public init?() {
			super.init(name: "CILanczosScaleTransform")
			self.filter.setDefaults()
		}

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

		///
		/// The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image.
		///
		///   minValue: 0.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}

		///
		/// The additional horizontal scaling factor to use on the image.
		///
		///   minValue: 0.0
		///
		let inputAspectRatio_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputAspectRatio: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAspectRatio") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputAspectRatio_Range), forKey: "inputAspectRatio")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Lenticular Halo
	///
	/// Simulates a halo that is generated by the diffraction associated with the spread of a lens. This filter is typically applied to another image to simulate lens flares and similar effects.
	///
	/// **Links**
	///
	/// [CILenticularHaloGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILenticularHaloGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILenticularHaloGenerator/)
	///
	@objc(CIFilterFactory_CILenticularHaloGenerator) class CILenticularHaloGenerator: Core {
		@objc public init?() {
			super.init(name: "CILenticularHaloGenerator")
			self.filter.setDefaults()
		}

		///
		/// The x and y position to use as the center of the halo.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// A color.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// The radius of the halo.
		///
		///   minValue: 0.0
		///
		let inputHaloRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputHaloRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHaloRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputHaloRadius_Range), forKey: "inputHaloRadius")
			}
		}

		///
		/// The width of the halo, from its inner radius to its outer radius.
		///
		///   minValue: 0.0
		///
		let inputHaloWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputHaloWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHaloWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputHaloWidth_Range), forKey: "inputHaloWidth")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputHaloOverlap_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputHaloOverlap: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHaloOverlap") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputHaloOverlap_Range), forKey: "inputHaloOverlap")
			}
		}

		///
		/// The intensity of the halo colors. Larger values are more intense.
		///
		///   minValue: 0.0
		///
		let inputStriationStrength_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputStriationStrength: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationStrength") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputStriationStrength_Range), forKey: "inputStriationStrength")
			}
		}

		///
		/// The contrast of the halo colors. Larger values are higher contrast.
		///
		///   minValue: 0.0
		///
		let inputStriationContrast_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputStriationContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputStriationContrast_Range), forKey: "inputStriationContrast")
			}
		}

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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Lighten Blend Mode
	///
	/// Creates composite image samples by choosing the lighter samples (either from the source image or the background). The result is that the background image samples are replaced by any source image samples that are lighter. Otherwise, the background image samples are left unchanged.
	///
	/// **Links**
	///
	/// [CILightenBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILightenBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILightenBlendMode/)
	///
	@objc(CIFilterFactory_CILightenBlendMode) class CILightenBlendMode: Core {
		@objc public init?() {
			super.init(name: "CILightenBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.10, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Light Tunnel Distortion
	///
	/// Light tunnel distortion.
	///
	/// **Links**
	///
	/// [CILightTunnel Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILightTunnel)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILightTunnel/)
	///
	@objc(CIFilterFactory_CILightTunnel) class CILightTunnel: Core {
		@objc public init?() {
			super.init(name: "CILightTunnel")
			self.filter.setDefaults()
		}

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

		///
		/// Center of the light tunnel.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// Rotation angle of the light tunnel.
		///
		@objc public var inputRotation: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRotation") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRotation")
			}
		}

		///
		/// Center radius of the light tunnel.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Linear Burn Blend Mode
	///
	/// Inverts the unpremultiplied source and background image sample color, inverts the sum, and then blends the result with the background according to the PDF basic compositing formula. Source image values that are white produce no change. Source image values that are black invert the background color values.
	///
	/// **Links**
	///
	/// [CILinearBurnBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearBurnBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILinearBurnBlendMode/)
	///
	@objc(CIFilterFactory_CILinearBurnBlendMode) class CILinearBurnBlendMode: Core {
		@objc public init?() {
			super.init(name: "CILinearBurnBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Linear Dodge Blend Mode
	///
	/// Unpremultiplies the source and background image sample colors, adds them, and then blends the result with the background according to the PDF basic compositing formula. Source image values that are black produces output that is the same as the background. Source image values that are non-black brighten the background color values.
	///
	/// **Links**
	///
	/// [CILinearDodgeBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearDodgeBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILinearDodgeBlendMode/)
	///
	@objc(CIFilterFactory_CILinearDodgeBlendMode) class CILinearDodgeBlendMode: Core {
		@objc public init?() {
			super.init(name: "CILinearDodgeBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Linear Gradient
	///
	/// Generates a gradient that varies along a linear axis between two defined endpoints.
	///
	/// **Links**
	///
	/// [CILinearGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILinearGradient/)
	///
	@objc(CIFilterFactory_CILinearGradient) class CILinearGradient: Core {
		@objc public init?() {
			super.init(name: "CILinearGradient")
			self.filter.setDefaults()
		}

		///
		/// The starting position of the gradient -- where the first color begins.
		///
		@objc public var inputPoint0: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint0") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint0")
			}
		}

		///
		/// The ending position of the gradient -- where the second color begins.
		///
		@objc public var inputPoint1: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint1") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint1")
			}
		}

		///
		/// The first color to use in the gradient.
		///
		@objc public var inputColor0: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor0")
			}
		}

		///
		/// The second color to use in the gradient.
		///
		@objc public var inputColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}
	}
}

@available(macOS 10.10, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Linear to sRGB Tone Curve
	///
	/// Converts an image in linear space to sRGB space.
	///
	/// **Links**
	///
	/// [CILinearToSRGBToneCurve Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearToSRGBToneCurve)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILinearToSRGBToneCurve/)
	///
	@objc(CIFilterFactory_CILinearToSRGBToneCurve) class CILinearToSRGBToneCurve: Core {
		@objc public init?() {
			super.init(name: "CILinearToSRGBToneCurve")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Line Overlay
	///
	/// Creates a sketch that outlines the edges of an image in black, leaving the non-outlined portions of the image transparent. The result has alpha and is rendered in black, so it won’t look like much until you render it over another image using source over compositing.
	///
	/// **Links**
	///
	/// [CILineOverlay Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILineOverlay)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILineOverlay/)
	///
	@objc(CIFilterFactory_CILineOverlay) class CILineOverlay: Core {
		@objc public init?() {
			super.init(name: "CILineOverlay")
			self.filter.setDefaults()
		}

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

		///
		/// The noise level of the image (used with camera data) that gets removed before tracing the edges of the image. Increasing the noise level helps to clean up the traced edges of the image.
		///
		///   minValue: 0.0
		///
		let inputNRNoiseLevel_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputNRNoiseLevel: NSNumber? {
			get {
				return self.filter.value(forKey: "inputNRNoiseLevel") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputNRNoiseLevel_Range), forKey: "inputNRNoiseLevel")
			}
		}

		///
		/// The amount of sharpening done when removing noise in the image before tracing the edges of the image. This improves the edge acquisition.
		///
		///   minValue: 0.0
		///
		let inputNRSharpness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputNRSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputNRSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputNRSharpness_Range), forKey: "inputNRSharpness")
			}
		}

		///
		/// The accentuation factor of the Sobel gradient information when tracing the edges of the image. Higher values find more edges, although typically a low value (such as 1.0) is used.
		///
		///   minValue: 0.0
		///
		let inputEdgeIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputEdgeIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputEdgeIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputEdgeIntensity_Range), forKey: "inputEdgeIntensity")
			}
		}

		///
		/// This value determines edge visibility. Larger values thin out the edges.
		///
		///   minValue: 0.0
		///
		let inputThreshold_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputThreshold: NSNumber? {
			get {
				return self.filter.value(forKey: "inputThreshold") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputThreshold_Range), forKey: "inputThreshold")
			}
		}

		///
		/// The amount of anti-aliasing to use on the edges produced by this filter. Higher values produce higher contrast edges (they are less anti-aliased).
		///
		///   minValue: 0.25
		///
		let inputContrast_Range: PartialRangeFrom<Float> = Float(0.25)...
		@objc public var inputContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputContrast_Range), forKey: "inputContrast")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Line Screen
	///
	/// Simulates the line pattern of a halftone screen.
	///
	/// **Links**
	///
	/// [CILineScreen Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILineScreen)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILineScreen/)
	///
	@objc(CIFilterFactory_CILineScreen) class CILineScreen: Core {
		@objc public init?() {
			super.init(name: "CILineScreen")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the line screen pattern
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle of the pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The distance between lines in the pattern.
		///
		///   minValue: 1.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The sharpness of the pattern. The larger the value, the sharper the pattern.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputSharpness_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Luminosity Blend Mode
	///
	/// Uses the hue and saturation of the background with the luminance of the source image. This mode creates an effect that is inverse to the effect created by the “Color Blend Mode” filter.
	///
	/// **Links**
	///
	/// [CILuminosityBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILuminosityBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CILuminosityBlendMode/)
	///
	@objc(CIFilterFactory_CILuminosityBlendMode) class CILuminosityBlendMode: Core {
		@objc public init?() {
			super.init(name: "CILuminosityBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Masked Variable Blur
	///
	/// Blurs an image according to the brightness levels in a mask image.
	///
	/// **Links**
	///
	/// [CIMaskedVariableBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaskedVariableBlur)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMaskedVariableBlur/)
	///
	@objc(CIFilterFactory_CIMaskedVariableBlur) class CIMaskedVariableBlur: Core {
		@objc public init?() {
			super.init(name: "CIMaskedVariableBlur")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputMask: CIImage? {
			get {
				return self.filter.value(forKey: "inputMask") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMask")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Mask to Alpha
	///
	/// Converts a grayscale image to a white image that is masked by alpha. The white values from the source image produce the inside of the mask; the black values become completely transparent.
	///
	/// **Links**
	///
	/// [CIMaskToAlpha Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaskToAlpha)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMaskToAlpha/)
	///
	@objc(CIFilterFactory_CIMaskToAlpha) class CIMaskToAlpha: Core {
		@objc public init?() {
			super.init(name: "CIMaskToAlpha")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Maximum Component
	///
	/// Converts an image to grayscale using the maximum of the three color components.
	///
	/// **Links**
	///
	/// [CIMaximumComponent Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaximumComponent)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMaximumComponent/)
	///
	@objc(CIFilterFactory_CIMaximumComponent) class CIMaximumComponent: Core {
		@objc public init?() {
			super.init(name: "CIMaximumComponent")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Maximum
	///
	/// Computes the maximum value, by color component, of two input images and creates an output image using the maximum values. This is similar to dodging.
	///
	/// **Links**
	///
	/// [CIMaximumCompositing Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaximumCompositing)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMaximumCompositing/)
	///
	@objc(CIFilterFactory_CIMaximumCompositing) class CIMaximumCompositing: Core {
		@objc public init?() {
			super.init(name: "CIMaximumCompositing")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Median
	///
	/// Computes the median value for a group of neighboring pixels and replaces each pixel value with the median. The effect is to reduce noise.
	///
	/// **Links**
	///
	/// [CIMedianFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMedianFilter)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMedianFilter/)
	///
	@objc(CIFilterFactory_CIMedianFilter) class CIMedianFilter: Core {
		@objc public init?() {
			super.init(name: "CIMedianFilter")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.14, iOS 12, *)
@objc public extension CIFilterFactory {
	///
	/// Mesh Generator
	///
	/// Generates a mesh from an array of line segments.
	///
	/// **Links**
	///
	/// [CIMeshGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMeshGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMeshGenerator/)
	///
	@objc(CIFilterFactory_CIMeshGenerator) class CIMeshGenerator: Core {
		@objc public init?() {
			super.init(name: "CIMeshGenerator")
			self.filter.setDefaults()
		}

		///
		/// The width of the effect.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// A color.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// An array of line segments stored as an array of CIVectors each containing a start point and end point.
		///
		@objc public var inputMesh: NSArray? {
			get {
				return self.filter.value(forKey: "inputMesh") as? NSArray
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMesh")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Minimum Component
	///
	/// Converts an image to grayscale using the minimum of the three color components.
	///
	/// **Links**
	///
	/// [CIMinimumComponent Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMinimumComponent)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMinimumComponent/)
	///
	@objc(CIFilterFactory_CIMinimumComponent) class CIMinimumComponent: Core {
		@objc public init?() {
			super.init(name: "CIMinimumComponent")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Minimum
	///
	/// Computes the minimum value, by color component, of two input images and creates an output image using the minimum values. This is similar to burning.
	///
	/// **Links**
	///
	/// [CIMinimumCompositing Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMinimumCompositing)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMinimumCompositing/)
	///
	@objc(CIFilterFactory_CIMinimumCompositing) class CIMinimumCompositing: Core {
		@objc public init?() {
			super.init(name: "CIMinimumCompositing")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.14, iOS 12, *)
@objc public extension CIFilterFactory {
	///
	/// Mix
	///
	/// Uses an amount parameter to interpolate between an image and a background image. When value is 0.0 or less, the result is the background image. When the value is 1.0 or more, the result is the image.
	///
	/// **Links**
	///
	/// [CIMix Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMix)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMix/)
	///
	@objc(CIFilterFactory_CIMix) class CIMix: Core {
		@objc public init?() {
			super.init(name: "CIMix")
			self.filter.setDefaults()
		}

		///
		/// The image to use as a foreground image.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}

		///
		/// The amount of the effect.
		///
		@objc public var inputAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAmount")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Mod
	///
	/// Transitions from one image to another by revealing the target image through irregularly shaped holes.
	///
	/// **Links**
	///
	/// [CIModTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIModTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIModTransition/)
	///
	@objc(CIFilterFactory_CIModTransition) class CIModTransition: Core {
		@objc public init?() {
			super.init(name: "CIModTransition")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The angle of the mod hole pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The radius of the undistorted holes in the pattern.
		///
		///   minValue: 1.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The amount of stretching applied to the mod hole pattern. Holes in the center are not distorted as much as those at the edge of the image.
		///
		///   minValue: 1.0
		///
		let inputCompression_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputCompression: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCompression") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCompression_Range), forKey: "inputCompression")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Morphology Gradient
	///
	/// Finds the edges of an image by returning the difference between the morphological minimum and maximum operations to the image.
	///
	/// **Links**
	///
	/// [CIMorphologyGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMorphologyGradient/)
	///
	@objc(CIFilterFactory_CIMorphologyGradient) class CIMorphologyGradient: Core {
		@objc public init?() {
			super.init(name: "CIMorphologyGradient")
			self.filter.setDefaults()
		}

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

		///
		/// The desired radius of the circular morphological operation to the image.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Morphology Maximum
	///
	/// Lightens areas of an image by applying a circular morphological maximum operation to the image.
	///
	/// **Links**
	///
	/// [CIMorphologyMaximum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyMaximum)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMorphologyMaximum/)
	///
	@objc(CIFilterFactory_CIMorphologyMaximum) class CIMorphologyMaximum: Core {
		@objc public init?() {
			super.init(name: "CIMorphologyMaximum")
			self.filter.setDefaults()
		}

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

		///
		/// The desired radius of the circular morphological operation to the image.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Morphology Minimum
	///
	/// Darkens areas of an image by applying a circular morphological maximum operation to the image.
	///
	/// **Links**
	///
	/// [CIMorphologyMinimum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyMinimum)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMorphologyMinimum/)
	///
	@objc(CIFilterFactory_CIMorphologyMinimum) class CIMorphologyMinimum: Core {
		@objc public init?() {
			super.init(name: "CIMorphologyMinimum")
			self.filter.setDefaults()
		}

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

		///
		/// The desired radius of the circular morphological operation to the image.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Morphology Rectangle Maximum
	///
	/// Lightens areas of an image by applying a rectangular morphological maximum operation to the image.
	///
	/// **Links**
	///
	/// [CIMorphologyRectangleMaximum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyRectangleMaximum)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMorphologyRectangleMaximum/)
	///
	@objc(CIFilterFactory_CIMorphologyRectangleMaximum) class CIMorphologyRectangleMaximum: Core {
		@objc public init?() {
			super.init(name: "CIMorphologyRectangleMaximum")
			self.filter.setDefaults()
		}

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

		///
		/// The width in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///
		///   minValue: 1.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The height in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///
		///   minValue: 1.0
		///
		let inputHeight_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputHeight_Range), forKey: "inputHeight")
			}
		}
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Morphology Rectangle Minimum
	///
	/// Darkens areas of an image by applying a rectangular morphological maximum operation to the image.
	///
	/// **Links**
	///
	/// [CIMorphologyRectangleMinimum Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyRectangleMinimum)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMorphologyRectangleMinimum/)
	///
	@objc(CIFilterFactory_CIMorphologyRectangleMinimum) class CIMorphologyRectangleMinimum: Core {
		@objc public init?() {
			super.init(name: "CIMorphologyRectangleMinimum")
			self.filter.setDefaults()
		}

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

		///
		/// The width in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///
		///   minValue: 1.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The height in pixels of the morphological operation. The value will be rounded to the nearest odd integer.
		///
		///   minValue: 1.0
		///
		let inputHeight_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputHeight_Range), forKey: "inputHeight")
			}
		}
	}
}

@available(macOS 10.4, iOS 8.3, *)
@objc public extension CIFilterFactory {
	///
	/// Motion Blur
	///
	/// Blurs an image to simulate the effect of using a camera that moves a specified angle and distance while capturing the image.
	///
	/// **Links**
	///
	/// [CIMotionBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMotionBlur)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMotionBlur/)
	///
	@objc(CIFilterFactory_CIMotionBlur) class CIMotionBlur: Core {
		@objc public init?() {
			super.init(name: "CIMotionBlur")
			self.filter.setDefaults()
		}

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

		///
		/// The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The angle of the motion determines which direction the blur smears.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Multiply Blend Mode
	///
	/// Multiplies the source image samples with the background image samples. This results in colors that are at least as dark as either of the two contributing sample colors.
	///
	/// **Links**
	///
	/// [CIMultiplyBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMultiplyBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMultiplyBlendMode/)
	///
	@objc(CIFilterFactory_CIMultiplyBlendMode) class CIMultiplyBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIMultiplyBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Multiply
	///
	/// Multiplies the color component of two input images and creates an output image using the multiplied values. This filter is typically used to add a spotlight or similar lighting effect to an image.
	///
	/// **Links**
	///
	/// [CIMultiplyCompositing Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMultiplyCompositing)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIMultiplyCompositing/)
	///
	@objc(CIFilterFactory_CIMultiplyCompositing) class CIMultiplyCompositing: Core {
		@objc public init?() {
			super.init(name: "CIMultiplyCompositing")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.12, iOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// Nine Part Stretched
	///
	/// Distorts an image by stretching an image based on two input breakpoints
	///
	/// **Links**
	///
	/// [CINinePartStretched Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINinePartStretched)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CINinePartStretched/)
	///
	@objc(CIFilterFactory_CINinePartStretched) class CINinePartStretched: Core {
		@objc public init?() {
			super.init(name: "CINinePartStretched")
			self.filter.setDefaults()
		}

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

		///
		/// Lower left corner of image to retain before stretching begins.
		///
		@objc public var inputBreakpoint0: CIVector? {
			get {
				return self.filter.value(forKey: "inputBreakpoint0") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBreakpoint0")
			}
		}

		///
		/// Upper right corner of image to retain after stretching ends.
		///
		@objc public var inputBreakpoint1: CIVector? {
			get {
				return self.filter.value(forKey: "inputBreakpoint1") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBreakpoint1")
			}
		}

		///
		/// No Description
		///
		@objc public var inputGrowAmount: CIVector? {
			get {
				return self.filter.value(forKey: "inputGrowAmount") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputGrowAmount")
			}
		}
	}
}

@available(macOS 10.12, iOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// Nine Part Tiled
	///
	/// Distorts an image by tiling an image based on two input breakpoints
	///
	/// **Links**
	///
	/// [CINinePartTiled Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINinePartTiled)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CINinePartTiled/)
	///
	@objc(CIFilterFactory_CINinePartTiled) class CINinePartTiled: Core {
		@objc public init?() {
			super.init(name: "CINinePartTiled")
			self.filter.setDefaults()
		}

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

		///
		/// Lower left corner of image to retain before tiling begins.
		///
		@objc public var inputBreakpoint0: CIVector? {
			get {
				return self.filter.value(forKey: "inputBreakpoint0") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBreakpoint0")
			}
		}

		///
		/// Upper right corner of image to retain after tiling ends.
		///
		@objc public var inputBreakpoint1: CIVector? {
			get {
				return self.filter.value(forKey: "inputBreakpoint1") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBreakpoint1")
			}
		}

		///
		/// No Description
		///
		@objc public var inputGrowAmount: CIVector? {
			get {
				return self.filter.value(forKey: "inputGrowAmount") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputGrowAmount")
			}
		}

		///
		/// Indicates that Y-Axis flip should occur.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputFlipYTiles_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputFlipYTiles: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFlipYTiles") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputFlipYTiles_Range), forKey: "inputFlipYTiles")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Noise Reduction
	///
	/// Reduces noise using a threshold value to define what is considered noise. Small changes in luminance below that value are considered noise and get a noise reduction treatment, which is a local blur. Changes above the threshold value are considered edges, so they are sharpened.
	///
	/// **Links**
	///
	/// [CINoiseReduction Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINoiseReduction)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CINoiseReduction/)
	///
	@objc(CIFilterFactory_CINoiseReduction) class CINoiseReduction: Core {
		@objc public init?() {
			super.init(name: "CINoiseReduction")
			self.filter.setDefaults()
		}

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

		///
		/// The amount of noise reduction. The larger the value, the more noise reduction.
		///
		///   minValue: 0.0
		///
		let inputNoiseLevel_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputNoiseLevel: NSNumber? {
			get {
				return self.filter.value(forKey: "inputNoiseLevel") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputNoiseLevel_Range), forKey: "inputNoiseLevel")
			}
		}

		///
		/// The sharpness of the final image. The larger the value, the sharper the result.
		///
		///   minValue: 0.0
		///
		let inputSharpness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Op Tile
	///
	/// Segments an image, applying any specified scaling and rotation, and then assembles the image again to give an op art appearance.
	///
	/// **Links**
	///
	/// [CIOpTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIOpTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIOpTile/)
	///
	@objc(CIFilterFactory_CIOpTile) class CIOpTile: Core {
		@objc public init?() {
			super.init(name: "CIOpTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The scale determines the number of tiles in the effect.
		///
		///   minValue: 0.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}

		///
		/// The angle of a tile.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Overlay Blend Mode
	///
	/// Either multiplies or screens the source image samples with the background image samples, depending on the background color. The result is to overlay the existing image samples while preserving the highlights and shadows of the background. The background color mixes with the source image to reflect the lightness or darkness of the background.
	///
	/// **Links**
	///
	/// [CIOverlayBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIOverlayBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIOverlayBlendMode/)
	///
	@objc(CIFilterFactory_CIOverlayBlendMode) class CIOverlayBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIOverlayBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Page Curl
	///
	/// Transitions from one image to another by simulating a curling page, revealing the new image as the page curls.
	///
	/// **Links**
	///
	/// [CIPageCurlTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPageCurlTransition/)
	///
	@objc(CIFilterFactory_CIPageCurlTransition) class CIPageCurlTransition: Core {
		@objc public init?() {
			super.init(name: "CIPageCurlTransition")
			self.filter.setDefaults()
		}

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

		///
		/// The image that appears on the back of the source image, as the page curls to reveal the target image.
		///
		@objc public var inputBacksideImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBacksideImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBacksideImage")
			}
		}

		///
		/// An image that looks like a shaded sphere enclosed in a square image.
		///
		@objc public var inputShadingImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputShadingImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputShadingImage")
			}
		}

		///
		/// The extent of the effect.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The angle of the curling page.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The radius of the curl.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.9, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Page Curl With Shadow
	///
	/// Transitions from one image to another by simulating a curling page, revealing the new image as the page curls.
	///
	/// **Links**
	///
	/// [CIPageCurlWithShadowTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlWithShadowTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPageCurlWithShadowTransition/)
	///
	@objc(CIFilterFactory_CIPageCurlWithShadowTransition) class CIPageCurlWithShadowTransition: Core {
		@objc public init?() {
			super.init(name: "CIPageCurlWithShadowTransition")
			self.filter.setDefaults()
		}

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

		///
		/// The image that appears on the back of the source image, as the page curls to reveal the target image.
		///
		@objc public var inputBacksideImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBacksideImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBacksideImage")
			}
		}

		///
		/// The extent of the effect.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The angle of the curling page.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The radius of the curl.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}

		///
		/// The maximum size in pixels of the shadow.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputShadowSize_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputShadowSize: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowSize") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputShadowSize_Range), forKey: "inputShadowSize")
			}
		}

		///
		/// The strength of the shadow.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputShadowAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputShadowAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputShadowAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputShadowAmount_Range), forKey: "inputShadowAmount")
			}
		}

		///
		/// The rectagular portion of input image that will cast a shadow.
		///
		@objc public var inputShadowExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputShadowExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputShadowExtent")
			}
		}
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Palette Centroid
	///
	/// Calculate the mean (x,y) image coordinates of a color palette.
	///
	/// **Links**
	///
	/// [CIPaletteCentroid Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPaletteCentroid)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPaletteCentroid/)
	///
	@objc(CIFilterFactory_CIPaletteCentroid) class CIPaletteCentroid: Core {
		@objc public init?() {
			super.init(name: "CIPaletteCentroid")
			self.filter.setDefaults()
		}

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

		///
		/// The input color palette, obtained using “CIKMeans“ filter.
		///
		@objc public var inputPaletteImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputPaletteImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPaletteImage")
			}
		}

		///
		/// Specifies whether the color palette should be applied in a perceptual color space.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputPerceptual_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputPerceptual: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPerceptual") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputPerceptual_Range), forKey: "inputPerceptual")
			}
		}
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Palettize
	///
	/// Paint an image from a color palette obtained using “CIKMeans“.
	///
	/// **Links**
	///
	/// [CIPalettize Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPalettize)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPalettize/)
	///
	@objc(CIFilterFactory_CIPalettize) class CIPalettize: Core {
		@objc public init?() {
			super.init(name: "CIPalettize")
			self.filter.setDefaults()
		}

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

		///
		/// The input color palette, obtained using “CIKMeans“ filter.
		///
		@objc public var inputPaletteImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputPaletteImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPaletteImage")
			}
		}

		///
		/// Specifies whether the color palette should be applied in a perceptual color space.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputPerceptual_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputPerceptual: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPerceptual") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputPerceptual_Range), forKey: "inputPerceptual")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Parallelogram Tile
	///
	/// Warps an image by reflecting it in a parallelogram, and then tiles the result.
	///
	/// **Links**
	///
	/// [CIParallelogramTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIParallelogramTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIParallelogramTile/)
	///
	@objc(CIFilterFactory_CIParallelogramTile) class CIParallelogramTile: Core {
		@objc public init?() {
			super.init(name: "CIParallelogramTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The primary angle for the repeating parallelogram tile. Small values create thin diamond tiles, and higher values create fatter parallelogram tiles.
		///
		@objc public var inputAcuteAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAcuteAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAcuteAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}
	}
}

@available(macOS 10.11, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// PDF417 Barcode Generator
	///
	/// Generate a PDF417 barcode image for message data.
	///
	/// **Links**
	///
	/// [CIPDF417BarcodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPDF417BarcodeGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPDF417BarcodeGenerator/)
	///
	@objc(CIFilterFactory_CIPDF417BarcodeGenerator) class CIPDF417BarcodeGenerator: Core {
		@objc public init?() {
			super.init(name: "CIPDF417BarcodeGenerator")
			self.filter.setDefaults()
		}

		///
		/// The message to encode in the PDF417 Barcode
		///
		@objc public var inputMessage: NSData? {
			get {
				return self.filter.value(forKey: "inputMessage") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMessage")
			}
		}

		///
		/// The minimum width of the generated barcode in pixels.
		///
		///   minValue: 56.0
		///   maxValue: 583.0
		///
		let inputMinWidth_Range: ClosedRange<Float> = 56.0 ... 583.0
		@objc public var inputMinWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMinWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputMinWidth_Range), forKey: "inputMinWidth")
			}
		}

		///
		/// The maximum width of the generated barcode in pixels.
		///
		///   minValue: 56.0
		///   maxValue: 583.0
		///
		let inputMaxWidth_Range: ClosedRange<Float> = 56.0 ... 583.0
		@objc public var inputMaxWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMaxWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputMaxWidth_Range), forKey: "inputMaxWidth")
			}
		}

		///
		/// The minimum height of the generated barcode in pixels.
		///
		///   minValue: 13.0
		///   maxValue: 283.0
		///
		let inputMinHeight_Range: ClosedRange<Float> = 13.0 ... 283.0
		@objc public var inputMinHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMinHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputMinHeight_Range), forKey: "inputMinHeight")
			}
		}

		///
		/// The maximum height of the generated barcode in pixels.
		///
		///   minValue: 13.0
		///   maxValue: 283.0
		///
		let inputMaxHeight_Range: ClosedRange<Float> = 13.0 ... 283.0
		@objc public var inputMaxHeight: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMaxHeight") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputMaxHeight_Range), forKey: "inputMaxHeight")
			}
		}

		///
		/// The number of data columns in the generated barcode
		///
		///   minValue: 1.0
		///   maxValue: 30.0
		///
		let inputDataColumns_Range: ClosedRange<Float> = 1.0 ... 30.0
		@objc public var inputDataColumns: NSNumber? {
			get {
				return self.filter.value(forKey: "inputDataColumns") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputDataColumns_Range), forKey: "inputDataColumns")
			}
		}

		///
		/// The number of rows in the generated barcode
		///
		///   minValue: 3.0
		///   maxValue: 90.0
		///
		let inputRows_Range: ClosedRange<Float> = 3.0 ... 90.0
		@objc public var inputRows: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRows") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRows_Range), forKey: "inputRows")
			}
		}

		///
		/// The preferred aspect ratio of the generated barcode
		///
		///   minValue: 0.0
		///
		let inputPreferredAspectRatio_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputPreferredAspectRatio: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPreferredAspectRatio") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputPreferredAspectRatio_Range), forKey: "inputPreferredAspectRatio")
			}
		}

		///
		/// The compaction mode of the generated barcode.
		///
		///   minValue: 0.0
		///   maxValue: 3.0
		///
		let inputCompactionMode_Range: ClosedRange<Float> = 0.0 ... 3.0
		@objc public var inputCompactionMode: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCompactionMode") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCompactionMode_Range), forKey: "inputCompactionMode")
			}
		}

		///
		/// Force a compact style Aztec code to @YES or @NO. Set to nil for automatic.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputCompactStyle_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputCompactStyle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCompactStyle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCompactStyle_Range), forKey: "inputCompactStyle")
			}
		}

		///
		/// The correction level ratio of the generated barcode
		///
		///   minValue: 0.0
		///   maxValue: 8.0
		///
		let inputCorrectionLevel_Range: ClosedRange<Float> = 0.0 ... 8.0
		@objc public var inputCorrectionLevel: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCorrectionLevel") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCorrectionLevel_Range), forKey: "inputCorrectionLevel")
			}
		}

		///
		/// Force compaction style to @YES or @NO. Set to nil for automatic.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputAlwaysSpecifyCompaction_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputAlwaysSpecifyCompaction: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAlwaysSpecifyCompaction") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputAlwaysSpecifyCompaction_Range), forKey: "inputAlwaysSpecifyCompaction")
			}
		}
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Perspective Correction
	///
	/// Apply a perspective correction to an image.
	///
	/// **Links**
	///
	/// [CIPerspectiveCorrection Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveCorrection)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPerspectiveCorrection/)
	///
	@objc(CIFilterFactory_CIPerspectiveCorrection) class CIPerspectiveCorrection: Core {
		@objc public init?() {
			super.init(name: "CIPerspectiveCorrection")
			self.filter.setDefaults()
		}

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

		///
		/// The top left coordinate to be perspective corrected.
		///
		@objc public var inputTopLeft: CIVector? {
			get {
				return self.filter.value(forKey: "inputTopLeft") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTopLeft")
			}
		}

		///
		/// The top right coordinate to be perspective corrected.
		///
		@objc public var inputTopRight: CIVector? {
			get {
				return self.filter.value(forKey: "inputTopRight") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTopRight")
			}
		}

		///
		/// The bottom right coordinate to be perspective corrected.
		///
		@objc public var inputBottomRight: CIVector? {
			get {
				return self.filter.value(forKey: "inputBottomRight") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBottomRight")
			}
		}

		///
		/// The bottom left coordinate to be perspective corrected.
		///
		@objc public var inputBottomLeft: CIVector? {
			get {
				return self.filter.value(forKey: "inputBottomLeft") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBottomLeft")
			}
		}

		///
		/// No Description
		///
		@objc public var inputCrop: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCrop") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCrop")
			}
		}
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Perspective Rotate
	///
	/// Apply a homogenous rotation transform to an image.
	///
	/// **Links**
	///
	/// [CIPerspectiveRotate Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveRotate)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPerspectiveRotate/)
	///
	@objc(CIFilterFactory_CIPerspectiveRotate) class CIPerspectiveRotate: Core {
		@objc public init?() {
			super.init(name: "CIPerspectiveRotate")
			self.filter.setDefaults()
		}

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

		///
		/// Pitch angle in radians.
		///
		@objc public var inputPitch: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPitch") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPitch")
			}
		}

		///
		/// Yaw angle in radians.
		///
		@objc public var inputYaw: NSNumber? {
			get {
				return self.filter.value(forKey: "inputYaw") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputYaw")
			}
		}

		///
		/// Roll angle in radians.
		///
		@objc public var inputRoll: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRoll") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRoll")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Perspective Tile
	///
	/// Applies a perspective transform to an image and then tiles the result.
	///
	/// **Links**
	///
	/// [CIPerspectiveTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPerspectiveTile/)
	///
	@objc(CIFilterFactory_CIPerspectiveTile) class CIPerspectiveTile: Core {
		@objc public init?() {
			super.init(name: "CIPerspectiveTile")
			self.filter.setDefaults()
		}

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

		///
		/// The top left coordinate of a tile.
		///
		@objc public var inputTopLeft: CIVector? {
			get {
				return self.filter.value(forKey: "inputTopLeft") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTopLeft")
			}
		}

		///
		/// The top right coordinate of a tile.
		///
		@objc public var inputTopRight: CIVector? {
			get {
				return self.filter.value(forKey: "inputTopRight") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTopRight")
			}
		}

		///
		/// The bottom right coordinate of a tile.
		///
		@objc public var inputBottomRight: CIVector? {
			get {
				return self.filter.value(forKey: "inputBottomRight") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBottomRight")
			}
		}

		///
		/// The bottom left coordinate of a tile.
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

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Perspective Transform
	///
	/// Alters the geometry of an image to simulate the observer changing viewing position. You can use the perspective filter to skew an image.
	///
	/// **Links**
	///
	/// [CIPerspectiveTransform Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTransform)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPerspectiveTransform/)
	///
	@objc(CIFilterFactory_CIPerspectiveTransform) class CIPerspectiveTransform: Core {
		@objc public init?() {
			super.init(name: "CIPerspectiveTransform")
			self.filter.setDefaults()
		}

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

		///
		/// The top left coordinate to map the image to.
		///
		@objc public var inputTopLeft: CIVector? {
			get {
				return self.filter.value(forKey: "inputTopLeft") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTopLeft")
			}
		}

		///
		/// The top right coordinate to map the image to.
		///
		@objc public var inputTopRight: CIVector? {
			get {
				return self.filter.value(forKey: "inputTopRight") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTopRight")
			}
		}

		///
		/// The bottom right coordinate to map the image to.
		///
		@objc public var inputBottomRight: CIVector? {
			get {
				return self.filter.value(forKey: "inputBottomRight") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBottomRight")
			}
		}

		///
		/// The bottom left coordinate to map the image to.
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
	@objc(CIFilterFactory_CIPerspectiveTransformWithExtent) class CIPerspectiveTransformWithExtent: Core {
		@objc public init?() {
			super.init(name: "CIPerspectiveTransformWithExtent")
			self.filter.setDefaults()
		}

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

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Photo Effect Chrome
	///
	/// Apply a “Chrome” style effect to an image.
	///
	/// **Links**
	///
	/// [CIPhotoEffectChrome Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectChrome)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPhotoEffectChrome/)
	///
	@objc(CIFilterFactory_CIPhotoEffectChrome) class CIPhotoEffectChrome: Core {
		@objc public init?() {
			super.init(name: "CIPhotoEffectChrome")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Photo Effect Fade
	///
	/// Apply a “Fade” style effect to an image
	///
	/// **Links**
	///
	/// [CIPhotoEffectFade Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectFade)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPhotoEffectFade/)
	///
	@objc(CIFilterFactory_CIPhotoEffectFade) class CIPhotoEffectFade: Core {
		@objc public init?() {
			super.init(name: "CIPhotoEffectFade")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Photo Effect Instant
	///
	/// Apply a “Instant” style effect to an image
	///
	/// **Links**
	///
	/// [CIPhotoEffectInstant Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectInstant)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPhotoEffectInstant/)
	///
	@objc(CIFilterFactory_CIPhotoEffectInstant) class CIPhotoEffectInstant: Core {
		@objc public init?() {
			super.init(name: "CIPhotoEffectInstant")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Photo Effect Mono
	///
	/// Apply a “Mono” style effect to an image
	///
	/// **Links**
	///
	/// [CIPhotoEffectMono Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectMono)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPhotoEffectMono/)
	///
	@objc(CIFilterFactory_CIPhotoEffectMono) class CIPhotoEffectMono: Core {
		@objc public init?() {
			super.init(name: "CIPhotoEffectMono")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Photo Effect Noir
	///
	/// Apply a “Noir” style effect to an image
	///
	/// **Links**
	///
	/// [CIPhotoEffectNoir Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectNoir)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPhotoEffectNoir/)
	///
	@objc(CIFilterFactory_CIPhotoEffectNoir) class CIPhotoEffectNoir: Core {
		@objc public init?() {
			super.init(name: "CIPhotoEffectNoir")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Photo Effect Process
	///
	/// Apply a “Process” style effect to an image
	///
	/// **Links**
	///
	/// [CIPhotoEffectProcess Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectProcess)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPhotoEffectProcess/)
	///
	@objc(CIFilterFactory_CIPhotoEffectProcess) class CIPhotoEffectProcess: Core {
		@objc public init?() {
			super.init(name: "CIPhotoEffectProcess")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Photo Effect Tonal
	///
	/// Apply a “Tonal” style effect to an image
	///
	/// **Links**
	///
	/// [CIPhotoEffectTonal Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectTonal)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPhotoEffectTonal/)
	///
	@objc(CIFilterFactory_CIPhotoEffectTonal) class CIPhotoEffectTonal: Core {
		@objc public init?() {
			super.init(name: "CIPhotoEffectTonal")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Photo Effect Transfer
	///
	/// Apply a “Transfer” style effect to an image
	///
	/// **Links**
	///
	/// [CIPhotoEffectTransfer Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectTransfer)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPhotoEffectTransfer/)
	///
	@objc(CIFilterFactory_CIPhotoEffectTransfer) class CIPhotoEffectTransfer: Core {
		@objc public init?() {
			super.init(name: "CIPhotoEffectTransfer")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Pinch Distortion
	///
	/// Creates a rectangular-shaped area that pinches source pixels inward, distorting those pixels closest to the rectangle the most.
	///
	/// **Links**
	///
	/// [CIPinchDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPinchDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPinchDistortion/)
	///
	@objc(CIFilterFactory_CIPinchDistortion) class CIPinchDistortion: Core {
		@objc public init?() {
			super.init(name: "CIPinchDistortion")
			self.filter.setDefaults()
		}

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

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The amount of pinching. A value of 0.0 has no effect. A value of 1.0 is the maximum pinch.
		///
		///   minValue: 0.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Pin Light Blend Mode
	///
	/// Unpremultiplies the source and background image sample color, combines them according to the relative difference, and then blends the result with the background according to the PDF basic compositing formula. Source image values that are brighter than the destination will produce an output that is lighter than the destination. Source image values that are darker than the destination will produce an output that is darker than the destination.
	///
	/// **Links**
	///
	/// [CIPinLightBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPinLightBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPinLightBlendMode/)
	///
	@objc(CIFilterFactory_CIPinLightBlendMode) class CIPinLightBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIPinLightBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Pixelate
	///
	/// Makes an image blocky.
	///
	/// **Links**
	///
	/// [CIPixellate Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPixellate)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPixellate/)
	///
	@objc(CIFilterFactory_CIPixellate) class CIPixellate: Core {
		@objc public init?() {
			super.init(name: "CIPixellate")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The scale determines the size of the squares. Larger values result in larger squares.
		///
		///   minValue: 1.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Pointillize
	///
	/// Renders the source image in a pointillistic style.
	///
	/// **Links**
	///
	/// [CIPointillize Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPointillize)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIPointillize/)
	///
	@objc(CIFilterFactory_CIPointillize) class CIPointillize: Core {
		@objc public init?() {
			super.init(name: "CIPointillize")
			self.filter.setDefaults()
		}

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

		///
		/// The radius of the circles in the resulting pattern.
		///
		///   minValue: 1.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// QR Code Generator
	///
	/// Generate a QR Code image for message data.
	///
	/// **Links**
	///
	/// [CIQRCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIQRCodeGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIQRCodeGenerator/)
	///
	@objc(CIFilterFactory_CIQRCodeGenerator) class CIQRCodeGenerator: Core {
		@objc public init?() {
			super.init(name: "CIQRCodeGenerator")
			self.filter.setDefaults()
		}

		///
		/// The message to encode in the QR Code
		///
		@objc public var inputMessage: NSData? {
			get {
				return self.filter.value(forKey: "inputMessage") as? NSData
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMessage")
			}
		}

		///
		/// QR Code correction level L, M, Q, or H.
		///
		@objc public var inputCorrectionLevel: NSString? {
			get {
				return self.filter.value(forKey: "inputCorrectionLevel") as? NSString
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCorrectionLevel")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Radial Gradient
	///
	/// Generates a gradient that varies radially between two circles having the same center. It is valid for one of the two circles to have a radius of 0.
	///
	/// **Links**
	///
	/// [CIRadialGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRadialGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIRadialGradient/)
	///
	@objc(CIFilterFactory_CIRadialGradient) class CIRadialGradient: Core {
		@objc public init?() {
			super.init(name: "CIRadialGradient")
			self.filter.setDefaults()
		}

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The radius of the starting circle to use in the gradient.
		///
		///   minValue: 0.0
		///
		let inputRadius0_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius0: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius0") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius0_Range), forKey: "inputRadius0")
			}
		}

		///
		/// The radius of the ending circle to use in the gradient.
		///
		///   minValue: 0.0
		///
		let inputRadius1_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius1: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius1") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius1_Range), forKey: "inputRadius1")
			}
		}

		///
		/// The first color to use in the gradient.
		///
		@objc public var inputColor0: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor0")
			}
		}

		///
		/// The second color to use in the gradient.
		///
		@objc public var inputColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Random Generator
	///
	/// Generates an image of infinite extent whose pixel values are made up of four independent, uniformly-distributed random numbers in the 0 to 1 range.
	///
	/// **Links**
	///
	/// [CIRandomGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRandomGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIRandomGenerator/)
	///
	@objc(CIFilterFactory_CIRandomGenerator) class CIRandomGenerator: Core {
		@objc public init?() {
			super.init(name: "CIRandomGenerator")
			self.filter.setDefaults()
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Ripple
	///
	/// Transitions from one image to another by creating a circular wave that expands from the center point, revealing the new image in the wake of the wave.
	///
	/// **Links**
	///
	/// [CIRippleTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRippleTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIRippleTransition/)
	///
	@objc(CIFilterFactory_CIRippleTransition) class CIRippleTransition: Core {
		@objc public init?() {
			super.init(name: "CIRippleTransition")
			self.filter.setDefaults()
		}

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

		///
		/// An image that looks like a shaded sphere enclosed in a square image.
		///
		@objc public var inputShadingImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputShadingImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputShadingImage")
			}
		}

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

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

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The width of the ripple.
		///
		///   minValue: 1.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// A value that determines whether the ripple starts as a bulge (higher value) or a dimple (lower value).
		///
		///   minValue: -50.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(-50.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}
	}
}

@available(macOS 10.15, iOS 13, *)
@objc public extension CIFilterFactory {
	///
	/// Rounded Rectangle Generator
	///
	/// Generates a rounded rectangle image with the specified extent, corner radius, and color.
	///
	/// **Links**
	///
	/// [CIRoundedRectangleGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRoundedRectangleGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIRoundedRectangleGenerator/)
	///
	@objc(CIFilterFactory_CIRoundedRectangleGenerator) class CIRoundedRectangleGenerator: Core {
		@objc public init?() {
			super.init(name: "CIRoundedRectangleGenerator")
			self.filter.setDefaults()
		}

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

		///
		/// The distance from the center of the effect.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// A color.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Row Average
	///
	/// Calculates the average color for each row of the specified area in an image, returning the result in a 1D image.
	///
	/// **Links**
	///
	/// [CIRowAverage Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRowAverage)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIRowAverage/)
	///
	@objc(CIFilterFactory_CIRowAverage) class CIRowAverage: Core {
		@objc public init?() {
			super.init(name: "CIRowAverage")
			self.filter.setDefaults()
		}

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

		///
		/// A rectangle that specifies the subregion of the image that you want to process.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}
	}
}

@available(macOS 10.14, iOS 12, *)
@objc public extension CIFilterFactory {
	///
	/// Saliency Map Filter
	///
	/// Generates output image as a saliency map of the input image.
	///
	/// **Links**
	///
	/// [CISaliencyMapFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISaliencyMapFilter)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISaliencyMapFilter/)
	///
	@objc(CIFilterFactory_CISaliencyMapFilter) class CISaliencyMapFilter: Core {
		@objc public init?() {
			super.init(name: "CISaliencyMapFilter")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.14, iOS 12, *)
@objc public extension CIFilterFactory {
	///
	/// Sample Nearest
	///
	/// Produces an image that forces the image sampling to “nearest” mode instead of the default “linear” mode. This filter can be used to alter the behavior of filters that alter the geometry of an image. The output of this filter should be passed as the input to the geometry filter. For example, passing the output of this filter to CIAffineTransform can be used to produce a pixelated upsampled image.
	///
	/// **Links**
	///
	/// [CISampleNearest Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISampleNearest)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISampleNearest/)
	///
	@objc(CIFilterFactory_CISampleNearest) class CISampleNearest: Core {
		@objc public init?() {
			super.init(name: "CISampleNearest")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Saturation Blend Mode
	///
	/// Uses the luminance and hue values of the background with the saturation of the source image. Areas of the background that have no saturation (that is, pure gray areas) do not produce a change.
	///
	/// **Links**
	///
	/// [CISaturationBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISaturationBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISaturationBlendMode/)
	///
	@objc(CIFilterFactory_CISaturationBlendMode) class CISaturationBlendMode: Core {
		@objc public init?() {
			super.init(name: "CISaturationBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Screen Blend Mode
	///
	/// Multiplies the inverse of the source image samples with the inverse of the background image samples. This results in colors that are at least as light as either of the two contributing sample colors.
	///
	/// **Links**
	///
	/// [CIScreenBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIScreenBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIScreenBlendMode/)
	///
	@objc(CIFilterFactory_CIScreenBlendMode) class CIScreenBlendMode: Core {
		@objc public init?() {
			super.init(name: "CIScreenBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Sepia Tone
	///
	/// Maps the colors of an image to various shades of brown.
	///
	/// **Links**
	///
	/// [CISepiaTone Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISepiaTone)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISepiaTone/)
	///
	@objc(CIFilterFactory_CISepiaTone) class CISepiaTone: Core {
		@objc public init?() {
			super.init(name: "CISepiaTone")
			self.filter.setDefaults()
		}

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

		///
		/// The intensity of the sepia effect. A value of 1.0 creates a monochrome sepia image. A value of 0.0 has no effect on the image.
		///
		///   minValue: 0.0
		///
		let inputIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputIntensity_Range), forKey: "inputIntensity")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Shaded Material
	///
	/// Produces a shaded image from a height field. The height field is defined to have greater heights with lighter shades, and lesser heights (lower areas) with darker shades. You can combine this filter with the ”Height Field From Mask” filter to produce quick shadings of masks, such as text.
	///
	/// **Links**
	///
	/// [CIShadedMaterial Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIShadedMaterial)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIShadedMaterial/)
	///
	@objc(CIFilterFactory_CIShadedMaterial) class CIShadedMaterial: Core {
		@objc public init?() {
			super.init(name: "CIShadedMaterial")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as the height field. The resulting image has greater heights with lighter shades, and lesser heights (lower areas) with darker shades.
		///
		@objc public var inputShadingImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputShadingImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputShadingImage")
			}
		}

		///
		/// The scale of the effect. The higher the value, the more dramatic the effect.
		///
		///   minValue: 0.0
		///
		let inputScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScale_Range), forKey: "inputScale")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Sharpen Luminance
	///
	/// Increases image detail by sharpening. It operates on the luminance of the image; the chrominance of the pixels remains unaffected.
	///
	/// **Links**
	///
	/// [CISharpenLuminance Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISharpenLuminance)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISharpenLuminance/)
	///
	@objc(CIFilterFactory_CISharpenLuminance) class CISharpenLuminance: Core {
		@objc public init?() {
			super.init(name: "CISharpenLuminance")
			self.filter.setDefaults()
		}

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

		///
		/// The amount of sharpening to apply. Larger values are sharper.
		///
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputSharpness")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Sixfold Reflected Tile
	///
	/// Produces a tiled image from a source image by applying a 6-way reflected symmetry.
	///
	/// **Links**
	///
	/// [CISixfoldReflectedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISixfoldReflectedTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISixfoldReflectedTile/)
	///
	@objc(CIFilterFactory_CISixfoldReflectedTile) class CISixfoldReflectedTile: Core {
		@objc public init?() {
			super.init(name: "CISixfoldReflectedTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Sixfold Rotated Tile
	///
	/// Produces a tiled image from a source image by rotating the source at increments of 60 degrees.
	///
	/// **Links**
	///
	/// [CISixfoldRotatedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISixfoldRotatedTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISixfoldRotatedTile/)
	///
	@objc(CIFilterFactory_CISixfoldRotatedTile) class CISixfoldRotatedTile: Core {
		@objc public init?() {
			super.init(name: "CISixfoldRotatedTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}
	}
}

@available(macOS 10.10, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Smooth Linear Gradient
	///
	/// Generates a gradient that varies along a linear axis between two defined endpoints.
	///
	/// **Links**
	///
	/// [CISmoothLinearGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISmoothLinearGradient)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISmoothLinearGradient/)
	///
	@objc(CIFilterFactory_CISmoothLinearGradient) class CISmoothLinearGradient: Core {
		@objc public init?() {
			super.init(name: "CISmoothLinearGradient")
			self.filter.setDefaults()
		}

		///
		/// The starting position of the gradient -- where the first color begins.
		///
		@objc public var inputPoint0: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint0") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint0")
			}
		}

		///
		/// The ending position of the gradient -- where the second color begins.
		///
		@objc public var inputPoint1: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint1") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint1")
			}
		}

		///
		/// The first color to use in the gradient.
		///
		@objc public var inputColor0: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor0")
			}
		}

		///
		/// The second color to use in the gradient.
		///
		@objc public var inputColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Soft Light Blend Mode
	///
	/// Either darkens or lightens colors, depending on the source image sample color. If the source image sample color is lighter than 50% gray, the background is lightened, similar to dodging. If the source image sample color is darker than 50% gray, the background is darkened, similar to burning. If the source image sample color is equal to 50% gray, the background is not changed. Image samples that are equal to pure black or pure white produce darker or lighter areas, but do not result in pure black or white. The overall effect is similar to what you would achieve by shining a diffuse spotlight on the source image.
	///
	/// **Links**
	///
	/// [CISoftLightBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISoftLightBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISoftLightBlendMode/)
	///
	@objc(CIFilterFactory_CISoftLightBlendMode) class CISoftLightBlendMode: Core {
		@objc public init?() {
			super.init(name: "CISoftLightBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Source Atop
	///
	/// Places the source image over the background image, then uses the luminance of the background image to determine what to show. The composite shows the background image and only those portions of the source image that are over visible parts of the background.
	///
	/// **Links**
	///
	/// [CISourceAtopCompositing Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceAtopCompositing)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISourceAtopCompositing/)
	///
	@objc(CIFilterFactory_CISourceAtopCompositing) class CISourceAtopCompositing: Core {
		@objc public init?() {
			super.init(name: "CISourceAtopCompositing")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Source In
	///
	/// Uses the second image to define what to leave in the source image, effectively cropping the image.
	///
	/// **Links**
	///
	/// [CISourceInCompositing Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceInCompositing)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISourceInCompositing/)
	///
	@objc(CIFilterFactory_CISourceInCompositing) class CISourceInCompositing: Core {
		@objc public init?() {
			super.init(name: "CISourceInCompositing")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Source Out
	///
	/// Uses the second image to define what to take out of the first image.
	///
	/// **Links**
	///
	/// [CISourceOutCompositing Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceOutCompositing)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISourceOutCompositing/)
	///
	@objc(CIFilterFactory_CISourceOutCompositing) class CISourceOutCompositing: Core {
		@objc public init?() {
			super.init(name: "CISourceOutCompositing")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Source Over
	///
	/// Places the second image over the first.
	///
	/// **Links**
	///
	/// [CISourceOverCompositing Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceOverCompositing)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISourceOverCompositing/)
	///
	@objc(CIFilterFactory_CISourceOverCompositing) class CISourceOverCompositing: Core {
		@objc public init?() {
			super.init(name: "CISourceOverCompositing")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.5, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Spot Color
	///
	/// Replaces one or more color ranges with spot colors.
	///
	/// **Links**
	///
	/// [CISpotColor Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotColor)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISpotColor/)
	///
	@objc(CIFilterFactory_CISpotColor) class CISpotColor: Core {
		@objc public init?() {
			super.init(name: "CISpotColor")
			self.filter.setDefaults()
		}

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

		///
		/// The center value of the first color range to replace.
		///
		@objc public var inputCenterColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputCenterColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenterColor1")
			}
		}

		///
		/// A replacement color for the first color range.
		///
		@objc public var inputReplacementColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputReplacementColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputReplacementColor1")
			}
		}

		///
		/// A value that indicates how close the first color must match before it is replaced.
		///
		///   minValue: 0.0
		///
		let inputCloseness1_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputCloseness1: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCloseness1") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCloseness1_Range), forKey: "inputCloseness1")
			}
		}

		///
		/// The contrast of the first replacement color.
		///
		///   minValue: 0.0
		///
		let inputContrast1_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputContrast1: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast1") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputContrast1_Range), forKey: "inputContrast1")
			}
		}

		///
		/// The center value of the second color range to replace.
		///
		@objc public var inputCenterColor2: CIColor? {
			get {
				return self.filter.value(forKey: "inputCenterColor2") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenterColor2")
			}
		}

		///
		/// A replacement color for the second color range.
		///
		@objc public var inputReplacementColor2: CIColor? {
			get {
				return self.filter.value(forKey: "inputReplacementColor2") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputReplacementColor2")
			}
		}

		///
		/// A value that indicates how close the second color must match before it is replaced.
		///
		///   minValue: 0.0
		///
		let inputCloseness2_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputCloseness2: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCloseness2") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCloseness2_Range), forKey: "inputCloseness2")
			}
		}

		///
		/// The contrast of the second replacement color.
		///
		///   minValue: 0.0
		///
		let inputContrast2_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputContrast2: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast2") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputContrast2_Range), forKey: "inputContrast2")
			}
		}

		///
		/// The center value of the third color range to replace.
		///
		@objc public var inputCenterColor3: CIColor? {
			get {
				return self.filter.value(forKey: "inputCenterColor3") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenterColor3")
			}
		}

		///
		/// A replacement color for the third color range.
		///
		@objc public var inputReplacementColor3: CIColor? {
			get {
				return self.filter.value(forKey: "inputReplacementColor3") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputReplacementColor3")
			}
		}

		///
		/// A value that indicates how close the third color must match before it is replaced.
		///
		///   minValue: 0.0
		///
		let inputCloseness3_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputCloseness3: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCloseness3") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCloseness3_Range), forKey: "inputCloseness3")
			}
		}

		///
		/// The contrast of the third replacement color.
		///
		///   minValue: 0.0
		///
		let inputContrast3_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputContrast3: NSNumber? {
			get {
				return self.filter.value(forKey: "inputContrast3") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputContrast3_Range), forKey: "inputContrast3")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Spot Light
	///
	/// Applies a directional spotlight effect to an image.
	///
	/// **Links**
	///
	/// [CISpotLight Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotLight)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISpotLight/)
	///
	@objc(CIFilterFactory_CISpotLight) class CISpotLight: Core {
		@objc public init?() {
			super.init(name: "CISpotLight")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position of the spotlight.
		///
		@objc public var inputLightPosition: CIVector? {
			get {
				return self.filter.value(forKey: "inputLightPosition") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputLightPosition")
			}
		}

		///
		/// The x and y position that the spotlight points at.
		///
		@objc public var inputLightPointsAt: CIVector? {
			get {
				return self.filter.value(forKey: "inputLightPointsAt") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputLightPointsAt")
			}
		}

		///
		/// The brightness of the spotlight.
		///
		///   minValue: 0.0
		///
		let inputBrightness_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputBrightness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputBrightness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputBrightness_Range), forKey: "inputBrightness")
			}
		}

		///
		/// The spotlight size. The smaller the value, the more tightly focused the light beam.
		///
		@objc public var inputConcentration: NSNumber? {
			get {
				return self.filter.value(forKey: "inputConcentration") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputConcentration")
			}
		}

		///
		/// The color of the spotlight.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}
	}
}

@available(macOS 10.10, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// sRGB Tone Curve to Linear
	///
	/// Converts an image in sRGB space to linear space.
	///
	/// **Links**
	///
	/// [CISRGBToneCurveToLinear Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISRGBToneCurveToLinear)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISRGBToneCurveToLinear/)
	///
	@objc(CIFilterFactory_CISRGBToneCurveToLinear) class CISRGBToneCurveToLinear: Core {
		@objc public init?() {
			super.init(name: "CISRGBToneCurveToLinear")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Star Shine
	///
	/// Generates a starburst pattern. The output image is typically used as input to another filter
	///
	/// **Links**
	///
	/// [CIStarShineGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStarShineGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIStarShineGenerator/)
	///
	@objc(CIFilterFactory_CIStarShineGenerator) class CIStarShineGenerator: Core {
		@objc public init?() {
			super.init(name: "CIStarShineGenerator")
			self.filter.setDefaults()
		}

		///
		/// The x and y position to use as the center of the star.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The color to use for the outer shell of the circular star.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// The radius of the star.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The size of the cross pattern.
		///
		///   minValue: 0.0
		///
		let inputCrossScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputCrossScale: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCrossScale") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCrossScale_Range), forKey: "inputCrossScale")
			}
		}

		///
		/// The angle of the cross pattern.
		///
		@objc public var inputCrossAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCrossAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCrossAngle")
			}
		}

		///
		/// The opacity of the cross pattern.
		///
		///   minValue: -8.0
		///
		let inputCrossOpacity_Range: PartialRangeFrom<Float> = Float(-8.0)...
		@objc public var inputCrossOpacity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCrossOpacity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCrossOpacity_Range), forKey: "inputCrossOpacity")
			}
		}

		///
		/// The width of the cross pattern.
		///
		///   minValue: 0.0
		///
		let inputCrossWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputCrossWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCrossWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCrossWidth_Range), forKey: "inputCrossWidth")
			}
		}

		///
		/// The length of the cross spikes.
		///
		///   minValue: -8.0
		///
		let inputEpsilon_Range: PartialRangeFrom<Float> = Float(-8.0)...
		@objc public var inputEpsilon: NSNumber? {
			get {
				return self.filter.value(forKey: "inputEpsilon") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputEpsilon_Range), forKey: "inputEpsilon")
			}
		}
	}
}

@available(macOS 10.7, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Straighten
	///
	/// Rotates a source image by the specified angle in radians. The image is then scaled and cropped so that the rotated image fits the extent of the input image.
	///
	/// **Links**
	///
	/// [CIStraightenFilter Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStraightenFilter)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIStraightenFilter/)
	///
	@objc(CIFilterFactory_CIStraightenFilter) class CIStraightenFilter: Core {
		@objc public init?() {
			super.init(name: "CIStraightenFilter")
			self.filter.setDefaults()
		}

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

		///
		/// An angle in radians.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}
	}
}

@available(macOS 10.6, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Stretch Crop
	///
	/// Distorts an image by stretching and or cropping to fit a target size.
	///
	/// **Links**
	///
	/// [CIStretchCrop Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStretchCrop)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIStretchCrop/)
	///
	@objc(CIFilterFactory_CIStretchCrop) class CIStretchCrop: Core {
		@objc public init?() {
			super.init(name: "CIStretchCrop")
			self.filter.setDefaults()
		}

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

		///
		/// The size in pixels of the output image.
		///
		@objc public var inputSize: CIVector? {
			get {
				return self.filter.value(forKey: "inputSize") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputSize")
			}
		}

		///
		/// Determines if and how much cropping should be used to achieve the target size. If value is 0 then only stretching is used. If 1 then only cropping is used.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputCropAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputCropAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCropAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCropAmount_Range), forKey: "inputCropAmount")
			}
		}

		///
		/// Determine how much the center of the image is stretched if stretching is used. If value is 0 then the center of the image maintains the original aspect ratio. If 1 then the image is stretched uniformly.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputCenterStretchAmount_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputCenterStretchAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputCenterStretchAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputCenterStretchAmount_Range), forKey: "inputCenterStretchAmount")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Stripes
	///
	/// Generates a stripe pattern. You can control the color of the stripes, the spacing, and the contrast.
	///
	/// **Links**
	///
	/// [CIStripesGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStripesGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIStripesGenerator/)
	///
	@objc(CIFilterFactory_CIStripesGenerator) class CIStripesGenerator: Core {
		@objc public init?() {
			super.init(name: "CIStripesGenerator")
			self.filter.setDefaults()
		}

		///
		/// The x and y position to use as the center of the stripe pattern.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// A color to use for the odd stripes.
		///
		@objc public var inputColor0: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor0") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor0")
			}
		}

		///
		/// A color to use for the even stripes.
		///
		@objc public var inputColor1: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor1") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor1")
			}
		}

		///
		/// The width of a stripe.
		///
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWidth")
			}
		}

		///
		/// The sharpness of the stripe pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0.
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputSharpness_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputSharpness: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSharpness") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSharpness_Range), forKey: "inputSharpness")
			}
		}
	}
}

@available(macOS 10.10, iOS 8, *)
@objc public extension CIFilterFactory {
	///
	/// Subtract Blend Mode
	///
	/// Unpremultiplies the source and background image sample colors, subtracts the source from the background, and then blends the result with the background according to the PDF basic compositing formula. Source image values that are black produces output that is the same as the background. Source image values that are non-black darken the background color values.
	///
	/// **Links**
	///
	/// [CISubtractBlendMode Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISubtractBlendMode)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISubtractBlendMode/)
	///
	@objc(CIFilterFactory_CISubtractBlendMode) class CISubtractBlendMode: Core {
		@objc public init?() {
			super.init(name: "CISubtractBlendMode")
			self.filter.setDefaults()
		}

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

		///
		/// The image to use as a background image.
		///
		@objc public var inputBackgroundImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputBackgroundImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputBackgroundImage")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Sunbeams
	///
	/// Generates a sun effect. You typically use the output of the sunbeams filter as input to a composite filter.
	///
	/// **Links**
	///
	/// [CISunbeamsGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISunbeamsGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISunbeamsGenerator/)
	///
	@objc(CIFilterFactory_CISunbeamsGenerator) class CISunbeamsGenerator: Core {
		@objc public init?() {
			super.init(name: "CISunbeamsGenerator")
			self.filter.setDefaults()
		}

		///
		/// The x and y position to use as the center of the sunbeam pattern
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The color of the sun.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// The radius of the sun.
		///
		///   minValue: 0.0
		///
		let inputSunRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputSunRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSunRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputSunRadius_Range), forKey: "inputSunRadius")
			}
		}

		///
		/// The radius of the sunbeams.
		///
		///   minValue: 0.0
		///
		let inputMaxStriationRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputMaxStriationRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputMaxStriationRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputMaxStriationRadius_Range), forKey: "inputMaxStriationRadius")
			}
		}

		///
		/// The intensity of the sunbeams. Higher values result in more intensity.
		///
		///   minValue: 0.0
		///
		let inputStriationStrength_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputStriationStrength: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationStrength") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputStriationStrength_Range), forKey: "inputStriationStrength")
			}
		}

		///
		/// The contrast of the sunbeams. Higher values result in more contrast.
		///
		///   minValue: 0.0
		///
		let inputStriationContrast_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputStriationContrast: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStriationContrast") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputStriationContrast_Range), forKey: "inputStriationContrast")
			}
		}

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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Swipe
	///
	/// Transitions from one image to another by simulating a swiping action.
	///
	/// **Links**
	///
	/// [CISwipeTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISwipeTransition)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CISwipeTransition/)
	///
	@objc(CIFilterFactory_CISwipeTransition) class CISwipeTransition: Core {
		@objc public init?() {
			super.init(name: "CISwipeTransition")
			self.filter.setDefaults()
		}

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

		///
		/// The extent of the effect.
		///
		@objc public var inputExtent: CIVector? {
			get {
				return self.filter.value(forKey: "inputExtent") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputExtent")
			}
		}

		///
		/// The color of the swipe.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}

		///
		/// The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).
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
				self.filter.setValue(newValue?.clamped(bounds: inputTime_Range), forKey: "inputTime")
			}
		}

		///
		/// The angle of the swipe.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of the swipe
		///
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputWidth")
			}
		}

		///
		/// The opacity of the swipe.
		///
		///   minValue: 0.0
		///
		let inputOpacity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputOpacity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputOpacity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputOpacity_Range), forKey: "inputOpacity")
			}
		}
	}
}

@available(macOS 10.7, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Temperature and Tint
	///
	/// Adapt the reference white point for an image.
	///
	/// **Links**
	///
	/// [CITemperatureAndTint Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITemperatureAndTint)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CITemperatureAndTint/)
	///
	@objc(CIFilterFactory_CITemperatureAndTint) class CITemperatureAndTint: Core {
		@objc public init?() {
			super.init(name: "CITemperatureAndTint")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputNeutral: CIVector? {
			get {
				return self.filter.value(forKey: "inputNeutral") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputNeutral")
			}
		}

		///
		/// No Description
		///
		@objc public var inputTargetNeutral: CIVector? {
			get {
				return self.filter.value(forKey: "inputTargetNeutral") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputTargetNeutral")
			}
		}
	}
}

@available(macOS 10.13, iOS 11, *)
@objc public extension CIFilterFactory {
	///
	/// Text Image Generator
	///
	/// Generate an image from a string and font information.
	///
	/// **Links**
	///
	/// [CITextImageGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITextImageGenerator)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CITextImageGenerator/)
	///
	@objc(CIFilterFactory_CITextImageGenerator) class CITextImageGenerator: Core {
		@objc public init?() {
			super.init(name: "CITextImageGenerator")
			self.filter.setDefaults()
		}

		///
		/// No Description
		///
		@objc public var inputText: NSString? {
			get {
				return self.filter.value(forKey: "inputText") as? NSString
			}
			set {
				self.filter.setValue(newValue, forKey: "inputText")
			}
		}

		///
		/// No Description
		///
		@objc public var inputFontName: NSString? {
			get {
				return self.filter.value(forKey: "inputFontName") as? NSString
			}
			set {
				self.filter.setValue(newValue, forKey: "inputFontName")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputFontSize_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputFontSize: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFontSize") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputFontSize_Range), forKey: "inputFontSize")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///
		let inputScaleFactor_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputScaleFactor: NSNumber? {
			get {
				return self.filter.value(forKey: "inputScaleFactor") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputScaleFactor_Range), forKey: "inputScaleFactor")
			}
		}
	}
}

@available(macOS 10.11, iOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// Thermal
	///
	/// Apply a “Thermal” style effect to an image
	///
	/// **Links**
	///
	/// [CIThermal Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIThermal)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIThermal/)
	///
	@objc(CIFilterFactory_CIThermal) class CIThermal: Core {
		@objc public init?() {
			super.init(name: "CIThermal")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.7, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Tone Curve
	///
	/// Adjusts tone response of the R, G, and B channels of an image. The input points are five x,y values that are interpolated using a spline curve. The curve is applied in a perceptual (gamma 2) version of the working space.
	///
	/// **Links**
	///
	/// [CIToneCurve Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIToneCurve)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIToneCurve/)
	///
	@objc(CIFilterFactory_CIToneCurve) class CIToneCurve: Core {
		@objc public init?() {
			super.init(name: "CIToneCurve")
			self.filter.setDefaults()
		}

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

		///
		/// No Description
		///
		@objc public var inputPoint0: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint0") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint0")
			}
		}

		///
		/// No Description
		///
		@objc public var inputPoint1: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint1") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint1")
			}
		}

		///
		/// No Description
		///
		@objc public var inputPoint2: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint2") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint2")
			}
		}

		///
		/// No Description
		///
		@objc public var inputPoint3: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint3") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint3")
			}
		}

		///
		/// No Description
		///
		@objc public var inputPoint4: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint4") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint4")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Torus Lens Distortion
	///
	/// Creates a torus-shaped lens and distorts the portion of the image over which the lens is placed.
	///
	/// **Links**
	///
	/// [CITorusLensDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITorusLensDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CITorusLensDistortion/)
	///
	@objc(CIFilterFactory_CITorusLensDistortion) class CITorusLensDistortion: Core {
		@objc public init?() {
			super.init(name: "CITorusLensDistortion")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the torus.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The outer radius of the torus.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The width of the ring.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// The refraction of the glass.
		///
		///   minValue: 0.0
		///
		let inputRefraction_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRefraction: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRefraction") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRefraction_Range), forKey: "inputRefraction")
			}
		}
	}
}

@available(macOS 10.10, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Triangle Kaleidoscope
	///
	/// Maps a triangular portion of image to a triangular area and then generates a kaleidoscope effect.
	///
	/// **Links**
	///
	/// [CITriangleKaleidoscope Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITriangleKaleidoscope)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CITriangleKaleidoscope/)
	///
	@objc(CIFilterFactory_CITriangleKaleidoscope) class CITriangleKaleidoscope: Core {
		@objc public init?() {
			super.init(name: "CITriangleKaleidoscope")
			self.filter.setDefaults()
		}

		///
		/// Input image to generate kaleidoscope effect from.
		///
		@objc public var inputImage: CIImage? {
			get {
				return self.filter.value(forKey: "inputImage") as? CIImage
			}
			set {
				self.filter.setValue(newValue, forKey: "inputImage")
			}
		}

		///
		/// The x and y position to use as the center of the triangular area in the input image.
		///
		@objc public var inputPoint: CIVector? {
			get {
				return self.filter.value(forKey: "inputPoint") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputPoint")
			}
		}

		///
		/// The size in pixels of the triangle.
		///
		@objc public var inputSize: NSNumber? {
			get {
				return self.filter.value(forKey: "inputSize") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputSize")
			}
		}

		///
		/// Rotation angle of the triangle.
		///
		@objc public var inputRotation: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRotation") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRotation")
			}
		}

		///
		/// The decay determines how fast the color fades from the center triangle.
		///
		@objc public var inputDecay: NSNumber? {
			get {
				return self.filter.value(forKey: "inputDecay") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputDecay")
			}
		}
	}
}

@available(macOS 10.4, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Triangle Tile
	///
	/// Maps a triangular portion of image to a triangular area and then tiles the result.
	///
	/// **Links**
	///
	/// [CITriangleTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITriangleTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CITriangleTile/)
	///
	@objc(CIFilterFactory_CITriangleTile) class CITriangleTile: Core {
		@objc public init?() {
			super.init(name: "CITriangleTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}
	}
}

@available(macOS 10.5, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Twelvefold Reflected Tile
	///
	/// Produces a tiled image from a source image by applying a 12-way reflected symmetry.
	///
	/// **Links**
	///
	/// [CITwelvefoldReflectedTile Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITwelvefoldReflectedTile)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CITwelvefoldReflectedTile/)
	///
	@objc(CIFilterFactory_CITwelvefoldReflectedTile) class CITwelvefoldReflectedTile: Core {
		@objc public init?() {
			super.init(name: "CITwelvefoldReflectedTile")
			self.filter.setDefaults()
		}

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

		///
		/// The x and y position to use as the center of the effect
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The angle (in radians) of the tiled pattern.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}

		///
		/// The width of a tile.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Twirl Distortion
	///
	/// Rotates pixels around a point to give a twirling effect. You can specify the number of rotations as well as the center and radius of the effect.
	///
	/// **Links**
	///
	/// [CITwirlDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITwirlDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CITwirlDistortion/)
	///
	@objc(CIFilterFactory_CITwirlDistortion) class CITwirlDistortion: Core {
		@objc public init?() {
			super.init(name: "CITwirlDistortion")
			self.filter.setDefaults()
		}

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

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The angle (in radians) of the twirl. Values can be positive or negative.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Unsharp Mask
	///
	/// Increases the contrast of the edges between pixels of different colors in an image.
	///
	/// **Links**
	///
	/// [CIUnsharpMask Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIUnsharpMask)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIUnsharpMask/)
	///
	@objc(CIFilterFactory_CIUnsharpMask) class CIUnsharpMask: Core {
		@objc public init?() {
			super.init(name: "CIUnsharpMask")
			self.filter.setDefaults()
		}

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

		///
		/// The radius around a given pixel to apply the unsharp mask. The larger the radius, the more of the image is affected.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The intensity of the effect. The larger the value, the more contrast in the affected area.
		///
		///   minValue: 0.0
		///
		let inputIntensity_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputIntensity_Range), forKey: "inputIntensity")
			}
		}
	}
}

@available(macOS 10.7, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Vibrance
	///
	/// Adjusts the saturation of an image while keeping pleasing skin tones.
	///
	/// **Links**
	///
	/// [CIVibrance Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVibrance)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIVibrance/)
	///
	@objc(CIFilterFactory_CIVibrance) class CIVibrance: Core {
		@objc public init?() {
			super.init(name: "CIVibrance")
			self.filter.setDefaults()
		}

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

		///
		/// The amount to adjust the saturation.
		///
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		let inputAmount_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public var inputAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputAmount_Range), forKey: "inputAmount")
			}
		}
	}
}

@available(macOS 10.9, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Vignette
	///
	/// Applies a vignette shading to the corners of an image.
	///
	/// **Links**
	///
	/// [CIVignette Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignette)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIVignette/)
	///
	@objc(CIFilterFactory_CIVignette) class CIVignette: Core {
		@objc public init?() {
			super.init(name: "CIVignette")
			self.filter.setDefaults()
		}

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

		///
		/// The intensity of the effect.
		///
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		let inputIntensity_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputIntensity_Range), forKey: "inputIntensity")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   minValue: 0.0
		///   maxValue: 2.0
		///
		let inputRadius_Range: ClosedRange<Float> = 0.0 ... 2.0
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}
	}
}

@available(macOS 10.9, iOS 7, *)
@objc public extension CIFilterFactory {
	///
	/// Vignette Effect
	///
	/// Applies a vignette shading to the corners of an image.
	///
	/// **Links**
	///
	/// [CIVignetteEffect Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignetteEffect)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIVignetteEffect/)
	///
	@objc(CIFilterFactory_CIVignetteEffect) class CIVignetteEffect: Core {
		@objc public init?() {
			super.init(name: "CIVignetteEffect")
			self.filter.setDefaults()
		}

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

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The distance from the center of the effect.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The intensity of the effect.
		///
		///   minValue: -1.0
		///   maxValue: 1.0
		///
		let inputIntensity_Range: ClosedRange<Float> = -1.0 ... 1.0
		@objc public var inputIntensity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputIntensity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputIntensity_Range), forKey: "inputIntensity")
			}
		}

		///
		/// No Description
		///
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		let inputFalloff_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var inputFalloff: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFalloff") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputFalloff_Range), forKey: "inputFalloff")
			}
		}
	}
}

@available(macOS 10.4, iOS 6, *)
@objc public extension CIFilterFactory {
	///
	/// Vortex Distortion
	///
	/// Rotates pixels around a point to simulate a vortex. You can specify the number of rotations as well the center and radius of the effect.
	///
	/// **Links**
	///
	/// [CIVortexDistortion Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVortexDistortion)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIVortexDistortion/)
	///
	@objc(CIFilterFactory_CIVortexDistortion) class CIVortexDistortion: Core {
		@objc public init?() {
			super.init(name: "CIVortexDistortion")
			self.filter.setDefaults()
		}

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

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		///
		/// The angle (in radians) of the vortex.
		///
		@objc public var inputAngle: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAngle") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAngle")
			}
		}
	}
}

@available(macOS 10.4, iOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// White Point Adjust
	///
	/// Adjusts the reference white point for an image and maps all colors in the source using the new reference.
	///
	/// **Links**
	///
	/// [CIWhitePointAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIWhitePointAdjust)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIWhitePointAdjust/)
	///
	@objc(CIFilterFactory_CIWhitePointAdjust) class CIWhitePointAdjust: Core {
		@objc public init?() {
			super.init(name: "CIWhitePointAdjust")
			self.filter.setDefaults()
		}

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

		///
		/// A color to use as the white point.
		///
		@objc public var inputColor: CIColor? {
			get {
				return self.filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				self.filter.setValue(newValue, forKey: "inputColor")
			}
		}
	}
}

@available(macOS 10.11, iOS 10, *)
@objc public extension CIFilterFactory {
	///
	/// X-Ray
	///
	/// Apply a “XRay” style effect to an image
	///
	/// **Links**
	///
	/// [CIXRay Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIXRay)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIXRay/)
	///
	@objc(CIFilterFactory_CIXRay) class CIXRay: Core {
		@objc public init?() {
			super.init(name: "CIXRay")
			self.filter.setDefaults()
		}

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
	}
}

@available(macOS 10.4, iOS 8.3, *)
@objc public extension CIFilterFactory {
	///
	/// Zoom Blur
	///
	/// Simulates the effect of zooming the camera while capturing the image.
	///
	/// **Links**
	///
	/// [CIZoomBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIZoomBlur)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIZoomBlur/)
	///
	@objc(CIFilterFactory_CIZoomBlur) class CIZoomBlur: Core {
		@objc public init?() {
			super.init(name: "CIZoomBlur")
			self.filter.setDefaults()
		}

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

		///
		/// The center of the effect as x and y coordinates.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return self.filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				self.filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		///
		/// The zoom-in amount. Larger values result in more zooming in.
		///
		@objc public var inputAmount: NSNumber? {
			get {
				return self.filter.value(forKey: "inputAmount") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputAmount")
			}
		}
	}
}
