//
//  File.swift
//  
//  Copyright © 2024 Darren Ford. All rights reserved.
//

import Foundation

struct AdditionalOutputKey: Hashable {
	let filterName: String
	let outputKeyName: String
	internal init(_ filterName: String, _ outputKeyName: String) {
		self.filterName = filterName
		self.outputKeyName = outputKeyName
	}
}

// Map known filter output types with their return type.
// Not all 'additional outputs' have a simple map
// (for example LanczosScaleTransform has outputImageNewScaleX:scaleY:)
// so a simple map isn't possible.
// This is a basic map that I've put together myself
let additionalOutputKeyTypes: Dictionary<AdditionalOutputKey, String> = [
	AdditionalOutputKey("CIAztecCodeGenerator", "outputCGImage"): "CGImage",
	
	AdditionalOutputKey("CIBarcodeGenerator", "outputCGImage"): "CGImage",

	AdditionalOutputKey("CICode128BarcodeGenerator", "outputCGImage"): "CGImage",

	AdditionalOutputKey("CIPDF417BarcodeGenerator", "outputCGImage"): "CGImage",

	AdditionalOutputKey("CIQRCodeGenerator", "outputCGImage"): "CGImage",

	AdditionalOutputKey("CIAreaHistogram", "outputData"): "CFData",
	AdditionalOutputKey("CIAreaHistogram", "outputImageMPS"): "CIImage",
	AdditionalOutputKey("CIAreaHistogram", "outputImageNonMPS"): "CIImage",

	AdditionalOutputKey("CIAreaLogarithmicHistogram", "outputData"): "CFData",
	AdditionalOutputKey("CIAreaLogarithmicHistogram", "outputImageMPS"): "CIImage",
	AdditionalOutputKey("CIAreaLogarithmicHistogram", "outputImageNonMPS"): "CIImage",
]

// These filters introduced a new parameter 'inputExtrapolate' that isn't available on older versions.
// We need to check these when setting/getting
let propertiesRequiringExistenceCheck: [String] = [
	"CIPhotoEffectMono",
	"CIPhotoEffectChrome",
	"CIPhotoEffectFade",
	"CIPhotoEffectInstant",
	"CIPhotoEffectMono",
	"CIPhotoEffectNoir",
	"CIPhotoEffectProcess",
	"CIPhotoEffectTonal",
	"CIPhotoEffectTransfer",
]
