//
//  CINinePartTiled.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.12, iOS 10, *)
	@inlinable @objc static func NinePartTiled() -> CIFilterFactory.CINinePartTiled? {
		return CIFilterFactory.CINinePartTiled()
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
	@objc(CIFilterFactory_CINinePartTiled) class CINinePartTiled: FilterCore {
		@objc public init?() {
			super.init(name: "CINinePartTiled")
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
		/// Lower left corner of image to retain before tiling begins.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [50 50]
		@objc public dynamic var inputBreakpoint0: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputBreakpoint0")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputBreakpoint0")
			}
		}

		///
		/// Upper right corner of image to retain after tiling ends.
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [150 150]
		@objc public dynamic var inputBreakpoint1: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputBreakpoint1")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputBreakpoint1")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypeOffset
		///   Default:  [100 100]
		@objc public dynamic var inputGrowAmount: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputGrowAmount")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputGrowAmount")
			}
		}

		///
		/// Indicates that Y-Axis flip should occur.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeBoolean
		///   Default:  1
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let inputFlipYTiles_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public dynamic var inputFlipYTiles: NSNumber? {
			get {
				return self.filter.value(forKey: "inputFlipYTiles") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CINinePartTiled.inputFlipYTiles_Range), forKey: "inputFlipYTiles")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputBreakpoint0: CIFilterFactory.Point = CIFilterFactory.Point(x: 50.0, y: 50.0),
			inputBreakpoint1: CIFilterFactory.Point = CIFilterFactory.Point(x: 150.0, y: 150.0),
			inputGrowAmount: CIFilterFactory.Point = CIFilterFactory.Point(x: 100.0, y: 100.0),
			inputFlipYTiles: NSNumber = 1
		) {
			self.init()

			self.inputImage = inputImage
			self.inputBreakpoint0 = inputBreakpoint0
			self.inputBreakpoint1 = inputBreakpoint1
			self.inputGrowAmount = inputGrowAmount
			self.inputFlipYTiles = inputFlipYTiles
		}
	}
}
