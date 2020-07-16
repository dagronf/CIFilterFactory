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

import CoreImage

#if !os(macOS)
// For access to NSValue.cgAffineTransformValue
import UIKit
#endif

public extension CIFilterFactory {
	@objc(CIFilterFactoryVector) class Vector: NSObject {
		var vector: CIVector
		init(vector: CIVector) {
			self.vector = vector
			super.init()
		}

		init?(with filter: CIFilter, key: String) {
			if let vec = filter.value(forKey: key) as? CIVector {
				self.vector = vec
				super.init()
			}
			else {
				return nil
			}
		}
	}

	/// A wrapped Rect class
	@objc(CIFilterFactoryRect) class Rect: Vector {
		@objc public var rect: CGRect {
			return super.vector.cgRectValue
		}

		@objc public init(_ rect: CGRect) {
			super.init(vector: CIVector(cgRect: rect))
		}

		@objc public init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
			super.init(vector: CIVector(cgRect: CGRect(x: x, y: y, width: width, height: height)))
		}

		override init?(with filter: CIFilter, key: String) {
			super.init(with: filter, key: key)
		}
	}

	/// A wrapped Point class
	@objc(CIFilterFactoryPoint) class Point: Vector {
		@objc public var point: CGPoint {
			return super.vector.cgPointValue
		}

		@objc public init(_ point: CGPoint) {
			super.init(vector: CIVector(cgPoint: point))
		}

		@objc public init(x: CGFloat, y: CGFloat) {
			super.init(vector: CIVector(cgPoint: CGPoint(x: x, y: y)))
		}

		override init?(with filter: CIFilter, key: String) {
			super.init(with: filter, key: key)
		}
	}
}

public extension CIFilterFactory {
	/// A wrapped AffineTransform class to abstract away affine transform differences per platform
	@objc(CIFilterFactoryAffineTransform) class AffineTransform: NSObject {
		#if os(macOS)
			@objc var transform: NSAffineTransform
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
