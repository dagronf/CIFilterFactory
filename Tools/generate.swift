//
//  generate.swift
//  CIFilterGeneratorTool
//
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

import Cocoa

extension String {
	func index(at offset: Int) -> String.Index { self.index(self.startIndex, offsetBy: offset) }
	func substring(from startIndex: String.Index, length: Int) -> String {
		return String(self[startIndex ..< self.index(startIndex, offsetBy: length)])
	}
}

private func parseFilter(filter: CIFilter, staticName: String, out: FileSquirter) {

	out.print("""
//
//  \(staticName).swift  (AUTOMATICALLY GENERATED FILE)
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

import Foundation
import AVFoundation
import CoreML
import CoreImage

""")

	let inputKeys = filter.inputKeys

	let filterAttributes = filter.attributes

	var avail = ""
	if let macAvail = filterAttributes[kCIAttributeFilterAvailable_Mac] as? String {
		if let _ = Float(macAvail) {
			avail += "macOS \(macAvail)"
		}
	}
	if let iosAvail = filterAttributes[kCIAttributeFilterAvailable_iOS] as? String {
		if avail.count > 0 {
			avail += ", "
		}
		if let _ = Float(iosAvail) {
			avail += "iOS \(iosAvail), tvOS \(iosAvail)"
		}
	}

	if !avail.isEmpty {
		out.print("@available(\(avail), *)")
	}
	out.print("@objc public extension CIFF {")

	out.print("   ///")
	if let refDisplay = filterAttributes[kCIAttributeFilterDisplayName] as? String {
		out.print("   /// \(refDisplay)")
		out.print("   ///")
	}
	if let refDesc = CIFilter.localizedDescription(forFilterName: filter.name) {
		out.print("   /// \(refDesc)")
		out.print("   ///")
	}

	out.print("   /// **Links**")
	out.print("   ///")

	if let refDoc = filterAttributes[kCIAttributeReferenceDocumentation] as? URL {
		out.print("   /// - [\(filter.name) Online Documentation](\(refDoc))")
	}

	out.print("   /// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/\(filter.name.lowercased())?language=objc)")
	out.print("   /// - [CIFilter.io documentation](https://cifilter.io/\(filter.name)/)")
	out.print("   ///")

	if !avail.isEmpty {
		out.print("@available(\(avail), *)")
	}
	out.print("   @objc(CIFF\(staticName)) public class \(staticName): Core {")
	out.print("      /// Create an instance of the filter")
	out.print("      @objc public init?() {")
	out.print("         super.init(name: \"\(filter.name)\")")
	out.print("      }")

	if inputKeys.count > 0 {
		out.print("   // MARK: - Inputs")
		out.print("")
	}

	struct InitType {
		let attributeKey: String
		let name: String
		let description: String
		let `class`: String
		let subtype: String?
		let `default`: Any?
	}

	var initializers = [InitType]()

	for key2 in inputKeys {

		let userFriendlyKey: String = {
			if key2.hasPrefix("input") {
				let v = key2.suffix(from: key2.index(at: 5))
				return v.prefix(1).lowercased() + v.dropFirst()
			}
			return key2
		}()

		out.print("   // MARK: - \(userFriendlyKey) (\(key2))")

		guard let keyItem = filterAttributes[key2] as? [String: Any],
				let keyClass = keyItem[kCIAttributeClass] as? String else {
			out.print(#"   /// \#(key2) has no type or class defined. "#)
			continue
		}

		let keyDesc = keyItem[kCIAttributeDescription] as? String ?? "No Description"
		let keySubType = keyItem[kCIAttributeType] as? String
		let keyDefaultValue = keyItem[kCIAttributeDefault]

		// Mapping for some standard swift types that bridge to objective-c
		var mappedClass: String?

		if keyClass == "NSData" {
			mappedClass = "Data"
		}
		else if keyClass == "NSString" {
			mappedClass = "String"
		}

		// Write out the description for the key

		initializers.append(
			InitType(
				attributeKey: key2,
				name: userFriendlyKey,
				description: keyDesc,
				class: mappedClass ?? keyClass,
				subtype: keySubType,
				default: keyDefaultValue
			)
		)

		out.print("   /// \(keyDesc)")
		out.print("   ///")
		out.print("   /// CIFilter attribute information")
		out.print("   /// - Attribute key: `\(key2)`")
		out.print("   /// - Internal class: `\(keyClass)`")
		if let t = keySubType {
			out.print("   /// - Type: `\(t)`")
		}
		if let def = keyDefaultValue {
			if keyClass == "NSAffineTransform" {
				let tr = (def as! AffineTransform)
				out.print("   /// - Default value: `\(tr)`")
			}
			else if keyClass == "CIColor" {
				let tr = (def as! CIColor)
				out.print("   /// - Default value: `rgba(\(tr.stringRepresentation))`")
			}
			else if let cs = maybeCast(def, to: CGColorSpace.self) {
				// <CGColorSpace 0x7f897ffeed70> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)
				let s = "\(cs)"
				let ww = s.split(separator: ">")
				out.print("   /// - Default value: `\(ww[1])`")
			}
			else {
				out.print("   /// - Default value: `\(def)`")
			}
		}
		if let range = getRangeInfo(keyAttributes: keyItem) {
			if let mi = range.0 {
				out.print("   /// - Minimum value: `\(mi)`")
			}
			if let ma = range.1 {
				out.print("   /// - Maximum value: `\(ma)`")
			}
		}

		let dummy = FileSquirter(name: "")
		let rangeDef = handleRange(out: dummy, key: userFriendlyKey, keyAttributes: keyItem)

		if keySubType == "CIAttributeTypeRectangle" {
			let defaultValue = (keyDefaultValue as? CIVector)?.cgRectValue ?? .zero
			out.print("   @objc public var \(userFriendlyKey): CGRect {")
			out.print("      get {")
			out.print("         return CGRect(with: self.filter, key: \"\(key2)\", defaultValue: Self.\(userFriendlyKey)Default)")
			out.print("      }")
			out.print("      set {")
			out.print(#"         self.setKeyedValue(newValue.ciVector, for: "\#(key2)")"#)
			out.print("      }")
			out.print("   }")
			out.print("")
			out.print("   /// `\(userFriendlyKey)` default value")
			out.print("   @objc static public let \(userFriendlyKey)Default = CGRect(x: \(defaultValue.origin.x), y: \(defaultValue.origin.y), width: \(defaultValue.width), height: \(defaultValue.width))")
			out.print("")
		}
		else if keyClass == "NSAffineTransform" {
			out.print("   @objc public var \(userFriendlyKey): CIAffineTransform? {")
			out.print("      get {")
			out.print("         return CIAffineTransform(filter: self.filter, key: \"\(key2)\")")
			out.print("      }")
			out.print("      set {")
			out.print(#"         self.setKeyedValue(newValue?.embeddedValue, for: "\#(key2)")"#)
			out.print("      }")
			out.print("   }")
		}
		else if keySubType == "CIAttributeTypePosition" || keySubType == kCIAttributeTypeOffset {
			let defaultValue = (keyDefaultValue as? CIVector)?.cgPointValue ?? .zero
			out.print("   @objc public var \(userFriendlyKey): CGPoint {")
			out.print("      get {")
			out.print("         return CGPoint(with: self.filter, key: \"\(key2)\", defaultValue: Self.\(userFriendlyKey)Default)")
			out.print("      }")
			out.print("      set {")
			out.print("         self.setKeyedValue(newValue.ciVector, for: \"\(key2)\")")
			out.print("      }")
			out.print("   }")
			out.print("")
			out.print("   /// `\(userFriendlyKey)` default value")
			out.print("   @objc static public let \(userFriendlyKey)Default = CGPoint(x: \(defaultValue.x), y: \(defaultValue.y))")
			out.print("")
		}
		else if keyClass == "CGImageMetadataRef" {
			out.print("   @objc public var \(userFriendlyKey): CGImageMetadata? {")
			out.print("      get {")
			out.print(#"         return self.keyedValue("\#(key2)")"#)
			out.print("      }")
			out.print("      set {")
			out.print(#"         self.setKeyedValue(newValue, for: "\#(key2)")"#)
			out.print("      }")
			out.print("   }")
		}
		else if keyClass == "NSNumber",
				  keySubType == kCIAttributeTypeScalar ||
					keySubType == kCIAttributeTypeDistance ||
					keySubType == kCIAttributeTypeTime ||
					keySubType == kCIAttributeTypeAngle
		{
			let defaultValue = keyDefaultValue ?? "0"
			out.print("   @objc public var \(userFriendlyKey): Double {")
			out.print("      get {")
			out.print("         let number = self.filter.value(forKey: \"\(key2)\") as? NSNumber")
			out.print("         return number?.doubleValue ?? Self.\(userFriendlyKey)Default")
			out.print("      }")
			out.print("      set {")
			if let rangeDef = rangeDef {
				out.print("         let number = NSNumber(value: newValue).clamped(bounds: \(staticName).\(rangeDef))")
				out.print("         self.filter.setValue(number, forKey: \"\(key2)\")")
			}
			else {
				out.print(#"         self.setKeyedValue(NSNumber(value: newValue), for: "\#(key2)")"#)
			}
			out.print("      }")
			out.print("   }")
			out.print("")
			out.print("   /// `\(userFriendlyKey)` default value")
			out.print("   @objc static public let \(userFriendlyKey)Default: Double = \(defaultValue)")
			out.print("")
		}
		else if keyClass == "NSNumber",
				  keySubType == kCIAttributeTypeInteger
		{
			let defaultValue = keyDefaultValue ?? "0"
			out.print("   @objc public var \(userFriendlyKey): Int {")
			out.print("      get {")
			out.print(#"        let number = self.filter.value(forKey: "\#(key2)") as? NSNumber"#)
			out.print("         return number?.intValue ?? Self.\(userFriendlyKey)Default")
			out.print("      }")
			out.print("      set {")
			if let rangeDef = rangeDef {
				out.print("         let number = NSNumber(value: newValue).clamped(bounds: \(staticName).\(rangeDef))")
				out.print("         self.filter.setValue(number, forKey: \"\(key2)\")")
			}
			else {
				out.print("         self.setKeyedValue(NSNumber(value: newValue), for: \"\(key2)\"")
			}
			out.print("      }")
			out.print("   }")
			out.print("")
			out.print("   /// `\(userFriendlyKey)` default value")
			out.print("   @objc static public let \(userFriendlyKey)Default: Int = \(defaultValue)")
			out.print("")
		}
		else if keyClass == "NSNumber",
				  keySubType == kCIAttributeTypeBoolean
		{
			let defaultValue = (keyDefaultValue as? String) == "1" ? "true" : "false"
			out.print("   @objc public var \(userFriendlyKey): Bool {")
			out.print("      get {")
			out.print("         let number = self.filter.value(forKey: \"\(key2)\") as? NSNumber")
			out.print("         return number?.boolValue ?? Self.\(userFriendlyKey)Default")
			out.print("      }")
			out.print("      set {")
			out.print(#"         self.setKeyedValue(NSNumber(value: newValue), for: "\#(key2)")"#)
			out.print("      }")
			out.print("   }")
			out.print("")
			out.print("   /// `\(userFriendlyKey)` default value")
			out.print("   @objc static public let \(userFriendlyKey)Default: Bool = \(defaultValue)")
			out.print("")
		}
		else if keyClass == "NSNumber",
				  keySubType == kCIAttributeTypeCount
		{
			let defaultValue = keyDefaultValue ?? "0"
			out.print("   @objc public var \(userFriendlyKey): UInt {")
			out.print("      get {")
			out.print("         let number = self.filter.value(forKey: \"\(key2)\") as? NSNumber")
			out.print("         return number?.uintValue ?? Self.\(userFriendlyKey)Default")
			out.print("      }")
			out.print("      set {")
			if let rangeDef = rangeDef {
				out.print("         let number = NSNumber(value: newValue).clamped(bounds: \(staticName).\(rangeDef))")
				out.print("         self.filter.setValue(number, forKey: \"\(key2)\")")
			}
			else {
				out.print(#"         self.setKeyedValue(NSNumber(value: newValue), for: "\#(key2)")"#)
			}
			out.print("      }")
			out.print("   }")
			out.print("")
			out.print("   /// `\(userFriendlyKey)` default value")
			out.print("   @objc static public let \(userFriendlyKey)Default: UInt = \(defaultValue)")
			out.print("")
		}
		else {
			out.print("   @objc public var \(userFriendlyKey): \(mappedClass ?? keyClass)? {")
			out.print("      get {")
			if let m = mappedClass {
				out.print(#"         let tmp: \#(keyClass)? = self.keyedValue("\#(key2)")"#)
				out.print(#"         return tmp as \#(m)?"#)
			}
			else {
				out.print(#"         return self.keyedValue("\#(key2)")"#)
			}
			out.print("      }")

			out.print("      set {")
			if let rangeDef = rangeDef {
				out.print("      self.filter.setValue(newValue?.clamped(bounds: \(staticName).\(rangeDef)), forKey: \"\(key2)\")")
			}
			else {
				if let _ = mappedClass {
					out.print(#"         self.setKeyedValue(newValue as \#(keyClass)?, for: "\#(key2)")"#)
				}
				else {
					out.print(#"         self.setKeyedValue(newValue, for: "\#(key2)")"#)
				}
			}
			out.print("      }")
			out.print("   }")
		}

		_ = handleRange(out: out, key: userFriendlyKey, keyAttributes: keyItem)
	}

	let outputs = filter.outputKeys.filter { $0 != "outputImage" && !$0.contains(":") }
	if outputs.count > 0 {
		out.print("   // MARK: - Additional Outputs")
		out.print("")
		outputs.sorted().forEach { key in
			out.print("   @objc public var \(key): Any? {")
			out.print("      return self.filter.value(forKey: \"\(key)\")")
			out.print("   }")
		}
	}

	var str = ""
	var initializer = ""
	initializers.forEach { key in
		if !str.isEmpty { str += ", " }

		let subtype: String = {
			if key.subtype == "CIAttributeTypePosition" {
				return "CGPoint"
			}
			else if key.subtype == "CIAttributeTypeRectangle" {
				return "CGRect"
			}
			else if key.subtype == "CIAttributeTypeOffset" {
				return "CGPoint"
			}
			else if key.class == "NSAffineTransform" {
				return "CIAffineTransform"
			}
			else if key.class == "CGImageMetadataRef" {
				return "CGImageMetadata"
			}
			else if key.subtype == kCIAttributeTypeScalar {
				return "Double"
			}
			else if key.subtype == kCIAttributeTypeDistance {
				return "Double"
			}
			else if key.subtype == kCIAttributeTypeTime {
				return "Double"
			}
			else if key.subtype == kCIAttributeTypeAngle {
				return "Double"
			}
			else if key.subtype == kCIAttributeTypeInteger {
				return "Int"
			}
			else if key.subtype == kCIAttributeTypeBoolean {
				return "Bool"
			}
			else if key.subtype == kCIAttributeTypeCount {
				return "UInt"
			}
			return key.class
		}()

		str += "\n         \(key.name): \(subtype)"
		initializer += "\n         self.\(key.name) = \(key.name)"
		if let def = key.default,
		   key.class != "Data",
		   key.class != "CIColor",
		   key.class != "NSObject",
		   subtype != "CIAffineTransform" {
			var defValue = "\(def)"
			if subtype == "CGPoint" {
				defValue = "\(staticName).\(key.name)Default"
			}
			else if subtype == "CGRect" {
				defValue = "\(staticName).\(key.name)Default"
			}
			else if key.class == "String", let defv = def as? NSString {
				defValue = "\"\(defv)\""
			}
			else if key.class == "CIVector", let defv = def as? CIVector {
				defValue = "CIVector([\(defv.valuesStr)])"
			}
			else if key.class == "NSNumber", subtype == "Double" {
				if let d = def as? NSNumber {
					defValue = d.stringValue
				}
				else {
					defValue = "0"
				}
			}
			else if key.class == "NSNumber", subtype == "Bool" {
				let defv: String = {
					if let d = def as? NSString {
						return d.boolValue == true ? "true" : "false"
					}
					else {
						return "false"
					}
				}()
				defValue = "\(defv)"
			}

			str += " = \(defValue)"
		}
	}

	if str.count > 0 {
		out.print("")
		out.print("      // MARK: - Convenience initializer")
		out.print("")
		out.print("      /// Create an instance of the filter")
		out.print("      @objc public convenience init?(\(str)) {")
		out.print("         self.init()")
		out.print("         \(initializer)")
		out.print("      }")
	}

	out.print("   }\n")
	out.print("}")
}


func getRangeInfo(keyAttributes: [String: Any]) -> (Double?, Double?)? {
	var minValue: Double?
	var maxValue: Double?
	if let paramMin = keyAttributes[kCIAttributeMin] as? Double {
		minValue = paramMin
	}
	if let paramMax = keyAttributes[kCIAttributeMax] as? Double {
		maxValue = paramMax
	}
	if minValue != nil || maxValue != nil {
		return (minValue, maxValue)
	}
	else {
		// No range specified for the key
		return nil
	}
}

func handleRange(out: FileSquirter, key: String, keyAttributes: [String: Any]) -> String? {

	guard let range = getRangeInfo(keyAttributes: keyAttributes) else {
		return nil
	}
	let minValue = range.0
	let maxValue = range.1

	out.print("   /// `\(key)` range definition")

	if let minValue = minValue {
		if let maxValue = maxValue {
			out.print("   public static let \(key)Range: ClosedRange<Double> = \(minValue)...\(maxValue)")
		}
		else {
			out.print("   public static let \(key)Range: PartialRangeFrom<Double> = Double(\(minValue))...")
		}
	}
	else if let maxValue = maxValue {
		out.print("   public static let \(key)Range: PartialRangeTo<Double> = ...Double(\(maxValue))")
	}
	return " \(key)Range"
}


class FileSquirter {
	let name: String
	var content: String = ""
	init(name: String) {
		self.name = name
	}

	func print(_ text: String) {
		content += text + "\n"
	}
}

let out = FileSquirter(name: "CIFilterFactory+Generated.swift")

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)

guard CommandLine.arguments.count == 2,
	  let destinationURL = URL(string: CommandLine.arguments[1] ) else {
	Swift.print("Bad command line, \(CommandLine.arguments)")
	exit(-1)
}


let outURL = URL(string: CommandLine.arguments[1], relativeTo: currentDirectoryURL)!
//print(outURL)

//let outBase = outURL.appendingPathComponent("CIFilterFactory+Generated.swift")
////let url = URL(fileURLWithPath: outFile)
//do {
//	try out.content.write(to: outBase, atomically: true, encoding: .utf8)
//}
//catch {
//	Swift.print("Cannot write file \(error)")
//}

let generatedBase = outURL.appendingPathComponent("generated")
try? FileManager.default.createDirectory(at: generatedBase, withIntermediateDirectories: false, attributes: nil)


var fns: [String] = []
for filterName in CIFilter.filterNames(inCategories: nil) {
	if let filter = CIFilter(name: filterName) {

		do {

			let staticName: String = {
				var nn = filterName.replacingOccurrences(of: " ", with: "")
				if nn.starts(with: "CI") {
					let i1 = nn.index(nn.startIndex, offsetBy: 2)
					nn = String(nn[ (i1 ..< nn.endIndex) ])
				}
				return nn
			}()

			let fs = FileSquirter(name: "\(staticName).swift")
			parseFilter(filter: filter, staticName: staticName, out: fs)
			let outURL = generatedBase.appendingPathComponent("\(staticName).swift")
			try fs.content.write(to: outURL, atomically: true, encoding: .utf8)

		}
		catch {
			Swift.print("Cannot write file \(error)")
		}
	}
}

//////

protocol CFTypeProtocol {
  static var typeID: CFTypeID { get }
}

func maybeCast<T, U : CFTypeProtocol>(_ value: T, to cfType: U.Type) -> U? {
  guard CFGetTypeID(value as CFTypeRef) == cfType.typeID else {
	return nil
  }
  return (value as! U)
}

//extension CGColor : CFTypeProtocol {}
//extension CGPath  : CFTypeProtocol {}
extension CGColorSpace : CFTypeProtocol {}

// Some CF types don't have their ID imported as the 'typeID' static member,
// you have to implement it yourself by forwarding to their global function.
extension CFDictionary : CFTypeProtocol {
  static var typeID: CFTypeID { return CFDictionaryGetTypeID() }
}

extension CIVector {
	convenience init(values: [CGFloat]) {
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
