//
//  CIFilterFactory+Types.swift
//
//  Created by Darren Ford on 16/7/20.
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

import Foundation
import CoreImage

#if !os(macOS)
// For access to NSValue.cgAffineTransformValue
import UIKit
#endif

public extension CIFF {
	
	/// A wrapped AffineTransform class to abstract away affine transform differences per platform
	@objc(CIFFCIAffineTransform) class CIAffineTransform: NSObject {

		static func Create(m11: CGFloat, m12: CGFloat, m21: CGFloat, m22: CGFloat, tX: CGFloat, tY: CGFloat) -> CIAffineTransform {
#if os(macOS)
			return CIAffineTransform(
				NSAffineTransform(transform: Foundation.AffineTransform(m11: m11, m12: m12, m21: m21, m22: m22, tX: tX, tY: tY)))
#else
			return CIAffineTransform(CGAffineTransform(a: m11, b: m12, c: m21, d: m22, tx: tX, ty: tY))
#endif
		}

#if os(macOS)
		@objc var transform: NSAffineTransform

		@objc public init(m11: CGFloat, m12: CGFloat, m21: CGFloat, m22: CGFloat, tX: CGFloat, tY: CGFloat) {
			self.transform = NSAffineTransform(transform: Foundation.AffineTransform(m11: m11, m12: m12, m21: m21, m22: m22, tX: tX, tY: tY))
			super.init()
		}

		@objc public init(_ transform: NSAffineTransform) {
			self.transform = transform
			super.init()
		}
		
		@objc public convenience init?(filter: CIFilter, key: String) {
			guard let value = filter.value(forKey: key) as? NSAffineTransform else {
				return nil
			}
			self.init(value)
		}
		
		func embeddedValue() -> AnyObject {
			return self.transform
		}
#else
		@objc var transform: CGAffineTransform

		@objc public init(m11: CGFloat, m12: CGFloat, m21: CGFloat, m22: CGFloat, tX: CGFloat, tY: CGFloat) {
			self.transform = CGAffineTransform(a: m11, b: m12, c: m21, d: m22, tx: tX, ty: tY)
			super.init()
		}

		@objc public init(_ transform: CGAffineTransform) {
			self.transform = transform
			super.init()
		}
		
		@objc public convenience init?(filter: CIFilter, key: String) {
			guard let value = filter.value(forKey: key) as? NSValue else {
				return nil
			}
			self.init(value.cgAffineTransformValue)
		}
		
		func embeddedValue() -> AnyObject {
			return NSValue(cgAffineTransform: self.transform)
		}
#endif
	}
}

extension CGPoint {
	/// Convert this CGPoint value to a CIVector
	@inline(__always) internal var ciVector: CIVector { return CIVector(cgPoint: self) }
}

extension CGRect {
	/// Convert this CGRect value to a CIVector
	@inline(__always) internal var ciVector: CIVector { return CIVector(cgRect: self) }
}

public extension CIFF {
	/// A three-dimensional location in the working coordinate space. (A 3-element vector type.)
	///
	/// A wrapper for a `CIAttributeTypePosition3` type.
	///
	/// See: [CIAttributeTypePosition3](https://developer.apple.com/documentation/coreimage/kciattributetypeposition3)
	@objc(CIFFCIPosition3) class CIPosition3: NSObject {
		/// The x value
		@objc public let x: CGFloat
		/// The y value
		@objc public let y: CGFloat
		/// The z value
		@objc public let z: CGFloat

		/// A CIVector representation of this object
		@objc lazy public var ciVector: CIVector = {
			CIVector(values: [self.x, self.y, self.z], count: 3)
		}()

		/// Create a CIPosition3 value from x, y and z values
		@objc public init(x: CGFloat, y: CGFloat, z: CGFloat) {
			self.x = x
			self.y = y
			self.z = z
			super.init()
		}

		/// Create a CIPosition3 value from the contents of a CIVector
		///
		/// Returns nil if :-
		///  * The passed vector is nil, or
		///  * The passed vector does not contain exactly three values
		@objc public init?(_ vector: CIVector?) {
			guard let v = vector, v.count == 3 else { return nil }
			self.x = v.value(at: 0)
			self.y = v.value(at: 1)
			self.z = v.value(at: 2)
			super.init()
		}
	}
}
