//
//  Droste.swift  (AUTOMATICALLY GENERATED FILE)
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

@available(macOS 10.6, iOS 9, tvOS 9, *)
@objc public extension CIFF {
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
	@available(macOS 10.6, iOS 9, tvOS 9, *)
	@objc(CIFFDroste) class Droste: Core {
		/// Create an instance of the filter
		@objc public init?() {
			super.init(name: "CIDroste")
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

		// MARK: - insetPoint0 (inputInsetPoint0)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputInsetPoint0`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[200 200]`
		@objc public var insetPoint0: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputInsetPoint0", defaultValue: Self.insetPoint0Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputInsetPoint0")
			}
		}

		/// insetPoint0 default value
		@objc public static let insetPoint0Default = CGPoint(x: 200.0, y: 200.0)

		// MARK: - insetPoint1 (inputInsetPoint1)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputInsetPoint1`
		/// - Internal class: `CIVector`
		/// - Type: `CIAttributeTypePosition`
		/// - Default value: `[400 400]`
		@objc public var insetPoint1: CGPoint {
			get {
				return CGPoint(with: self.filter, key: "inputInsetPoint1", defaultValue: Self.insetPoint1Default)
			}
			set {
				self.setKeyedValue(newValue.ciVector, for: "inputInsetPoint1")
			}
		}

		/// insetPoint1 default value
		@objc public static let insetPoint1Default = CGPoint(x: 400.0, y: 400.0)

		// MARK: - strands (inputStrands)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputStrands`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `-10.0`
		/// - Maximum value: `10.0`
		@objc public var strands: Double {
			get {
				let number = self.filter.value(forKey: "inputStrands") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: Droste.strandsRange)
				self.filter.setValue(number, forKey: "inputStrands")
			}
		}

		/// `strands` range definition
		public static let strandsRange: ClosedRange<Double> = -10.0 ... 10.0

		// MARK: - periodicity (inputPeriodicity)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputPeriodicity`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `1.0`
		@objc public var periodicity: Double {
			get {
				let number = self.filter.value(forKey: "inputPeriodicity") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: Droste.periodicityRange)
				self.filter.setValue(number, forKey: "inputPeriodicity")
			}
		}

		/// `periodicity` range definition
		public static let periodicityRange: PartialRangeFrom<Double> = Double(1.0)...

		// MARK: - rotation (inputRotation)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputRotation`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeAngle`
		/// - Default value: `0`
		@objc public var rotation: Double {
			get {
				let number = self.filter.value(forKey: "inputRotation") as? NSNumber
				return number?.doubleValue ?? 0
			}
			set {
				self.setKeyedValue(NSNumber(value: newValue), for: "inputRotation")
			}
		}

		// MARK: - zoom (inputZoom)

		/// No Description
		///
		/// CIFilter attribute information
		/// - Attribute key: `inputZoom`
		/// - Internal class: `NSNumber`
		/// - Type: `CIAttributeTypeScalar`
		/// - Default value: `1`
		/// - Minimum value: `0.01`
		@objc public var zoom: Double {
			get {
				let number = self.filter.value(forKey: "inputZoom") as? NSNumber
				return number?.doubleValue ?? 1
			}
			set {
				let number = NSNumber(value: newValue).clamped(bounds: Droste.zoomRange)
				self.filter.setValue(number, forKey: "inputZoom")
			}
		}

		/// `zoom` range definition
		public static let zoomRange: PartialRangeFrom<Double> = Double(0.01)...

		// MARK: - Convenience initializer

		/// Create an instance of the filter
		@objc public convenience init?(
			image: CIImage,
			insetPoint0: CGPoint = Droste.insetPoint0Default,
			insetPoint1: CGPoint = Droste.insetPoint1Default,
			strands: Double = 1,
			periodicity: Double = 1,
			rotation: Double = 0,
			zoom: Double = 1
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
