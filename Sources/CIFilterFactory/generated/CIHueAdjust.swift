//
//  CIHueAdjust.swift  (AUTOMATICALLY GENERATED FILE)
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
	/// Hue Adjust
	///
	/// Changes the overall hue, or tint, of the source pixels.
	///
	/// **Links**
	///
	/// - [CIHueAdjust Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueAdjust)
	/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/cihueadjust?language=objc)
	/// - [CIFilter.io documentation](https://cifilter.io/CIHueAdjust/)
	///
	@objc(CIFilterFactory_HueAdjust) class HueAdjust: FilterCore {
		@objc public init?() {
			super.init(name: "CIHueAdjust")
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

		// MARK: - angle (inputAngle)

		///
		/// An angle (in radians) to use to correct the hue of an image.
		///
		///   - Attribute key: `inputAngle`
		///   - Internal class: `NSNumber`
		///   - Type: `CIAttributeTypeAngle`
		///   - Default value: `0`
		@objc public var angle: NSNumber? {
			get {
				return self.keyedValue("inputAngle")
			}
			set {
				self.setKeyedValue(newValue, for: "inputAngle")
			}
		}

		// MARK: - Convenience initializer

		@objc public convenience init?(
			image: CIImage,
			angle: NSNumber = 0
		) {
			self.init()

			self.image = image
			self.angle = angle
		}
	}
}
