//
//  RadialGradient.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.4, iOS 5, tvOS 5, *)
@objc public extension CIFF {
	///
	/// Radial Gradient
	///
	/// Generates a gradient that varies radially between two circles having the same center. It is valid for one of the two circles to have a radius of 0.
	///
	/// **Availability**
	/// - macOS 10.4, iOS 5, tvOS 5
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryGradient
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIRadialGradient Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRadialGradient)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciradialgradient?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIRadialGradient/)
	///
	@available(macOS 10.4, iOS 5, tvOS 5, *)
	@objc(CIFFRadialGradient) class RadialGradient: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIRadialGradient")
		}

		// MARK: - center (inputCenter)

		/// The center of the effect as x and y coordinates.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputCenter`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default Value: `CGPoint(x: 150.0, y: 150.0)`
		@objc public var center: CGPoint {
			get {
				self.cgPointValue(forKey: "inputCenter", defaultValue: Self.centerDefault)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputCenter")
			}
		}

		/// `center` default value
		@objc public static let centerDefault = CGPoint(x: 150.0, y: 150.0)

		// MARK: - radius0 (inputRadius0)

		/// The radius of the starting circle to use in the gradient.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius0`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `5.0`
		@objc public var radius0: Double {
			get {
				self.doubleValue(forKey: "inputRadius0", defaultValue: Self.radius0Default)
			}
			set {
				self.setDoubleValue(newValue, bounds: RadialGradient.radius0Range, forKey: "inputRadius0")
			}
		}

		/// `radius0` default value
		@objc public static let radius0Default: Double = 5.0

		/// `radius0` range definition
		public static let radius0Range = PartialRangeFrom<Double>(0.0)

		// MARK: - radius1 (inputRadius1)

		/// The radius of the ending circle to use in the gradient.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRadius1`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `100.0`
		@objc public var radius1: Double {
			get {
				self.doubleValue(forKey: "inputRadius1", defaultValue: Self.radius1Default)
			}
			set {
				self.setDoubleValue(newValue, bounds: RadialGradient.radius1Range, forKey: "inputRadius1")
			}
		}

		/// `radius1` default value
		@objc public static let radius1Default: Double = 100.0

		/// `radius1` range definition
		public static let radius1Range = PartialRangeFrom<Double>(0.0)

		// MARK: - color0 (inputColor0)

		/// The first color to use in the gradient.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor0`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var color0: CIColor? {
			get {
				return self.keyedValue("inputColor0")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor0")
			}
		}

		// MARK: - color1 (inputColor1)

		/// The second color to use in the gradient.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor1`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var color1: CIColor? {
			get {
				return self.keyedValue("inputColor1")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor1")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			center: CGPoint = RadialGradient.centerDefault,
			radius0: Double = RadialGradient.radius0Default,
			radius1: Double = RadialGradient.radius1Default,
			color0: CIColor,
			color1: CIColor
		) {
			self.init()
			self.center = center
			self.radius0 = radius0
			self.radius1 = radius1
			self.color0 = color0
			self.color1 = color1
		}
	}
}
