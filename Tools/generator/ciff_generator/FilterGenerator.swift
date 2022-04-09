//
//  FilterGenerator.swift
//  ciff_generator
//
//  Created by Darren Ford on 9/4/2022.
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

		// Generate an availablilty if needed
		let availability = generateAvailabilityString(filterAttributes: filterAttributes)

		if let availability = availability {
			out.print(availability)
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

		if let availability = availability {
			out.print(availability)
		}
		out.print("   @objc(CIFF\(staticName)) class \(staticName): Core {")

		do {

			out.print("      /// Create an instance of the filter")
			out.print("      @objc public init?() {")
			out.print("         super.init(name: \"\(filter.name)\")")
			out.print("      }")

			for keyName in inputKeys {
				self.generateKey(keyName: keyName, filterAttributes: filterAttributes)
			}
		}

		// Generate convenience initializer
		if initializers.count > 0 {
			self.generateInitializer()
		}

		out.print("   }")
		out.print("}")
	}

	func generateInitializer() {

		var str = ""
		var inits = ""

		for property in self.initializers {
			if str.count > 0 { str += ","; inits += "\n" }
			str += "\n         \(property.name): \(property.swiftType)"
			let vt = property.valueTypeGenerator()
			if let _ = vt.defaultValueString() {
				str += " = \(self.staticName).\(property.name)Default"
			}
			inits += "         self.\(property.name) = \(property.name)"
		}

		out.print("")
		out.print("      // MARK: - Convenience initializer")
		out.print("")
		out.print("      /// Create an instance of the filter")
		out.print("      @objc public convenience init?(\(str))")
		out.print("      {")
		out.print("         self.init()")
		out.print(inits)
		out.print("      }")
	}


	func generateKey(keyName: String, filterAttributes: [String: Any]) {
		let userFriendlyKey: String = {
			if keyName.hasPrefix("input") {
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

		if avail.isEmpty { return nil }
		return "@available(\(avail), *)"
	}


	func generateHeader() {
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
	}

}
