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

@available(macOS 10.6, iOS 9, *)
@objc public extension CIFilterFactory {
	///
	/// Droste
	///
	/// Performs M.C. Escher Droste style deformation
	///
	/// **Links**
	///
	/// [CIDroste Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDroste)
	///
	/// [CIFilter.io documentation](https://cifilter.io/CIDroste/)
	///
	@objc(CIFilterFactory_CIDroste) class CIDroste: FilterCore {
		@objc public init?() {
			super.init(name: "CIDroste")
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
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [200 200]
		@objc public dynamic var inputInsetPoint0: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputInsetPoint0")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputInsetPoint0")
			}
		}

		///
		/// No Description
		///
		///   Class:    CIVector
		///   Type:     CIAttributeTypePosition
		///   Default:  [400 400]
		@objc public dynamic var inputInsetPoint1: CIFilterFactory.Point? {
			get {
				return CIFilterFactory.Point(with: self.filter, key: "inputInsetPoint1")
			}
			set {
				self.filter.setValue(newValue?.vector, forKey: "inputInsetPoint1")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: -10.0
		///   maxValue: 10.0
		///
		static let inputStrands_Range: ClosedRange<Float> = -10.0 ... 10.0
		@objc public dynamic var inputStrands: NSNumber? {
			get {
				return self.filter.value(forKey: "inputStrands") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDroste.inputStrands_Range), forKey: "inputStrands")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		///   minValue: 1.0
		///
		static let inputPeriodicity_Range: PartialRangeFrom<Float> = Float(1.0)...
		@objc public dynamic var inputPeriodicity: NSNumber? {
			get {
				return self.filter.value(forKey: "inputPeriodicity") as? NSNumber
			}
			set {
				self.filter.setValue(newValue?.clamped(bounds: CIDroste.inputPeriodicity_Range), forKey: "inputPeriodicity")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeAngle
		///   Default:  0
		@objc public dynamic var inputRotation: NSNumber? {
			get {
				return self.filter.value(forKey: "inputRotation") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputRotation")
			}
		}

		///
		/// No Description
		///
		///   Class:    NSNumber
		///   Type:     CIAttributeTypeScalar
		///   Default:  1
		@objc public dynamic var inputZoom: NSNumber? {
			get {
				return self.filter.value(forKey: "inputZoom") as? NSNumber
			}
			set {
				self.filter.setValue(newValue, forKey: "inputZoom")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			inputImage: CIImage,
			inputInsetPoint0: CIFilterFactory.Point = CIFilterFactory.Point(x: 200.0, y: 200.0),
			inputInsetPoint1: CIFilterFactory.Point = CIFilterFactory.Point(x: 400.0, y: 400.0),
			inputStrands: NSNumber = 1,
			inputPeriodicity: NSNumber = 1,
			inputRotation: NSNumber = 0,
			inputZoom: NSNumber = 1
		) {
			self.init()

			self.inputImage = inputImage
			self.inputInsetPoint0 = inputInsetPoint0
			self.inputInsetPoint1 = inputInsetPoint1
			self.inputStrands = inputStrands
			self.inputPeriodicity = inputPeriodicity
			self.inputRotation = inputRotation
			self.inputZoom = inputZoom
		}
	}
}
