//
//  ViewController.swift
//  CIFilterFactory Swift tvOS Test
//
//  Created by Darren Ford on 9/7/20.
//  Copyright © 2020 Darren Ford. All rights reserved.
//

import UIKit

import CIFilterFactory

class ViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		let appimage = UIImage(named: "AppIcon")!
		let image = CIImage(cgImage: appimage.cgImage!)

		let sepiaFilter = CIFilterFactory.CISepiaTone()!
		sepiaFilter.inputImage = image
		sepiaFilter.inputIntensity = 1.0

		let crystalize = CIFilterFactory.CICrystallize()!
		crystalize.inputImage = sepiaFilter.outputImage
		crystalize.inputRadius = 20
		crystalize.inputCenter = CIFilterFactory.Point(x: 150, y: 200)

		let output = crystalize.outputImage
		let outputImage = UIImage(ciImage: output!)
		
		self.imageView.image = outputImage

		/// Just a simple check
		assert(crystalize.inputRadius == 20)
		assert(crystalize.inputCenter?.point.x == 150)
		assert(crystalize.inputCenter?.point.y == 200)
	}

}

