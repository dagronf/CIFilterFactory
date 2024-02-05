//
//  FilterGenerator.swift
//  ciff_generator
//
//  Copyright © 2024 Darren Ford. All rights reserved.
//

import Foundation
import CoreImage

class FilterGenerator {

	var initializers: [InputKeyType] = []

	let filter: CIFilter
	let staticName: String

	let out: FileSquirter

	init(filter: CIFilter) {
		self.filter = filter

		self.staticName = {
			var nn = filter.name.replacingOccurrences(of: " ", with: "")
			if nn.starts(with: "CI") {
				let i1 = nn.index(nn.startIndex, offsetBy: 2)
				nn = String(nn[ (i1 ..< nn.endIndex) ])
			}
			return nn
		}()

		self.out = FileSquirter(name: "\(staticName).swift")
	}

	func generate() {
		self.generateHeader()

		let inputKeys = filter.inputKeys
		let filterAttributes = filter.attributes

		out.print("@objc public extension CIFF {")

		if let refDisplay = filterAttributes[kCIAttributeFilterDisplayName] as? String {
			out.print("   /// \(refDisplay)")
			out.print("   ///")
		}
		if let refDesc = CIFilter.localizedDescription(forFilterName: filter.name) {
			out.print("   /// \(refDesc)")
			out.print("   ///")
		}

		out.print("   /// **CIFilter Name**")
		out.print("   /// - \(filter.name)")
		out.print("   ///")

		out.print("   /// **Availability**")

		let avail = generateAvailability(filterAttributes: filterAttributes)
		if avail.count > 0 {
			out.print("   /// - \(avail.joined(separator: ", "))")
			out.print("   ///")
		}

		var cleanCategories = [String]()
		if let categories = filterAttributes[kCIAttributeFilterCategories] as? [String] {
			out.print("   /// **Categories**")
			let cats = categories.sorted()
			cats.forEach {
				let clipped = $0.replacingOccurrences(of: "CICategory", with: "")
				cleanCategories.append(clipped)
				out.print("   /// - \(clipped) (*\($0)*)")
			}
			out.print("   ///")
		}

		var docs = ""
		docs += "   /// **Documentation Links**\n"

		if let refDoc = filterAttributes[kCIAttributeReferenceDocumentation] as? URL {
			docs += "   /// - [\(filter.name) Online Documentation](\(refDoc))\n"
		}

		// This link seems to fluctuate for every Xcode release?
		//docs += "   /// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/\(filter.name.lowercased())?language=objc)\n"
		docs += "   /// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)\n"
		docs += "   /// - [CIFilter.io documentation](https://cifilter.io/\(filter.name)/)"

		out.print(docs)

		let additionalOutputKeys = self.filter.outputKeys.filter { $0 != "outputImage" }
		if additionalOutputKeys.count > 0 {
			out.print("   /// **Additional output keys**")
			additionalOutputKeys.forEach {
				out.print("   /// - \($0)")
			}
			out.print("   ///")
		}

		let availability = generateAvailabilityString(filterAttributes: filterAttributes)
		if let availability = availability {
			out.print(availability)
		}
		out.print("   @objc(CIFF\(staticName)) class \(staticName): Core {")

		do {

			out.print("      /// Create an instance of the filter with all default values")
			out.print("      @objc public init?() {")
			out.print("         super.init(name: \"\(filter.name)\")")
			out.print("      }")
			out.blankLine()

			for keyName in inputKeys {
				self.generateKey(keyName: keyName, filterAttributes: filterAttributes)
			}
		}

		outputKeyGen: do {
			let additionalOutputKeys = filter.outputKeys.filter { $0 != "outputImage" && !$0.contains(":") }
			if additionalOutputKeys.count == 0 {
				break outputKeyGen
			}

			var usableKeys: [String] = []
			for key in additionalOutputKeys {
				if let type = additionalOutputKeyTypes[AdditionalOutputKey(filter.name, key)] {
					if usableKeys.count == 0 {
						out.print("      // MARK: - Additional output keys")
						out.print("")
					}
					else {
						out.print("")
					}
					out.print("      @objc public var \(key): Unmanaged<\(type)>? {")
					out.print("         let value = self.filter.perform(#selector(getter: AdditionalOutputsFilterDescriptor.\(key)))")
					out.print("         if let obj = value?.takeUnretainedValue() {")
					out.print("            return Unmanaged.passUnretained(obj as! \(type))")
					out.print("         }")
					out.print("         return nil")
					out.print("      }")
					usableKeys.append(key)
				}
			}
			if usableKeys.count > 0 {
				out.print("")
				out.print("      // A hidden class for extracting any additional output objects")
				out.print("      private final class AdditionalOutputsFilterDescriptor: NSObject {")
				for key in usableKeys {
					out.print("         @objc var \(key): Unmanaged<AnyObject>?")
				}
				out.print("      }")
			}
		}

		// Generate convenience initializer
		if initializers.count > 0 {
			self.generateInitializer()
		}
		out.print("   }")
		out.print("}")
		out.blankLine()

		let fdesc = CIFilter.localizedDescription(forFilterName: filter.name)
		let fname = filterAttributes[kCIAttributeFilterDisplayName] as? String ?? ""
		self.generateCIImageExtension(fname, fdesc ?? "", availability, docs, cleanCategories)

		out.blankLine()
		out.print("#endif // canImport(CoreImage)")
	}

	func generateInitializer() {

		var str = ""
		var inits = ""
		var params = "      /// - Parameters:"

		for property in self.initializers {
			if str.count > 0 { str += ","; inits += "\n" }
			str += "\n         \(property.name): \(property.swiftType)"
			let vt = property.valueTypeGenerator()
			if let _ = vt.defaultValueString() {
				str += " = \(self.staticName).\(property.name)Default"
			}
			else if property.swiftType == "CIImage" {
				str += "? = nil"
			}

			params += "\n"
			params += "      ///   - \(property.name): \(property.description)"

			if property.swiftType == "CIImage" {
				inits += "         if let \(property.name) = \(property.name) {\n"
				inits += "            self.\(property.name) = \(property.name)\n"
				inits += "         }"
			}
			else {
				inits += "         self.\(property.name) = \(property.name)"
			}
		}

		out.print("")
		out.print("      // MARK: - Convenience creators")
		out.print("")
		out.print("      /// Filter initializer")
		out.print(params)

		out.print("      @objc public convenience init?(\(str)")
		out.print("      ) {")
		out.print("         self.init()")
		out.print(inits)
		out.print("      }")

		out.print("")
	}

	func generateCIImageExtension(
		_ filterName: String,
		_ filterDescription: String,
		_ availability: String?,
		_ docs: String,
		_ categories: [String]
	) {
		let isChainable = self.initializers.contains(where: { key in key.name == "inputImage" })
		let others = self.initializers.filter { $0.name != "inputImage" }

		if let availability = availability {
			out.print(availability)
		}
		out.print("public extension CIImage {")

		// Convert to camel case
		// let funcName = staticName.prefix(1).lowercased() + staticName.dropFirst()

		if isChainable {
			out.print("   /// Apply the '\(filterName)' filter to this image and return a new filtered image")
			out.print("   ///")
			out.print("   /// - Parameters:")
		}
		else {
			out.print("   /// Create a new CIImage using the '\(filterName)' filter")
			out.print("   ///")
			if others.count > 0 {
				out.print("   /// - Parameters:")
			}
		}

		others.forEach { property in
			let vt = property.valueTypeGenerator()
			let mins = vt.minValueString()
			let maxs = vt.maxValueString()
			var range = ""
			if let mins = mins {
				if let maxs = maxs {
					range = "(\(mins)...\(maxs))"
				}
				else {
					range = "(\(mins)...)"
				}
			}
			else if let maxs = maxs {
				range = "(...\(maxs))"
			}

			out.print("   ///   - \(property.name): \(property.description) \(range.count > 0 ? range : "") ")
		}
		if isChainable {
			out.print("   ///   - isActive: If true applies the filter and returns a new image, else returns this image")
			out.print("   /// - Returns: The filtered image, or this image if the filter is not active")
		}
		else {
			out.print("   /// - Returns: A new image by running the filter, or nil if the image could not be created")
		}
		out.print("   ///")
		out.print("   /// \(filterDescription)")
		out.print("   ///")
		if !categories.isEmpty {
			out.print("   /// **Categories**: \(categories.joined(separator: ", "))")
			out.print("   ///")
		}

		out.print(docs)

		if isChainable {
			out.print("   @inlinable func applying\(staticName)(")
		}
		else {
			out.print("   @inlinable static func createUsing\(staticName)(")
		}

		var str = ""
		for property in others {
			if str.count > 0 { str += ",\n" }

			var sType = property.swiftType
			if ["CIPosition3", "CIAffineTransform"].contains(sType) { sType = "CIFF." + sType }

			str += "      \(property.name): \(sType)"
			let vt = property.valueTypeGenerator()
			if let _ = vt.defaultValueString() {
				str += " = CIFF.\(self.staticName).\(property.name)Default"
			}
		}
		if isChainable && others.count > 0 { str += "," }
		out.print(str)

		if isChainable {
			out.print("      isActive: Bool = true")
		}

		if isChainable {
			out.print("   ) -> CIImage {")
		}
		else {
			out.print("   ) -> CIImage? {")
		}

		if isChainable {
			out.print("      guard isActive else { return self }")
		}

		var funcDef = "      return CIFF.\(self.staticName)(\n"

		var needCommaNewline = false
		if isChainable {
			funcDef += "         inputImage: self"
			needCommaNewline = true
		}

		others.forEach { key in
			if needCommaNewline {
				funcDef += ",\n"
			}
			needCommaNewline = true
			funcDef += "         \(key.name): \(key.name)"
		}
		if isChainable {
			funcDef += "\n      )?.outputImage ?? CIImage.empty()"
		}
		else {
			funcDef += "\n      )?.outputImage"
		}
		out.print(funcDef)
		out.print("   }")
		out.print("}")
	}

	func generateKey(keyName: String, filterAttributes: [String: Any]) {
		let userFriendlyKey: String = {
			if keyName.hasPrefix("input") && keyName != "inputImage" {
				let v = keyName.suffix(from: keyName.index(at: 5))
				return v.prefix(1).lowercased() + v.dropFirst()
			}
			return keyName
		}()

		out.print("   // MARK: - \(userFriendlyKey) (\(keyName))")
		out.print("")

		guard
			let keyItem = filterAttributes[keyName] as? [String: Any],
			let keyClass = keyItem[kCIAttributeClass] as? String
		else {
			fatalError("Missing key type or class!")
			//out.print(#"   /// \#(keyName) has no type or class defined. "#)
			//return
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
		let keyDefinition = InputKeyType(
			attributeKey: keyName,
			name: userFriendlyKey,
			keyClass: keyClass,
			mappedClass: mappedClass,
			description: keyDesc,
			subtype: keySubType,
			default: keyDefaultValue,
			keyAttributes: keyItem
		)
		initializers.append(keyDefinition)

		let valueType = keyDefinition.valueTypeGenerator()

		out.print("   /// \(keyDesc)")
		out.print("   ///")
		out.print("   /// CIFilter attribute information")
		out.print("   /// - Attribute key: `\(keyName)`")
		out.print("   /// - Internal class: `\(keyClass)`")
		if let subType = keySubType {
			out.print("   /// - Type: `\(subType)`")
		}

		if let miv = valueType.minValueString() {
			out.print("   /// - Minimum Value: `\(miv)`")
		}
		if let mav = valueType.maxValueString() {
			out.print("   /// - Maximum Value: `\(mav)`")
		}
		if let dev = valueType.defaultValueString() {
			out.print("   /// - Default Value: `\(dev)`")
		}

		out.print(valueType.generateDefinition(userFriendlyKey: userFriendlyKey, staticName: self.staticName))

		// Generate the static range
		if let rangeDef = valueType.rangeDefinition() {
			out.print("   /// `\(userFriendlyKey)` range definition")
			out.print("   public static let \(userFriendlyKey)Range \(rangeDef)")
		}

		out.print("")
	}

	func generateAvailabilityString(filterAttributes: [String: Any]) -> String? {
		let avail = generateAvailability(filterAttributes: filterAttributes)
		if avail.count > 0 {
			return "@available(\(avail.joined(separator: ", ")), *)"
		}
		return nil
	}

	func generateAvailability(filterAttributes: [String: Any]) -> [String] {
		var avail: [String] = []
		if let macAvail = filterAttributes[kCIAttributeFilterAvailable_Mac] as? String {
			if let _ = Float(macAvail) {
				avail.append("macOS \(macAvail)")
			}
		}
		if let iosAvail = filterAttributes[kCIAttributeFilterAvailable_iOS] as? String {
			if let _ = Float(iosAvail) {
				avail.append("iOS \(iosAvail)")
				avail.append("tvOS \(iosAvail)")
			}
		}

		// Hack(s) for macCatalyst.
		if filterAttributes.filter({ (key, value) in
			if let f = value as? [String: Any],
				let v = f[kCIAttributeClass] as? String {
				return v == "AVCameraCalibrationData"
			}
			return false
		}).count > 0 {
			avail.append("macCatalyst 14")
		}
		return avail
	}


	func generateHeader() {
		out.print("""
//
//  \(staticName).swift  (AUTOMATICALLY GENERATED FILE)
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

import Foundation
import AVFoundation
import CoreML
import CoreImage

"""
		)
	}

}
