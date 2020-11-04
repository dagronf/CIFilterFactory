//
//  CIMeshGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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
	@available(macOS 10.14, iOS 12, *)
	@inlinable @objc static func MeshGenerator() -> CIFilterFactory.CIMeshGenerator? {
		return CIFilterFactory.CIMeshGenerator()
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
	@objc(CIFilterFactory_CIMeshGenerator) class CIMeshGenerator: FilterCore {
		@objc public init?() {
			super.init(name: "CIMeshGenerator")
		}

		// MARK: - Inputs

		///
		/// The width of the effect.
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeDistance
		///   Default:  1.5
		///   minValue: 0.0
		///
		static let inputWidth_Range: PartialRangeFrom<Float> = Float(0.0)...
		@objc public dynamic var inputWidth: NSNumber? {
			get {
				return self.filter.value(forKey: "inputWidth") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIMeshGenerator.inputWidth_Range), forKey: "inputWidth")
			}
		}

		///
		/// A color.
		///
		///   Class:    CIColor
		///   Default:  rgba(1 1 1 1)
		@objc public dynamic var inputColor: CIColor? {
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
		///   Class:    NSArray
		@objc public dynamic var inputMesh: NSArray? {
			get {
				return self.filter.value(forKey: "inputMesh") as? NSArray
			}
			set {
				self.filter.setValue(newValue, forKey: "inputMesh")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputWidth: NSNumber = 1.5,
			inputColor: CIColor,
			inputMesh: NSArray
		) {
			self.init()

			self.inputWidth = inputWidth
			self.inputColor = inputColor
			self.inputMesh = inputMesh
		}
	}
}
