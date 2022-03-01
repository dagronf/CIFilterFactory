//
//  CIDroste.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.6, iOS 9, tvOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Droste
	///
	/// Performs M.C. Escher Droste style deformation
	///
	/// **Links**
	///
	/// - [CIDroste Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDroste)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cidroste?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIDroste/)
	///
	@objc(CIFilterFactory_Droste) class Droste: FilterCore {
		@objc public init?() {
			super.init(name: "CIDroste")
		}

		// MARK: - Inputs

		// MARK: - image (inputImage)

		///
		/// The image to use as an input image. For filters that also use a background image, this is the foreground image.
		///
		///   - Attribute key: `inputImage`
		///   - Internal class: `CIImage`
		///   - Type: `CIAttributeTypeImage`
		@objc public var image: CIImage? {
			get {
				return self.keyedValue("inputImage")
			}
			set {
				self.setKeyedValue(newValue, for: "inputImage")
			}
		}

		// MARK: - insetPoint0 (inputInsetPoint0)

		///
		/// No Description
		///
		///   - Attribute key: `inputInsetPoint0`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[200 200]`
		@objc public var insetPoint0: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputInsetPoint0", defaultValue: Self.insetPoint0_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputInsetPoint0")
			}
		}

		/// insetPoint0 default value
		@objc public static let insetPoint0_default = CGPoint(x: 200.0, y: 200.0)

		// MARK: - insetPoint1 (inputInsetPoint1)

		///
		/// No Description
		///
		///   - Attribute key: `inputInsetPoint1`
		///   - Internal class: `CIVector`
		///   - Type: `CIAttributeTypePosition`
		///   - Default value: `[400 400]`
		@objc public var insetPoint1: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputInsetPoint1", defaultValue: Self.insetPoint1_default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputInsetPoint1")
			}
		}

		/// insetPoint1 default value
		@objc public static let insetPoint1_default = CGPoint(x: 400.0, y: 400.0)

		// MARK: - strands (inputStrands)

		///
		/// No Description
		///
		///   - Attribute key: `inputStrands`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: -10.0
		///   maxValue: 10.0
		///
		public static let strands_Range: ClosedRange<Float> = -10.0 ... 10.0
		@objc public var strands: NSNumber? {
			get {
				return self.keyedValue("inputStrands")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: Droste.strands_Range), forKey: "inputStrands")
			}
		}

		// MARK: - periodicity (inputPeriodicity)

		///
		/// No Description
		///
		///   - Attribute key: `inputPeriodicity`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		///   minValue: 1.0
		///
		public static let periodicity_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public var periodicity: NSNumber? {
			get {
				return self.keyedValue("inputPeriodicity")
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: Droste.periodicity_Range), forKey: "inputPeriodicity")
			}
		}

		// MARK: - rotation (inputRotation)

		///
		/// No Description
		///
		///   - Attribute key: `inputRotation`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `0`
		@objc public var rotation: NSNumber? {
			get {
				return self.keyedValue("inputRotation")
			}
			set {
				self.setKeyedValue(newValue, for: "inputRotation")
			}
		}

		// MARK: - zoom (inputZoom)

		///
		/// No Description
		///
		///   - Attribute key: `inputZoom`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeScalar`
		///   - Default value: `1`
		@objc public var zoom: NSNumber? {
			get {
				return self.keyedValue("inputZoom")
			}
			set {
				self.setKeyedValue(newValue, for: "inputZoom")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			insetPoint0: CGPoint = Droste.insetPoint0_default,
			insetPoint1: CGPoint = Droste.insetPoint1_default,
			strands: NSNumber = 1,
			periodicity: NSNumber = 1,
			rotation: NSNumber = 0,
			zoom: NSNumber = 1
		) {
			self.init()

			self.image = image
			self.insetPoint0 = insetPoint0
			self.insetPoint1 = insetPoint1
			self.strands = strands
			self.periodicity = periodicity
			self.rotation = rotation
			self.zoom = zoom
		}
	}
}
