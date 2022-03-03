//
//  MeshGenerator.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.14, iOS 12, tvOS 12, *)
@objc public extension CIFF {
	///
	/// Mesh Generator
	///
	/// Generates a mesh from an array of line segments.
	///
	/// **Links**
	///
	/// - [CIMeshGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMeshGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cimeshgenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIMeshGenerator/)
	///
	@available(macOS 10.14, iOS 12, tvOS 12, *)
	@objc(CIFFMeshGenerator) class MeshGenerator: FilterCore {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIMeshGenerator")
		}

		// MARK: - Inputs

		// MARK: - width (inputWidth)

		/// The width of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Default value: `1.5`
		/// - Minimum value: `0.0`
		@objc public var width: Double {
			get {
				let number = self.filter.value(forKey: "inputWidth") as? NSNumber
				return number?.doubleValue ?? 1.5
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: MeshGenerator.widthRange)
				self.filter.setValue(number, forKey: "inputWidth")
			}
		}

		/// `width` range definition
		public static let widthRange: PartialRangeFrom<Double> = Double(0.0)...

		// MARK: - color (inputColor)

		/// A color.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor`
		/// - Internal class: `CIColor`
		/// - Default value: `rgba(1 1 1 1)`
		@objc public var color: CIColor? {
			get {
				return self.keyedValue("inputColor")
			}
			set {
				self.setKeyedValue(newValue, for: "inputColor")
			}
		}

		// MARK: - mesh (inputMesh)

		/// An array of line segments stored as an array of CIVectors each containing a start point and end point.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputMesh`
		/// - Internal class: `NSArray`
		@objc public var mesh: NSArray? {
			get {
				return self.keyedValue("inputMesh")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMesh")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			width: Double = 1.5,
			color: CIColor,
			mesh: NSArray
		) {
			self.init()

			self.width = width
			self.color = color
			self.mesh = mesh
		}
	}
}
