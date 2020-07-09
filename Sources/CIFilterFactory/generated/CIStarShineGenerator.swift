//
//  CIStarShineGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
			filter.setDefaults()
		}

		// MARK: - inputCenter

		///
		/// The x and y position to use as the center of the star.
		///
		@objc public var inputCenter: CIVector? {
			get {
				return filter.value(forKey: "inputCenter") as? CIVector
			}
			set {
				filter.setValue(newValue, forKey: "inputCenter")
			}
		}

		// MARK: - inputColor

		///
		/// The color to use for the outer shell of the circular star.
		///
		@objc public var inputColor: CIColor? {
			get {
				return filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputColor")
			}
		}

		// MARK: - inputRadius

		///
		/// The radius of the star.
		///
		///   minValue: 0.0
		///
		let inputRadius_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputRadius: NSNumber? {
			get {
				return filter.value(forKey: "inputRadius") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputRadius_Range), forKey: "inputRadius")
			}
		}

		// MARK: - inputCrossScale

		///
		/// The size of the cross pattern.
		///
		///   minValue: 0.0
		///
		let inputCrossScale_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputCrossScale: NSNumber? {
			get {
				return filter.value(forKey: "inputCrossScale") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCrossScale_Range), forKey: "inputCrossScale")
			}
		}

		// MARK: - inputCrossAngle

		///
		/// The angle of the cross pattern.
		///
		@objc public var inputCrossAngle: NSNumber? {
			get {
				return filter.value(forKey: "inputCrossAngle") as? NSNumber
			}
			set {
				filter.setValue(newValue, forKey: "inputCrossAngle")
			}
		}

		// MARK: - inputCrossOpacity

		///
		/// The opacity of the cross pattern.
		///
		///   minValue: -8.0
		///
		let inputCrossOpacity_Range: PartialRangeFrom<Float> = Float(-8.0)...
		@objc public var inputCrossOpacity: NSNumber? {
			get {
				return filter.value(forKey: "inputCrossOpacity") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCrossOpacity_Range), forKey: "inputCrossOpacity")
			}
		}

		// MARK: - inputCrossWidth

		///
		/// The width of the cross pattern.
		///
		///   minValue: 0.0
		///
		let inputCrossWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputCrossWidth: NSNumber? {
			get {
				return filter.value(forKey: "inputCrossWidth") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputCrossWidth_Range), forKey: "inputCrossWidth")
			}
		}

		// MARK: - inputEpsilon

		///
		/// The length of the cross spikes.
		///
		///   minValue: -8.0
		///
		let inputEpsilon_Range: PartialRangeFrom<Float> = Float(-8.0)...
		@objc public var inputEpsilon: NSNumber? {
			get {
				return filter.value(forKey: "inputEpsilon") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputEpsilon_Range), forKey: "inputEpsilon")
			}
		}
	}
}
