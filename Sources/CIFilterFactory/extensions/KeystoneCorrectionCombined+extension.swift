//
//  KeystoneCorrectionCombined+extensions.swift
//
//  Created by Darren Ford on 16/7/20.
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
import CoreImage.CIFilter

@available(macOS 10.15, iOS 13, tvOS 13, *)
public extension CIFF.KeystoneCorrectionCombined {
	@objc var outputRotationFilter: CIFilter? {
		let rawSelectorOutput = self.filter.perform(#selector(getter: CIFFObjectExtractor.outputRotationFilter))
		if let obj = rawSelectorOutput?.takeUnretainedValue() {
			let im = obj as! CIFilter
			return im
		}
		return nil
	}

	// A hidden class for extracting any additional output objects
	private final class CIFFObjectExtractor: NSObject {
		@objc var outputRotationFilter: Unmanaged<AnyObject>?
	}
}
