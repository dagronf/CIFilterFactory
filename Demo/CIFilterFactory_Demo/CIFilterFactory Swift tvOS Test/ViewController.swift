//
//  ViewController.swift
//  CIFilterFactory Swift tvOS Test
//
//  Created by Darren Ford on 9/7/20.
//  Copyright © 2020 Darren Ford. All rights reserved.
//

import UIKit

import CIFilterFactory

import CoreImage.CIFilterBuiltins

class ViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		do {
			let filter = CIFF.QRCodeGenerator()!
			filter.message = "Hello".data(using: .utf8)!
			filter.correction = .H
			let output = filter.outputImage!
			let uiImage = UIImage(ciImage: output)
			Swift.print(uiImage)

			let cgImage = filter.outputCGImage
			Swift.print(cgImage)
			let uiImage2 = UIImage(cgImage: cgImage!)
			Swift.print(uiImage2)
		}

		let appimage = UIImage(named: "AppIcon")!
		let image = CIImage(cgImage: appimage.cgImage!)

		do {
			guard let bloomFilter = CIFF.Bloom() else { fatalError() }
			bloomFilter.inputImage = image
			bloomFilter.intensity = 0.3
			bloomFilter.radius = 5
			let outputImage = bloomFilter.outputImage
			assert(outputImage != nil)
		}

		/// Test convenience initializer for sepia filter
		guard let sepiaFilter = CIFF.SepiaTone(inputImage: image, intensity: 0.9) else {
			fatalError()
		}

		// Crystallize filter using the CIFilter extension

		guard let crystalize = CIFF.Crystallize() else {
			fatalError()
		}

		// Use the output of the sepia filter as the input to the crystallize filter
		crystalize.inputImage = sepiaFilter.outputImage
		crystalize.radius = 20
		crystalize.center = CGPoint(x: 150, y: 200)

		let output = crystalize.outputImage
		let outputImage = UIImage(ciImage: output!)
		
		self.imageView.image = outputImage

		/// Just a simple check
		assert(crystalize.radius == 20)
		assert(crystalize.center.x == 150)
		assert(crystalize.center.y == 200)
	}

}

