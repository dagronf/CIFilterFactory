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

		let appimage = UIImage(named: "AppIcon")!
		let image = CIImage(cgImage: appimage.cgImage!)

		// Sepia filter
		let sepiaFilter = CIFF.SepiaTone(intensity: 0.9)!

		// Crystallize filter
		let crystalize = CIFF.Crystallize(radius: 20, center: CGPoint(x: 150, y: 200))!

		// Use the chaining API to apply the filters
		let output = image.applying(filters: sepiaFilter, crystalize)
		let outputImage = UIImage(ciImage: output)
		
		self.imageView.image = outputImage

		/// Just a simple check
		assert(crystalize.radius == 20)
		assert(crystalize.center.x == 150)
		assert(crystalize.center.y == 200)
	}
}

