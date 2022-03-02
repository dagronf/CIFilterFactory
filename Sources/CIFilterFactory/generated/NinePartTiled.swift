//
//  NinePartTiled.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.12, iOS 10, tvOS 10, *)
@objc public extension CIFF {
	///
	/// Nine Part Tiled
	///
	/// Distorts an image by tiling an image based on two input breakpoints
	///
	/// **Links**
	///
	/// - [CINinePartTiled Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINinePartTiled)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cinineparttiled?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CINinePartTiled/)
	///
	@available(macOS 10.12, iOS 10, tvOS 10, *)
	@objc(CIFFNinePartTiled) class NinePartTiled: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CINinePartTiled")
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

		// MARK: - breakpoint0 (inputBreakpoint0)

		/// Lower left corner of image to retain before tiling begins.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBreakpoint0`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[50 50]`
		@objc public var breakpoint0: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputBreakpoint0", defaultValue: Self.breakpoint0Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBreakpoint0")
			}
		}

		/// breakpoint0 default value
		@objc public static let breakpoint0Default = CGPoint(x: 50.0, y: 50.0)

		// MARK: - breakpoint1 (inputBreakpoint1)

		/// Upper right corner of image to retain after tiling ends.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputBreakpoint1`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[150 150]`
		@objc public var breakpoint1: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputBreakpoint1", defaultValue: Self.breakpoint1Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputBreakpoint1")
			}
		}

		/// breakpoint1 default value
		@objc public static let breakpoint1Default = CGPoint(x: 150.0, y: 150.0)

		// MARK: - growAmount (inputGrowAmount)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputGrowAmount`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypeOffset`
		/// - Default value: `[100 100]`
		@objc public var growAmount: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputGrowAmount", defaultValue: Self.growAmountDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputGrowAmount")
			}
		}

		/// growAmount default value
		@objc public static let growAmountDefault = CGPoint(x: 100.0, y: 100.0)

		// MARK: - flipYTiles (inputFlipYTiles)

		/// Indicates that Y-Axis flip should occur.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputFlipYTiles`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeBoolean`
		/// - Default value: `1`
		/// - Minimum value: `0.0`
		/// - Maximum value: `1.0`
		@objc public var flipYTiles: NSNumber? {
			get {
				return self.keyedValue("inputFlipYTiles")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: NinePartTiled.flipYTilesRange), forKey: "inputFlipYTiles")
			}
		}

		/// `flipYTiles` range definition
		public static let flipYTilesRange: ClosedRange<Float> = 0.0 ... 1.0

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			breakpoint0: CGPoint = NinePartTiled.breakpoint0Default,
			breakpoint1: CGPoint = NinePartTiled.breakpoint1Default,
			growAmount: CGPoint = NinePartTiled.growAmountDefault,
			flipYTiles: NSNumber = 1
		) {
			self.init()

			self.image = image
			self.breakpoint0 = breakpoint0
			self.breakpoint1 = breakpoint1
			self.growAmount = growAmount
			self.flipYTiles = flipYTiles
		}
	}
}
