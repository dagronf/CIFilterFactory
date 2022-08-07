//
//  File.swift
//  
//
//  Created by Darren Ford on 7/8/2022.
//

import Foundation
import CoreImage

extension CIImage {
	func asCGImage(context: CIContext? = nil) -> CGImage? {
		let ctx = context ?? CIContext(options: nil)
		return ctx.createCGImage(self, from: self.extent)
	}
}
