//
//  Clamp.swift
//
//  Created by Darren Ford on 6/7/20.
//  Copyright © 2020 Darren Ford. All rights reserved.
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

extension ExpressibleByIntegerLiteral where Self: FloatingPoint {
	// Regular range  x..<y

	@inlinable func clamped(to range: Range<Self>) -> Self {
		let upper = range.upperBound.nextDown
		return min(max(self, range.lowerBound), upper)
	}

	// Range up to  ..<y

	@inlinable func clamped(to range: PartialRangeUpTo<Self>) -> Self {
		return min(self, range.upperBound.nextDown)
	}
}

extension ExpressibleByIntegerLiteral where Self: Strideable {
	// Regular range  x..<y

	@inlinable func clamped(to range: Range<Self>) -> Self {
		let upper = range.upperBound.advanced(by: -1)
		return min(max(self, range.lowerBound), upper)
	}

	// Range up to  ..<y

	@inlinable func clamped(to range: PartialRangeUpTo<Self>) -> Self {
		return min(self, range.upperBound.advanced(by: -1))
	}
}

extension ExpressibleByIntegerLiteral where Self: Comparable {
	// Closed range  x...y

	@inlinable func clamped(to range: ClosedRange<Self>) -> Self {
		return min(max(self, range.lowerBound), range.upperBound)
	}

	// Partial range through  ...y

	@inlinable func clamped(to range: PartialRangeThrough<Self>) -> Self {
		return min(range.upperBound, self)
	}

	// Partial range from  x...

	@inlinable func clamped(to range: PartialRangeFrom<Self>) -> Self {
		return max(range.lowerBound, self)
	}
}
