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

private func parseFilter(filter: CIFilter, out: FileSquirter) {

	out.print("""
//
//  \(filter.name).swift  (AUTOMATICALLY GENERATED FILE)
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
			avail += "iOS \(iosAvail)"
		}
	}
	if !avail.isEmpty {
		out.print("@available(\(avail), *)")
	}

	out.print("@objc public extension CIFilterFactory {")

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
		out.print("   /// [\(filter.name) Online Documentation](\(refDoc))")
		out.print("   ///")
	}

	out.print("   /// [CIFilter.io documentation](https://cifilter.io/\(filter.name)/)")
	out.print("   ///")


	out.print("   @objc(CIFilterFactory_\(filter.name)) public class \(filter.name): FilterCore {")
	out.print("      @objc public init?() {")
	out.print("         super.init(name: \"\(filter.name)\")")
	out.print("      }")

	out.print("   // MARK: - Inputs")
	out.print("")

	struct InitType {
		let name: String
		let `class`: String
		let subtype: String?
		let `default`: Any?
	}

	var initializers = [InitType]()

	for key in inputKeys {

		guard let keyItem = filterAttributes[key] as? [String: Any],
			  let keyClass = keyItem[kCIAttributeClass] as? String else {
			continue
		}

		let keyDesc = keyItem[kCIAttributeDescription] as? String
		let keySubType = keyItem[kCIAttributeType] as? String
		let keyDefaultValue = keyItem[kCIAttributeDefault]

		// Write out the description for the key

		initializers.append( InitType(name: key, class: keyClass, subtype: keySubType, default: keyDefaultValue))

		out.print("   ///")
		out.print("   /// \(keyDesc ?? "No Description")")
		out.print("   ///")
		out.print("   ///   Class:    \(keyClass)")
		if let t = keySubType {
			out.print("   ///   Type:     \(t)")
		}
		if let def = keyDefaultValue {
			if keyClass == "NSAffineTransform" {
				let tr = (def as! AffineTransform)
				out.print("   ///   Default:  \(tr)")
			}
			else if keyClass == "CIColor" {
				let tr = (def as! CIColor)
				out.print("   ///   Default:  rgba(\(tr.stringRepresentation))")
			}
			else if let cs = maybeCast(def, to: CGColorSpace.self) {
				// <CGColorSpace 0x7f897ffeed70> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)
				let s = "\(cs)"
				let ww = s.split(separator: ">")
				out.print("   ///   Default: \(ww[1])")
			}
			else {
				out.print("   ///   Default:  \(def)")
			}
		}
		let rangeDef = handleRange(out: out, key: key, keyAttributes: keyItem)

		if keySubType == "CIAttributeTypeRectangle" {
			out.print("   @objc dynamic public var \(key): CIFilterFactory.Rect? {")
			out.print("      get {")
			out.print("         return CIFilterFactory.Rect(with: self.filter, key: \"\(key)\")")
			out.print("      }")
			out.print("      set {")
			out.print("         self.filter.setValue(newValue?.vector, forKey: \"\(key)\")")
			out.print("      }")
			out.print("   }")
		}
		else if keyClass == "NSAffineTransform" {
			out.print("   @objc dynamic public var \(key): CIFilterFactory.AffineTransform? {")
			out.print("      get {")
			out.print("         return AffineTransform(filter: self.filter, key: \"\(key)\")")
			out.print("      }")
			out.print("      set {")
			out.print("         self.filter.setValue(newValue?.embeddedValue(), forKey: \"\(key)\")")
			out.print("      }")
			out.print("   }")
		}
		else if keySubType == "CIAttributeTypePosition" || keySubType == kCIAttributeTypeOffset {
			out.print("   @objc dynamic public var \(key): CIFilterFactory.Point? {")
			out.print("      get {")
			out.print("         return CIFilterFactory.Point(with: self.filter, key: \"\(key)\")")
			out.print("      }")
			out.print("      set {")
			out.print("         self.filter.setValue(newValue?.vector, forKey: \"\(key)\")")
			out.print("      }")
			out.print("   }")
		}
		else if keyClass == "CGImageMetadataRef" {
			out.print("   @objc dynamic public var \(key): CGImageMetadata? {")
			out.print("      get {")
			out.print("         return (self.filter.value(forKey: \"\(key)\") as! CGImageMetadata)")
			out.print("      }")
			out.print("      set {")
			out.print("         self.filter.setValue(newValue, forKey: \"\(key)\")")
			out.print("      }")
			out.print("   }")
		}
		else {

			out.print("   @objc dynamic public var \(key): \(keyClass)? {")
			out.print("      get {")
			out.print("         return self.filter.value(forKey: \"\(key)\") as? \(keyClass)")
			out.print("      }")

			out.print("      set {")
			if let rangeDef = rangeDef {
				out.print("      self.filter.setValue(newValue?.clamped(bounds: \(filter.name).\(rangeDef)), forKey: \"\(key)\")")
			}
			else {
				out.print("      self.filter.setValue(newValue, forKey: \"\(key)\")")
			}
			out.print("      }")
			out.print("   }")
		}
	}

	let outputs = filter.outputKeys.filter { $0 != "outputImage" && !$0.contains(":") }
	if outputs.count > 0 {
		out.print("   // MARK: - Additional Outputs")
		out.print("")
		outputs.forEach { key in
			out.print("   @objc public dynamic var \(key): Any? {")
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
				return "CIFilterFactory.Point"
			}
			else if key.subtype == "CIAttributeTypeRectangle" {
				return "CIFilterFactory.Rect"
			}
			else if key.subtype == "CIAttributeTypeOffset" {
				return "CIFilterFactory.Point"
			}
			else if key.class == "NSAffineTransform" {
				return "CIFilterFactory.AffineTransform"
			}
			else if key.class == "CGImageMetadataRef" {
				return "CGImageMetadata"
			}
			return key.class
		}()

		str += "\n         \(key.name): \(subtype)"
		initializer += "\n         self.\(key.name) = \(key.name)"
		if let def = key.default,
		   key.class != "NSData",
		   key.class != "CIColor",
		   key.class != "NSObject",
		   subtype != "CIFilterFactory.AffineTransform" {
			var defValue = "\(def)"
			if subtype == "CIFilterFactory.Point", let defv = def as? CIVector {
				defValue = "CIFilterFactory.Point(x: \(defv.x), y: \(defv.y))"
			}
			else if subtype == "CIFilterFactory.Rect", let defv = def as? CIVector {
				defValue = "CIFilterFactory.Rect(x: \(defv.x), y: \(defv.y), width: \(defv.cgRectValue.width), height: \(defv.cgRectValue.height))"
			}
			else if key.class == "NSString", let defv = def as? NSString {
				defValue = "\"\(defv)\""
			}
			else if key.class == "CIVector", let defv = def as? CIVector {
				defValue = "CIVector([\(defv.valuesStr)])"
			}

			str += " = \(defValue)"
		}
	}
	
	if str.count > 0 {
		out.print("")
		out.print("      // MARK: - Convenience initializer")
		out.print("")
		out.print("      @objc public convenience init?(\(str)) {")
		out.print("         self.init()")
		out.print("         \(initializer)")
		out.print("      }")
	}

	out.print("   }\n")
	out.print("}\n")
}

func handleRange(out: FileSquirter, key: String, keyAttributes: [String: Any]) -> String? {

	var minValue: Float?
	var maxValue: Float?
	var rangeString = ""
	if let paramMin = keyAttributes[kCIAttributeMin] as? Float {
		minValue = paramMin
		rangeString += "   ///   minValue: \(paramMin)"
	}
	if let paramMax = keyAttributes[kCIAttributeMax] as? Float {
		maxValue = paramMax
		if rangeString.count > 0 {
			rangeString += "\n"
		}
		rangeString += "   ///   maxValue: \(paramMax)"
	}
	if !rangeString.isEmpty {
		rangeString += "\n   ///"
		out.print(rangeString)
	}
	else {
		// No range specified for the key
		return nil
	}

	if let minValue = minValue {
		if let maxValue = maxValue {
			out.print("   static let \(key)_Range: ClosedRange<Float> = \(minValue)...\(maxValue)")
		}
		else {
			out.print("   static let \(key)_Range: PartialRangeFrom<Float> = Float(\(minValue))...")
		}
	}
	else if let maxValue = maxValue {
		out.print("   static let \(key)_Range: PartialRangeTo<Float> = ...Float(\(maxValue))")
	}
	return " \(key)_Range"
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

			let fs = FileSquirter(name: "\(filterName).swift")
			parseFilter(filter: filter, out: fs)
			let outURL = generatedBase.appendingPathComponent("\(filterName).swift")
			try fs.content.write(to: outURL, atomically: true, encoding: .utf8)

		}
		catch {
			Swift.print("Cannot write file \(error)")
		}
		//Swift.print(fs.content)
		// fns.append(filterName)
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
