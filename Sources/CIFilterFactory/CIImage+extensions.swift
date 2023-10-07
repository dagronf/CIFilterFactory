//
//  CIImage+extensions.swift
//
//  Created by Darren Ford on 7/8/2022.
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
import CoreImage

public extension CIImage {
	/// Apply the provided chain of filters to this image, returning the filtered image.
	///
	/// See: **Chaining Filters for Complex Effects** in the [Core Image Programming Guide](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_tasks/ci_tasks.html).
	@objc func applying(_ filters: [CIFF.Core]) -> CIImage {
		var outputImage: CIImage = self
		filters.forEach { filter in
			let parameters = filter.inputParameters.removingValue(forKey: "inputImage")
			outputImage = outputImage.applyingFilter(filter.name, parameters: parameters)
		}
		return outputImage
	}
}

public extension CIImage {
	/// Generate a CGImage representation of this CIImage
	/// - Parameters:
	///   - context: The context to use, or nil to use a default context
	///   - size: The size of the resulting CGImage, or nil to use the CIImage extent
	/// - Returns: The image
	func asCGImage(context: CIContext? = nil, size: CGSize? = nil) -> CGImage? {
		let context = context ?? CIContext(options: nil)
		let rect: CGRect
		if let size = size {
			rect = CGRect(origin: .zero, size: size)
		}
		else {
			rect = self.extent
			if rect.width > 20000 || rect.height > 20000 {
				return nil
			}
		}
		return context.createCGImage(self, from: rect)
	}
}

#if os(macOS)
import AppKit
#else
import UIKit
#endif

public extension CIImage {
	#if os(macOS)
	@inlinable func nsImage() -> NSImage {
		let rep = NSCIImageRep(ciImage: self)
		guard rep.size.width <= 10000, rep.size.height <= 10000 else { return NSImage() }
		let nsImage = NSImage(size: rep.size)
		nsImage.addRepresentation(rep)
		return nsImage
	}
	#else
	@inlinable func uiImage() -> UIImage { UIImage(ciImage: self) }
	#endif
}

public enum CIFFScaling: Int {
	case aspectFit = 0
	case aspectFill = 1
	case fill = 2
}

public extension CIImage {
	/// Save the extent and then re-crop to that extent after applying whatever is in the closure
	func recropping(apply: (CIImage) -> CIImage) -> CIImage {
		let savedExtent: CGRect = extent
		let newCIImage = apply(self)
		let cropped = newCIImage.cropped(to: savedExtent)
		return cropped
	}

//	func scaling(to targetSize: CGSize, _ method: CIFFScaling, isActive: Bool = true) -> CIImage {
//		guard isActive else { return self }
//		let currentSize = extent.size
//
//		if method == .aspectFit {
//			let smallerRatio: CGFloat = min(targetSize.width / currentSize.width, targetSize.height / currentSize.height)
//			let newSize: CGSize = CGSize(width: currentSize.width * smallerRatio, height: currentSize.height * smallerRatio)
//
//			return self.applyingLanczosScaleTransform(scale: smallerRatio)
////				.clampedToExtent()
//				.cropped(to: CGRect(origin: .zero, size: targetSize))
////				.cropped(to: CGRect(
////					x: (newSize.width - targetSize.width) / 2,
////					y: (newSize.height - targetSize.height) / 2,
////					width: targetSize.width.rounded(.towardZero),
////					height: targetSize.height.rounded(.towardZero))
////				)
//		}
//		else if method == .aspectFill {
//			let largerRatio: CGFloat = max(targetSize.width / currentSize.width, targetSize.height / currentSize.height)
//			let newSize: CGSize = CGSize(width: currentSize.width * largerRatio, height: currentSize.height * largerRatio)
//			return self.applyingLanczosScaleTransform(scale: largerRatio)
//				.clampedToExtent()
//				.cropped(to: CGRect(
//					x: (newSize.width - targetSize.width) / 2,
//					y: (newSize.height - targetSize.height) / 2,
//					width: targetSize.width.rounded(.towardZero),
//					height: targetSize.height.rounded(.towardZero))
//				)
//		}
//		else {
//			// Compute scale and corrective aspect ratio
//			let scale = targetSize.height / (currentSize.height)
//			let aspectRatio = targetSize.width / (currentSize.width * scale)
//			return self.applyingLanczosScaleTransform(scale: scale, aspectRatio: aspectRatio)
//				.clampedToExtent()
//				.cropped(to: CGRect(origin: .zero, size: targetSize))
//		}
//	}
}

#endif
