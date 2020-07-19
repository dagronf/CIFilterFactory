//
// CIFilterFactory.swift
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
//  Automatically generated on 2020-07-15 23:42:08 +0000.  Do not edit.

import CoreImage
import Foundation

/// A class factory for type-safe Core Image Filter objects
@objc public class CIFilterFactory: NSObject {
	/// Common filter base class. You never need need to create this yourself
	@objc(CIFilterFactoryFilterCore) public class FilterCore: NSObject {
		// The CIFilter wrapped instance for the filter
		@objc public let filter: CIFilter

		init?(name: String) {
			guard let filter = CIFilter(name: name) else {
				return nil
			}
			self.filter = filter
			super.init()

			#if os(macOS)
			filter.setDefaults()
			#endif
		}

		/// Returns a CIImage object that encapsulates the operations configured in the filter.
		@objc public dynamic var outputImage: CIImage? {
			return self.filter.outputImage
		}

		/// The name of the filter
		@objc public lazy var name: String = {
			self.filter.name
		}()

		/// The localized version of the filter name that is displayed in the user interface
		@objc public lazy var displayName: String = {
			self.filter.attributes[kCIAttributeFilterDisplayName] as? String ?? self.name
		}()

		/// Returns the localized name for the specified filter.
		@available(macOS 10.10, iOS 9, *)
		@objc public lazy var localizedName: String = {
			CIFilter.localizedName(forFilterName: self.name) ?? self.name
		}()

		/// Returns the localized description of a filter for display in the user interface.
		@available(macOS 10.10, iOS 9, *)
		@objc public lazy var localizedDescription: String? = {
			CIFilter.localizedDescription(forFilterName: self.name)
		}()

		/// Returns a dictionary containing key/value pairs describing the filter
		@objc public var attributes: [String: Any] {
			return self.filter.attributes
		}

		/// Returns the URL for the `CIFilter.io` webpage describing the filter
		@objc public lazy var cifilterOnlineDocumentationURL: URL? = {
			URL(string: "https://cifilter.io/\(self.name)/")
		}()

		/// The localized reference documentation for the filter. The reference should provide developers with technical details.
		@available(macOS 10.10, iOS 9, *)
		@objc public var onlineDocumentationURL: URL? {
			return self.filter.attributes[kCIAttributeReferenceDocumentation] as? URL
		}

		/// Reset all the values in the filter to the defaults
		@objc public func reset() {
			self.filter.setDefaults()
		}
	}
}
