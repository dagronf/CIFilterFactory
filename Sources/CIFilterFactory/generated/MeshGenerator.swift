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

@objc public extension CIFF {
	/// Mesh Generator
	///
	/// Generates a mesh from an array of line segments.
	///
	/// **CIFilter Name**
	/// - CIMeshGenerator
	///
	/// **Availability**
	/// - macOS 10.14, iOS 12, tvOS 12
	///
	/// **Categories**
	/// - CICategoryBuiltIn
	/// - CICategoryGenerator
	/// - CICategoryHighDynamicRange
	/// - CICategoryStillImage
	/// - CICategoryVideo
	///
	/// **Documentation Links**
	/// - [CIMeshGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMeshGenerator)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cimeshgenerator?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIMeshGenerator/)
	///
	@available(macOS 10.14, iOS 12, tvOS 12, *)
	@objc(CIFFMeshGenerator) class MeshGenerator: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIMeshGenerator")
		}

		// MARK: - width (inputWidth)

		/// The width in pixels of the effect.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputWidth`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeDistance`
		/// - Minimum Value: `0.0`
		/// - Default Value: `1.5`
		@objc public var width: Double {
			get {
				self.doubleValue(forKey: "inputWidth", defaultValue: Self.widthDefault)
			}
			set {
				self.setDoubleValue(newValue, bounds: MeshGenerator.widthRange, forKey: "inputWidth")
			}
		}

		/// `width` default value
		@objc public static let widthDefault: Double = 1.5

		/// `width` range definition
		public static let widthRange = PartialRangeFrom<Double>(0.0)

		// MARK: - color (inputColor)

		/// A color.
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputColor`
		/// - Internal class: `CIColor`
		/// - Type: `CIAttributeTypeColor`
		@objc public var color: CIColor? {
			get {
				self.keyedValue("inputColor")
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
				self.keyedValue("inputMesh")
			}
			set {
				self.setKeyedValue(newValue, for: "inputMesh")
			}
		}

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			width: Double = MeshGenerator.widthDefault,
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
