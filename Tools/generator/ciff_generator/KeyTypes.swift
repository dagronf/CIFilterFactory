//
//  KeyTypes.swift
//  ciff_generator
//
//  Created by Darren Ford on 9/4/2022.
//

import Foundation
import CoreImage

class CoreType {

	let key: String
	let keyAttributes: [String: Any]
	let inputKeyType: InputKeyType

	init(key: String, keyAttributes: [String: Any], inputKeyType: InputKeyType) {
		self.key = key
		self.keyAttributes = keyAttributes
		self.inputKeyType = inputKeyType
	}

	open func defaultValueString() -> String? { return nil }
	open func minValueString() -> String? { return nil }
	open func maxValueString() -> String? { return nil }

	//
	open func generateDefinition(userFriendlyKey: String, staticName: String) -> String {
		let out = FileSquirter(name: "dummy")

		out.print("   @objc public var \(userFriendlyKey): \(inputKeyType.class)? {")
		out.print("      get {")
		if let m = inputKeyType.mappedClass {
			out.print(#"         let tmp: \#(inputKeyType.keyClass)? = self.keyedValue("\#(inputKeyType.attributeKey)")"#)
			out.print(#"         return tmp as \#(m)?"#)
		}
		else {
			out.print(#"         return self.keyedValue("\#(key)")"#)
		}
		out.print("      }")

		out.print("      set {")
		if let _ = rangeDefinition() {
			out.print("      self.filter.setValue(newValue?.clamped(bounds: \(staticName).\(userFriendlyKey)Range), forKey: \"\(inputKeyType.attributeKey)\")")
		}
		else {
			if let _ = inputKeyType.mappedClass {
				out.print(#"         self.setKeyedValue(newValue as \#(inputKeyType.keyClass)?, for: "\#(inputKeyType.attributeKey)")"#)
			}
			else {
				out.print(#"         self.setKeyedValue(newValue, for: "\#(inputKeyType.attributeKey)")"#)
			}
		}
		out.print("      }")
		out.print("   }")
		return out.content
	}


	// Returns nil or eg. ClosedRange<Double> = 4.0 ... 100.0
	open func rangeDefinition() -> String? { nil }

	lazy var description: String = {
		keyAttributes[kCIAttributeDescription] as? String ?? "No Description"
	}()

	var minValue: Any? { keyAttributes[kCIAttributeMin] }
	var maxValue: Any? { keyAttributes[kCIAttributeMax] }
	var defaultValue: Any? { keyAttributes[kCIAttributeDefault] }
}

///

class BoolGeneratorType: ValueGeneratorType<Bool> {
	init(key: String, keyAttributes: [String: Any], inputKeyType: InputKeyType) {
		super.init(coreType: "Bool", key: key, keyAttributes: keyAttributes, inputKeyType: inputKeyType)
	}

	override func defaultValueString() -> String? {
		if let d = defaultValue as? String {
			return d == "1" ? "true" : "false"
		}
		return "false"
	}

	override func minValueString() -> String? { nil }
	override func maxValueString() -> String? { nil }
	override func rangeDefinition() -> String? { nil }

	override func generateDefinition(userFriendlyKey: String, staticName: String) -> String {
		let out = FileSquirter(name: "dummy")
		let defaultValue =  self.defaultValueString() ?? "false"
		out.print("   @objc public var \(userFriendlyKey): Bool {")
		out.print("      get {")
		out.print("         let number = self.filter.value(forKey: \"\(key)\") as? NSNumber")
		out.print("         return number?.boolValue ?? Self.\(userFriendlyKey)Default")
		out.print("      }")
		out.print("      set {")
		out.print(#"         self.setKeyedValue(NSNumber(value: newValue), for: "\#(key)")"#)
		out.print("      }")
		out.print("   }")
		out.print("")
		out.print("   /// `\(userFriendlyKey)` default value")
		out.print("   @objc static public let \(userFriendlyKey)Default: Bool = \(defaultValue)")
		return out.content
	}
}

class IntGeneratorType: ValueGeneratorType<Int> {
	init(key: String, keyAttributes: [String: Any], inputKeyType: InputKeyType) {
		super.init(coreType: "Int", key: key, keyAttributes: keyAttributes, inputKeyType: inputKeyType)
	}

	override func generateDefinition(userFriendlyKey: String, staticName: String) -> String {
		let out = FileSquirter(name: "dummy")

		let defaultValue = self.defaultValueString() ?? "0"
		out.print("   @objc public var \(userFriendlyKey): Int {")
		out.print("      get {")
		out.print(#"        let number = self.filter.value(forKey: "\#(key)") as? NSNumber"#)
		out.print("         return number?.intValue ?? Self.\(userFriendlyKey)Default")
		out.print("      }")
		out.print("      set {")
		if let _ = rangeDefinition() {
			out.print("         let number = NSNumber(value: newValue).clamped(bounds: \(staticName).\(userFriendlyKey)Range)")
			out.print("         self.filter.setValue(number, forKey: \"\(key)\")")
		}
		else {
			out.print("         self.setKeyedValue(NSNumber(value: newValue), for: \"\(key)\"")
		}
		out.print("      }")
		out.print("   }")
		out.print("")
		out.print("   /// `\(userFriendlyKey)` default value")
		out.print("   @objc static public let \(userFriendlyKey)Default: Int = \(defaultValue)")
		return out.content
	}

}

class UIntGeneratorType: ValueGeneratorType<UInt> {
	init(key: String, keyAttributes: [String: Any], inputKeyType: InputKeyType) {
		super.init(coreType: "UInt", key: key, keyAttributes: keyAttributes, inputKeyType: inputKeyType)
	}

	override func generateDefinition(userFriendlyKey: String, staticName: String) -> String {
		let out = FileSquirter(name: "dummy")

		let defaultValue = self.defaultValueString() ?? "0"
		out.print("   @objc public var \(userFriendlyKey): UInt {")
		out.print("      get {")
		out.print("         let number = self.filter.value(forKey: \"\(key)\") as? NSNumber")
		out.print("         return number?.uintValue ?? Self.\(userFriendlyKey)Default")
		out.print("      }")
		out.print("      set {")
		if let _ = rangeDefinition() {
			out.print("         let number = NSNumber(value: newValue).clamped(bounds: \(staticName).\(userFriendlyKey)Range)")
			out.print("         self.filter.setValue(number, forKey: \"\(key)\")")
		}
		else {
			out.print(#"         self.setKeyedValue(NSNumber(value: newValue), for: "\#(key)")"#)
		}
		out.print("      }")
		out.print("   }")
		out.print("")
		out.print("   /// `\(userFriendlyKey)` default value")
		out.print("   @objc static public let \(userFriendlyKey)Default: UInt = \(defaultValue)")
		return out.content
	}
}

class DoubleGeneratorType: ValueGeneratorType<Double> {
	init(key: String, keyAttributes: [String: Any], inputKeyType: InputKeyType) {
		super.init(coreType: "Double", key: key, keyAttributes: keyAttributes, inputKeyType: inputKeyType)
	}
	override func generateDefinition(userFriendlyKey: String, staticName: String) -> String {
		let out = FileSquirter(name: "dummy")
		let defaultValue = self.defaultValueString() ?? "0"
		out.print("   @objc public var \(userFriendlyKey): Double {")
		out.print("      get {")
		out.print("         let number = self.filter.value(forKey: \"\(key)\") as? NSNumber")
		out.print("         return number?.doubleValue ?? Self.\(userFriendlyKey)Default")
		out.print("      }")
		out.print("      set {")
		if let _ = rangeDefinition() {
			out.print("         let number = NSNumber(value: newValue).clamped(bounds: \(staticName).\(userFriendlyKey)Range)")
			out.print("         self.filter.setValue(number, forKey: \"\(key)\")")
		}
		else {
			out.print(#"         self.setKeyedValue(NSNumber(value: newValue), for: "\#(key)")"#)
		}
		out.print("      }")
		out.print("   }")
		out.print("")
		out.print("   /// `\(userFriendlyKey)` default value")
		out.print("   @objc static public let \(userFriendlyKey)Default: Double = \(defaultValue)")
		return out.content
	}
}

////////

class ValueGeneratorType<ValueType>: CoreType {
	let coreType: String
	init(coreType: String, key: String, keyAttributes: [String: Any], inputKeyType: InputKeyType) {
		self.coreType = coreType
		super.init(key: key, keyAttributes: keyAttributes, inputKeyType: inputKeyType)
	}
	override func defaultValueString() -> String? {
		if let d = defaultValue as? ValueType {
			return "\(d)"
		}
		return nil
	}

	override func minValueString() -> String? {
		if let d = minValue as? ValueType {
			return "\(d)"
		}
		return nil
	}

	override func maxValueString() -> String? {
		if let d = maxValue as? ValueType {
			return "\(d)"
		}
		return nil
	}

	override func rangeDefinition() -> String? {
		if let mi = minValueString() {
			if let ma = maxValueString() {
				return ": ClosedRange<\(coreType)> = \(mi) ... \(ma)"
			}
			else {
				return "= PartialRangeFrom<\(coreType)>(\(mi))"
			}
		}
		else if let ma = maxValueString() {
			return "= PartialRangeTo<\(coreType)>(\(ma))"
		}
		return nil
	}
}


// MARK: - CGRect handling

class RectGeneratorType: CoreType {

	override func defaultValueString() -> String? {
		if let d = (defaultValue as? CIVector)?.cgRectValue {
			return "CGRect(x: \(d.origin.x), y: \(d.origin.y), width: \(d.width), height: \(d.height))"
		}
		return nil
	}

	override func generateDefinition(userFriendlyKey: String, staticName: String) -> String {
		let out = FileSquirter(name: "dummy")

		let defaultValue = (self.defaultValue as? CIVector)?.cgRectValue ?? .zero
		out.print("   @objc public var \(userFriendlyKey): CGRect {")
		out.print("      get {")
		out.print("         return CGRect(with: self.filter, key: \"\(key)\", defaultValue: Self.\(userFriendlyKey)Default)")
		out.print("      }")
		out.print("      set {")
		out.print(#"         self.setKeyedValue(newValue.ciVector, for: "\#(key)")"#)
		out.print("      }")
		out.print("   }")
		out.print("")
		out.print("   /// `\(userFriendlyKey)` default value")
		out.print("   @objc static public let \(userFriendlyKey)Default = CGRect(x: \(defaultValue.origin.x), y: \(defaultValue.origin.y), width: \(defaultValue.width), height: \(defaultValue.height))")

		return out.content
	}
}

class AffineGeneratorType: CoreType {

	override func defaultValueString() -> String? {
		if let f = self.defaultValue as? AffineTransform {
			return "CIFF.CIAffineTransform(m11: \(f.m11), m12: \(f.m12), m21: \(f.m21), m22: \(f.m22), tX: \(f.tX), tY: \(f.tY))"
		}
		return nil
	}

	override func generateDefinition(userFriendlyKey: String, staticName: String) -> String {
		let out = FileSquirter(name: "dummy")
		out.print("   @objc public var \(userFriendlyKey): CIAffineTransform? {")
		out.print("      get {")
		out.print("         return CIAffineTransform(filter: self.filter, key: \"\(key)\")")
		out.print("      }")
		out.print("      set {")
		out.print(#"         self.setKeyedValue(newValue?.embeddedValue, for: "\#(key)")"#)
		out.print("      }")
		out.print("   }")

		if let dv = self.defaultValueString() {
			out.print("")
			out.print("   /// `\(userFriendlyKey)` default value")
			out.print("   @objc static public let \(userFriendlyKey)Default = \(dv)")
		}
		return out.content
	}

}


class PositionGeneratorType: CoreType {

	override func defaultValueString() -> String? {
		if let f = self.defaultValue as? CIVector {
			return "CGPoint(x: \(f.cgPointValue.x), y: \(f.cgPointValue.x))"
		}
		return nil
	}

	override func generateDefinition(userFriendlyKey: String, staticName: String) -> String {
		let out = FileSquirter(name: "dummy")
		let defaultValue = (self.defaultValue as? CIVector)?.cgPointValue ?? .zero
		out.print("   @objc public var \(userFriendlyKey): CGPoint {")
		out.print("      get {")
		out.print("         return CGPoint(with: self.filter, key: \"\(key)\", defaultValue: Self.\(userFriendlyKey)Default)")
		out.print("      }")
		out.print("      set {")
		out.print("         self.setKeyedValue(newValue.ciVector, for: \"\(key)\")")
		out.print("      }")
		out.print("   }")
		out.print("")
		out.print("   /// `\(userFriendlyKey)` default value")
		out.print("   @objc static public let \(userFriendlyKey)Default = CGPoint(x: \(defaultValue.x), y: \(defaultValue.y))")
		return out.content
	}

}

class ImageGeneratorType: CoreType {

	override func generateDefinition(userFriendlyKey: String, staticName: String) -> String {
		let out = FileSquirter(name: "dummy")
		out.print("   @objc public var \(userFriendlyKey): CGImageMetadata? {")
		out.print("      get {")
		out.print(#"         return self.keyedValue("\#(key)")"#)
		out.print("      }")
		out.print("      set {")
		out.print(#"         self.setKeyedValue(newValue, for: "\#(key)")"#)
		out.print("      }")
		out.print("   }")
		return out.content
	}
}
