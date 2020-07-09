//
//  CIMeshGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
			filter.setDefaults()
		}

		// MARK: - inputWidth

		///
		/// The width of the effect.
		///
		///   minValue: 0.0
		///
		let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public var inputWidth: NSNumber? {
			get {
				return filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				filter.setValue(newValue?.clamped(bounds: inputWidth_Range), forKey: "inputWidth")
			}
		}

		// MARK: - inputColor

		///
		/// A color.
		///
		@objc public var inputColor: CIColor? {
			get {
				return filter.value(forKey: "inputColor") as? CIColor
			}
			set {
				filter.setValue(newValue, forKey: "inputColor")
			}
		}

		// MARK: - inputMesh

		///
		/// An array of line segments stored as an array of CIVectors each containing a start point and end point.
		///
		@objc public var inputMesh: NSArray? {
			get {
				return filter.value(forKey: "inputMesh") as? NSArray
			}
			set {
				filter.setValue(newValue, forKey: "inputMesh")
			}
		}
	}
}
