//
//  CICheckerboardGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 5, tvOS 5, *)
@objc public extension CIFilterFactory {
	///
	/// Checkerboard
	///
	/// Generates a pattern of squares of alternating colors. You can specify the size, colors, and the sharpness of the pattern.
	///
	/// **Links**
	///
	/// - [CICheckerboardGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICheckerboardGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cicheckerboardgenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CICheckerboardGenerator/)
	///
	@objc(CIFilterFactory_CheckerboardGenerator) class CheckerboardGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CICheckerboardGenerator")
		}

		// MARK: - Inputs

		// MARK: - center (inputCenter)

		///
		/// The center of the effect as x and y coordinates.
		///
		///   - Attribute key: `inputCenter`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[150 150]`
		@objc public var center: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputCenter", defaultValue: Self.center_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// center default value
		@objc public static let center_default = CGPoint(x: 150.0, y: 150.0)

		// MARK: - color0 (inputColor0)

		///
		/// A color to use for the first set of squares.
		///
		///   - Attribute key: `inputColor0`
		///   - Internal class: `CIColor`
		///   - Default value: `rgba(1 1 1 1`)
		@objc public var color0: CIColor? {
			get {
				return self.keyedValue("inputColor0")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor0")
			}
		}

		// MARK: - color1 (inputColor1)

		///
		/// A color to use for the second set of squares.
		///
		///   - Attribute key: `inputColor1`
		///   - Internal class: `CIColor`
		///   - Default value: `rgba(0 0 0 1`)
		@objc public var color1: CIColor? {
			get {
				return self.keyedValue("inputColor1")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor1")
			}
		}

		// MARK: - width (inputWidth)

		///
		/// The width of the squares in the pattern.
		///
		///   - Attribute key: `inputWidth`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeDistance`
		///   - Default value: `80`
		@objc public var width: NSNumber? {
			get {
				return self.keyedValue("inputWidth")
			}
			set {
				self.setKeyedValue(newValue, for: "inputWidth")
			}
		}

		// MARK: - sharpness (inputSharpness)

		///
		/// The sharpness of the edges in pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0.
		///
		///   - Attribute key: `inputSharpness`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 0.0
		///   maxValue: 1.0
		///
		public static let sharpness_Range: ClosedRange<Float> = 0.0 ... 1.0
		@objc public var sharpness: NSNumber? {
			get {
				return self.keyedValue("inputSharpness")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CheckerboardGenerator.sharpness_Range), forKey: "inputSharpness")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			center: CGPoint = CheckerboardGenerator.center_default,
			color0: CIColor,
			color1: CIColor,
			width: NSNumber = 80,
			sharpness: NSNumber = 1
		) {
			self.init()

			self.center = center
			self.color0 = color0
			self.color1 = color1
			self.width = width
			self.sharpness = sharpness
		}
	}
}
