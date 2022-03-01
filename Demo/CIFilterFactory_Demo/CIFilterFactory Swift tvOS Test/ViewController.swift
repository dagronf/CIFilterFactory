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
			let filter = CIFilterFactory.QRCodeGenerator()!
			filter.message = "Hello".data(using: .utf8)!
			filter.correctionLevel = "H"
			let output = filter.outputImage!
			let uiImage = UIImage(ciImage: output)
			Swift.print(uiImage)
		}

		let appimage = UIImage(named: "AppIcon")!
		let image = CIImage(cgImage: appimage.cgImage!)

		do {
			guard let bloomFilter = CIFilterFactory.Bloom() else { fatalError() }
			bloomFilter.image = image
			bloomFilter.intensity = 0.3
			bloomFilter.radius = 5
			let outputImage = bloomFilter.outputImage
		}

		/// Test convenience initializer for sepia filter
		guard let sepiaFilter = CIFilterFactory.SepiaTone(image: image, intensity: 0.9) else {
			fatalError()
		}

		// Crystallize filter using the CIFilter extension

		guard let crystalize = CIFilterFactory.Crystallize() else {
			fatalError()
		}

		// Use the output of the sepia filter as the input to the crystallize filter
		crystalize.image = sepiaFilter.outputImage
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

