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

private func parseFilter(filter: CIFilter) {
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
		print("@available(\(avail), *)")
	}

	print("@objc public extension CIFilterFactory {")

	print("   ///")
	if let refDisplay = filterAttributes[kCIAttributeFilterDisplayName] as? String {
		print("   /// \(refDisplay)")
		print("   ///")
	}
	if let refDesc = CIFilter.localizedDescription(forFilterName: filter.name) {
		print("   /// \(refDesc)")
		print("   ///")
	}

	print("   /// **Links**")
	print("   ///")

	if let refDoc = filterAttributes[kCIAttributeReferenceDocumentation] as? URL {
		print("   /// [\(filter.name) Online Documentation](\(refDoc))")
		print("   ///")
	}

	print("   /// [CIFilter.io documentation](https://cifilter.io/\(filter.name)/)")
	print("   ///")


	print("   @objc(CIFilterFactory_\(filter.name)) class \(filter.name): Core {")
	print("      @objc public init?() {")
	print("         super.init(name: \"\(filter.name)\")")
	print("         self.filter.setDefaults()")
	print("      }")

	for key in inputKeys {
		var keyType: String?
		var keyDesc: String?

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
			keyType = "AffineTransform"
			isAffineTweaked = true
		}

		var minValue: Float?
		var maxValue: Float?
		var rangeString = ""
		if let paramMin = keyItem[kCIAttributeMin] as? Float {
			minValue = paramMin
			rangeString += "///   minValue: \(paramMin)"
		}
		if let paramMax = keyItem[kCIAttributeMax] as? Float {
			maxValue = paramMax
			if rangeString.count > 0 {
				rangeString += "\n"
			}
			rangeString += "///   maxValue: \(paramMax)"
		}
		if !rangeString.isEmpty {
			rangeString += "\n///"
		}

		if let keyType = keyType {

			print("///")
			print("/// \(keyDesc ?? "No Description")")
			print("///")
			if !rangeString.isEmpty {
				print(rangeString)
			}

			if let minValue = minValue {
				if let maxValue = maxValue {
					print("let \(key)_Range: ClosedRange<Float> = \(minValue)...\(maxValue)")
				}
				else {
					print("let \(key)_Range: PartialRangeFrom<Float> = Float(\(minValue))...")
				}
			}
			else if let maxValue = maxValue {
				print("let \(key)_Range: PartialRangeTo<Float> = ...Float(\(maxValue))")
			}

			print("@objc public var \(key): \(keyType)? {")
			print("   get {")
			if needsTweaking {
				print("      return (self.filter.value(forKey: \"\(key)\") as! \(keyType))")
			}
			else if isAffineTweaked {
				print("#if os(macOS)")
				print("   if let value = self.filter.value(forKey: \"\(key)\") as? NSAffineTransform {")
				print("      return AffineTransform(value)")
				print("   }")
				print("   return nil")
				print("#else")
				print("   if let value = self.filter.value(forKey: \"\(key)\") as? NSValue {")
				print("      return AffineTransform(value.cgAffineTransformValue)")
				print("   }")
				print("   return nil")
				print("#endif")
			}
			else {
				print("      return self.filter.value(forKey: \"\(key)\") as? \(keyType)")
			}
			print("   }")

			print("   set {")
			if maxValue != nil || minValue != nil {
				print("   self.filter.setValue(newValue?.clamped(bounds: \(key)_Range), forKey: \"\(key)\")")
			}
			else if isAffineTweaked {
				print("#if os(macOS)")
				print("   self.filter.setValue(newValue?.transform, forKey: \"\(key)\")")
				print("#else")
				print("   if let value = newValue?.transform {")
				print("      let val = NSValue(cgAffineTransform: value)")
				print("      self.filter.setValue(val, forKey: \"\(key)\")")
				print("   }")
				print("   else {")
				print("      self.filter.setValue(nil, forKey: \"\(key)\")")
				print("   }")
				print("#endif")
			}
			else {
				print("      self.filter.setValue(newValue, forKey: \"\(key)\")")
			}
			print("   }")
			print("}")
		}
	}
	print("   }\n")
	print("}\n")
}

print("""
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
import AVFoundation
import CoreML
import CoreImage

#if !os(macOS)
import UIKit     // For access to NSValue.cgAffineTransformValue
#endif

@objc public class AffineTransform: NSObject {
	#if os(macOS)
		@objc var transform: NSAffineTransform
		@objc public init(_ transform: NSAffineTransform) {
			self.transform = transform
			super.init()
		}
	#else
		@objc var transform: CGAffineTransform
		@objc public init(_ transform: CGAffineTransform) {
			self.transform = transform
			super.init()
		}
	#endif
}

@objc public class CIFilterFactory: NSObject {
	@objc(CIFilterCore) public class Core: NSObject {
		let filter: CIFilter
		fileprivate init?(name: String) {
			guard let filter = CIFilter(name: name) else {
				return nil
			}
			self.filter = filter
			super.init()
		}
		fileprivate init?(with filter: CIFilter, expectedName: String) {
			if filter.name != expectedName {
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
}

private extension NSNumber {
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

var fns: [String] = []
for filterName in CIFilter.filterNames(inCategories: nil) {
	if let filter = CIFilter(name: filterName) {
		parseFilter(filter: filter)
		fns.append(filterName)
	}
}
