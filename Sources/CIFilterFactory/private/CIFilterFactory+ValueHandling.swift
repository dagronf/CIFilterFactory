//
//  CIFilterFactory+ValueHandling.swift
//
//  Copyright © 2024 Darren Ford. All rights reserved.
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

#if canImport(CoreImage)

import CoreImage
import Foundation

internal extension CIFF.Core {
	@inline(__always) func numberValue(forKey key: String) -> NSNumber? {
		return self.validatedGenericKeyValue(forKey: key) as? NSNumber
	}
}

// MARK: - Bool

internal extension CIFF.Core {
	@inline(__always) func boolValue(forKey key: String, defaultValue: Bool) -> Bool {
		self.numberValue(forKey: key)?.boolValue ?? defaultValue
	}
}

// MARK: - Double

internal extension CIFF.Core {
	@inline(__always) func doubleValue(forKey key: String, defaultValue: Double) -> Double {
		self.numberValue(forKey: key)?.doubleValue ?? defaultValue
	}

	@inline(__always) func setDoubleValue(_ value: Double, bounds: PartialRangeFrom<Double>, forKey key: String) {
		let number = NSNumber(value: value.clamped(to: bounds))
		self.setValidatedGenericKeyValue(number, forKey: key)
	}

	@inline(__always) func setDoubleValue(_ value: Double, bounds: ClosedRange<Double>, forKey key: String) {
		let number = NSNumber(value: value.clamped(to: bounds))
		self.setValidatedGenericKeyValue(number, forKey: key)
	}

	@inline(__always) func setDoubleValue(_ value: Double, bounds: PartialRangeThrough<Double>, forKey key: String) {
		let number = NSNumber(value: value.clamped(to: bounds))
		self.setValidatedGenericKeyValue(number, forKey: key)
	}
}

// MARK: - UInt

internal extension CIFF.Core {
	@inline(__always) func uintValue(forKey key: String, defaultValue: UInt) -> UInt {
		self.numberValue(forKey: key)?.uintValue ?? defaultValue
	}

	@inline(__always) func setUIntValue(_ value: UInt, bounds: PartialRangeFrom<UInt>, forKey key: String) {
		let number = NSNumber(value: value.clamped(to: bounds))
		self.setValidatedGenericKeyValue(number, forKey: key)
	}

	@inline(__always) func setUIntValue(_ value: UInt, bounds: ClosedRange<UInt>, forKey key: String) {
		let number = NSNumber(value: value.clamped(to: bounds))
		self.setValidatedGenericKeyValue(number, forKey: key)
	}

	@inline(__always) func setUIntValue(_ value: UInt, bounds: PartialRangeThrough<UInt>, forKey key: String) {
		let number = NSNumber(value: value.clamped(to: bounds))
		self.setValidatedGenericKeyValue(number, forKey: key)
	}
}

// MARK: - Int

internal extension CIFF.Core {
	@inline(__always) func intValue(forKey key: String, defaultValue: Int) -> Int {
		self.numberValue(forKey: key)?.intValue ?? defaultValue
	}

	@inline(__always) func setIntValue(_ value: Int, bounds: PartialRangeFrom<Int>, forKey key: String) {
		let number = NSNumber(value: value.clamped(to: bounds))
		self.setValidatedGenericKeyValue(number, forKey: key)
	}

	@inline(__always) func setIntValue(_ value: Int, bounds: ClosedRange<Int>, forKey key: String) {
		let number = NSNumber(value: value.clamped(to: bounds))
		self.setValidatedGenericKeyValue(number, forKey: key)
	}

	@inline(__always) func setIntValue(_ value: Int, bounds: PartialRangeThrough<Int>, forKey key: String) {
		guard self.supportsKey(key) else { return }
		let number = NSNumber(value: value.clamped(to: bounds))
		self.setValidatedGenericKeyValue(number, forKey: key)
	}
}

// MARK: - String

internal extension CIFF.Core {
	// Returns the string value for the filter with the specified key
	@inline(__always) func stringValue(forKey key: String) -> String? {
		let tmp: NSString? = self.keyedValue(key)
		return tmp as String?
	}
}

// MARK: - Data

internal extension CIFF.Core {
	// Returns the data value for the filter with the specified key
	@inline(__always) func dataValue(forKey key: String) -> Data? {
		let tmp: NSData? = self.keyedValue(key)
		return tmp as? Data
	}
}

// MARK: - CGPoint

internal extension CIFF.Core {
	// Returns the CGPoint value for the filter with the specified key
	@inline(__always) func cgPointValue(forKey key: String, defaultValue: CGPoint) -> CGPoint {
		guard let value = self.validatedGenericKeyValue(forKey: key) as? CIVector else { return defaultValue }
		return value.cgPointValue
	}
}

// MARK: - CGRect

internal extension CIFF.Core {
	// Returns the CGPoint value for the filter with the specified key
	@inline(__always) func cgRectValue(forKey key: String, defaultValue: CGRect) -> CGRect {
		guard let value = self.validatedGenericKeyValue(forKey: key) as? CIVector else { return defaultValue }
		return value.cgRectValue
	}
}

// MARK: - CIPosition3

internal extension CIFF.Core {
	// Returns the CGPoint value for the filter with the specified key
	@inline(__always) func cgPosition3Value(forKey key: String, defaultValue: CIFF.CIPosition3) -> CIFF.CIPosition3 {
		guard
			let value = self.validatedGenericKeyValue(forKey: key) as? CIVector,
			let position = CIFF.CIPosition3(value)
		else {
			return defaultValue
		}
		return position
	}
}

#endif // canImport(CoreImage)
