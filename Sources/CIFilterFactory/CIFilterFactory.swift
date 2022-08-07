//
//  CIFilterFactory.swift
//
//  Created by Darren Ford on 11/4/2022.
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

import CoreImage
import Foundation

/// The namespace object for the filter factory
@objc public class CIFF: NSObject {

	// Disallow the creation of this class type
	private override init() { }

	/// Common filter base class. You never need need to create this yourself
	@objc public class Core: NSObject {
		/// The CIFilter wrapped instance for the filter
		@objc public let filter: CIFilter

		/// Returns a CIImage object that encapsulates the operations configured in the filter.
		@objc public dynamic var outputImage: CIImage? {
			return self.filter.outputImage
		}

		/// The filter's name
		///
		/// See [Apple's Documentation](https://developer.apple.com/documentation/coreimage/cifilter/1437997-name) for more information.
		@objc @inlinable public var name: String {
			get { self.filter.name }
			set {
				if #available(iOS 10.0, *) {
					self.filter.name = newValue
				}
			}
		}

		/// The localized version of the filter name that is displayed in the user interface
		@objc public lazy var displayName: String = {
			return self.filter.attributes[kCIAttributeFilterDisplayName] as? String ?? self.name
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
		@inlinable @objc public var attributes: [String: Any] {
			self.filter.attributes
		}

		/// Returns a dictionary containing the filter's current input parameters
		@inlinable @objc public var inputParameters: [String: Any] {
			self.filter.dictionaryWithValues(forKeys: self.filter.inputKeys)
		}

		/// Returns the URL for the `CIFilter.io` webpage describing the filter
		@objc public lazy var cifilterOnlineDocumentationURL: URL? = {
			return URL(string: "https://cifilter.io/\(self.name)/")
		}()

		/// The localized reference documentation for the filter. The reference should provide developers with technical details.
		@available(macOS 10.10, iOS 9, *)
		@objc public lazy var onlineDocumentationURL: URL? = {
			return self.filter.attributes[kCIAttributeReferenceDocumentation] as? URL
		}()

		/// Returns the categories that the filter is a member of
		@objc public lazy var categories: [String] = {
			return self.filter.attributes[kCIAttributeFilterCategories] as? [String] ?? []
		}()

		/// Reset all the values in the filter to the defaults
		@inlinable @objc public func reset() {
			return self.filter.setDefaults()
		}

		// Private

		internal init?(name: String) {
			guard let filter = CIFilter(name: name) else {
				return nil
			}
			self.filter = filter
			super.init()

#if os(macOS)
			filter.setDefaults()
#endif
		}
	}
}

internal extension CIFF.Core {
	// Convenience method for getting a value of a specific type
	@inline(__always) func keyedValue<TYPE>(_ key: String) -> TYPE? {
		return self.filter.value(forKey: key) as? TYPE
	}

	// Convenience method for setting a value with a specific type
	@inline(__always) func setKeyedValue<TYPE>(_ value: TYPE?, for key: String) {
		return self.filter.setValue(value, forKey: key)
	}
}
