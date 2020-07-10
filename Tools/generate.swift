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

#if !os(macOS)
// For access to NSValue.cgAffineTransformValue
import UIKit
#endif

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


	out.print("   @objc(CIFilterFactory_\(filter.name)) class \(filter.name): FilterCommon {")
	out.print("      @objc public init?() {")
	out.print("         super.init(name: \"\(filter.name)\")")
	out.print("         self.filter.setDefaults()")
	out.print("      }")

	for key in inputKeys {
		var keyType: String?
		var keyDesc: String?

		out.print("")
		out.print("   // MARK: - \(key)")
		out.print("")

		guard let keyItem = filterAttributes[key] as? [String: Any] else {
			continue
		}

		if let descr = keyItem[kCIAttributeDescription] as? String {
			keyDesc = descr
		}

		guard let paramType = keyItem[kCIAttributeClass] as? String else {
			continue
		}
		keyType = paramType

		var needsTweaking = false
		if keyType == "CGImageMetadataRef" {
			keyType = "CGImageMetadata"
			needsTweaking = true
		}

		var isAffineTweaked = false
		if keyType == "NSAffineTransform" {
			keyType = "CIFilterFactory.AffineTransform"
			isAffineTweaked = true
		}

		var minValue: Float?
		var maxValue: Float?
		var rangeString = ""
		if let paramMin = keyItem[kCIAttributeMin] as? Float {
			minValue = paramMin
			rangeString += "   ///   minValue: \(paramMin)"
		}
		if let paramMax = keyItem[kCIAttributeMax] as? Float {
			maxValue = paramMax
			if rangeString.count > 0 {
				rangeString += "\n"
			}
			rangeString += "   ///   maxValue: \(paramMax)"
		}
		if !rangeString.isEmpty {
			rangeString += "\n   ///"
		}

		if let keyType = keyType {

			out.print("   ///")
			out.print("   /// \(keyDesc ?? "No Description")")
			out.print("   ///")
			if !rangeString.isEmpty {
				out.print(rangeString)
			}

			if let minValue = minValue {
				if let maxValue = maxValue {
					out.print("   let \(key)_Range: ClosedRange<Float> = \(minValue)...\(maxValue)")
				}
				else {
					out.print("   let \(key)_Range: PartialRangeFrom<Float> = Float(\(minValue))...")
				}
			}
			else if let maxValue = maxValue {
				out.print("   let \(key)_Range: PartialRangeTo<Float> = ...Float(\(maxValue))")
			}

			out.print("   @objc public var \(key): \(keyType)? {")
			out.print("      get {")
			if needsTweaking {
				out.print("      return (self.filter.value(forKey: \"\(key)\") as! \(keyType))")
			}
			else if isAffineTweaked {
				out.print("         return AffineTransform(filter: self.filter, key: \"\(key)\")")
			}
			else {
				out.print("         return self.filter.value(forKey: \"\(key)\") as? \(keyType)")
			}
			out.print("      }")

			out.print("      set {")
			if maxValue != nil || minValue != nil {
				out.print("      self.filter.setValue(newValue?.clamped(bounds: \(key)_Range), forKey: \"\(key)\")")
			}
			else if isAffineTweaked {
				out.print("      self.filter.setValue(newValue?.embeddedValue(), forKey: \"\(key)\")")
			}
			else {
				out.print("      self.filter.setValue(newValue, forKey: \"\(key)\")")
			}
			out.print("      }")
			out.print("   }")
		}
	}
	out.print("   }\n")
	out.print("}\n")
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

let out = FileSquirter(name: "CIFilterFactory.swift")


out.print("""
//
// CIFilterFactory.swift
//
//  MIT license
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
//  documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial
//  portions of the Software.
//
//  THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//  WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
//  OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//  OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  Automatically generated on \(NSDate.now).  Do not edit.

import Foundation
import CoreImage

/// A class factory for type-safe Core Image Filter objects
@objc public class CIFilterFactory: NSObject {

	/// Common filter base class. You never need need to create this yourself
	@objc(CIFilterCore) public class FilterCommon: NSObject {

		// The CIFilter wrapped instance for the filter
		@objc public let filter: CIFilter

		init?(name: String) {
			guard let filter = CIFilter(name: name) else {
				return nil
			}
			self.filter = filter
			super.init()
		}

		/// Returns a CIImage object that encapsulates the operations configured in the filter.
		@objc public dynamic var outputImage: CIImage? {
			return self.filter.outputImage
		}

		/// The name of the filter
		@objc public lazy var name: String = {
			return self.filter.name
		}()

		/// The localized version of the filter name that is displayed in the user interface
		@objc public lazy var displayName: String = {
			self.filter.attributes[kCIAttributeFilterDisplayName] as? String ?? self.name
		}()

		/// Returns the localized name for the specified filter.
		@available(macOS 10.10, iOS 9, *)
		@objc public lazy var localizedName: String = {
			return CIFilter.localizedName(forFilterName: self.name) ?? self.name
		}()

		/// Returns the localized description of a filter for display in the user interface.
		@available(macOS 10.10, iOS 9, *)
		@objc public lazy var localizedDescription: String? = {
			return CIFilter.localizedDescription(forFilterName: self.name)
		}()

		/// Returns a dictionary containing key/value pairs describing the filter
		@objc public var attributes: [String: Any] {
			return self.filter.attributes
		}

		/// Returns the URL for the `CIFilter.io` webpage describing the filter
		@objc public lazy var cifilterOnlineDocumentationURL: URL? = {
			return URL(string: "https://cifilter.io/\\(self.name)/")
		}()

		/// The localized reference documentation for the filter. The reference should provide developers with technical details.
		@available(macOS 10.10, iOS 9, *)
		@objc public var onlineDocumentationURL: URL? {
			return filter.attributes[kCIAttributeReferenceDocumentation] as? URL
		}
	}

	/// A wrapped AffineTransform class to abstract away affine transform differences per platform
	@objc(CIFilterFactoryAffineTransform) public class AffineTransform: NSObject {
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

extension NSNumber {
	func clamped(bounds: PartialRangeFrom<Float>) -> NSNumber {
		if bounds.lowerBound > self.floatValue {
			return NSNumber(value: bounds.lowerBound)
		}
		return self
	}
	func clamped(bounds: PartialRangeThrough<Float>) -> NSNumber {
		if bounds.upperBound < self.floatValue {
			return NSNumber(value: bounds.upperBound)
		}
		return self
	}
	func clamped(bounds: ClosedRange<Float>) -> NSNumber {
		var value = max(bounds.lowerBound, self.floatValue)
		value = min(bounds.upperBound, value)
		return NSNumber(value: value)
	}
}
""")

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)

guard CommandLine.arguments.count == 2,
	let destinationURL = URL(string: CommandLine.arguments[1] ) else {
	Swift.print("Bad command line, \(CommandLine.arguments)")
	exit(-1)
}


let outURL = URL(string: CommandLine.arguments[1], relativeTo: currentDirectoryURL)!
print(outURL)
let outBase = outURL.appendingPathComponent("CIFilterFactory.swift")
//let url = URL(fileURLWithPath: outFile)
do {
	try out.content.write(to: outBase, atomically: true, encoding: .utf8)
}
catch {
	Swift.print("Cannot write file \(error)")
}

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
