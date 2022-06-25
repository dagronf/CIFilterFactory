//
//  PDF417BarcodeGenerator+extensions.swift
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
import CoreImage

@available(macOS 10.11, iOS 9, tvOS 9, *)
public extension CIFF.PDF417BarcodeGenerator {
	@objc var outputCGImage: CGImage? {
		let rawSelectorOutput = self.filter.perform(#selector(getter: CIFFObjectExtractor.outputCGImage))
		if let obj = rawSelectorOutput?.takeUnretainedValue() {
			let im = obj as! CGImage
			return im
		}
		return nil
	}

	// A hidden class for extracting any additional output objects
	private final class CIFFObjectExtractor: NSObject {
		@objc var outputCGImage: Unmanaged<AnyObject>?
	}
}
