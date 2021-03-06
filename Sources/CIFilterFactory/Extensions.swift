//
//  Extensions.swift
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

extension NSNumber {

	// PartialRangeFrom

	@inlinable func clamped(bounds: PartialRangeFrom<Float>) -> NSNumber {
		if bounds.lowerBound > self.floatValue {
			return NSNumber(value: bounds.lowerBound)
		}
		return self
	}

	@inlinable func validate(bounds: PartialRangeFrom<Float>) -> Bool {
		return bounds.lowerBound <= self.floatValue
	}

	// PartialRangeThrough

	@inlinable func clamped(bounds: PartialRangeThrough<Float>) -> NSNumber {
		if bounds.upperBound < self.floatValue {
			return NSNumber(value: bounds.upperBound)
		}
		return self
	}

	@inlinable func validate(bounds: PartialRangeThrough<Float>) -> Bool {
		return bounds.upperBound >= self.floatValue
	}

	// ClosedRange

	@inlinable func clamped(bounds: ClosedRange<Float>) -> NSNumber {
		var value = max(bounds.lowerBound, self.floatValue)
		value = min(bounds.upperBound, value)
		return NSNumber(value: value)
	}

	@inlinable func validate(bounds: ClosedRange<Float>) -> Bool {
		return self.floatValue >= bounds.lowerBound && self.floatValue <= bounds.upperBound
	}
}

public extension CIVector {
	convenience init(_ values: [CGFloat]) {
		self.init(values: values, count: values.count)
	}

	var values: [CGFloat] {
		return (0 ..< self.count).map { index in
			self.value(at: index)
		}
	}
	var valuesStr: String {
		let vals = self.values.reduce("") { (result, value) in
			return result.appending("\(result.isEmpty ? "" : ", ") \(value)")
		}
		return vals
	}
}
