//
//  ViewController.swift
//  CIFilterFactory Swift iOS Test
//
//  Created by Darren Ford on 9/5/2022.
//  Copyright © 2022 Darren Ford. All rights reserved.
//

import UIKit
import CIFilterFactory

class ViewController: UIViewController {

	@IBOutlet weak var image: UIImageView!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		let image = UIImage(named: "grumpy-cat")!

		let filter = CIFF.CircularScreen()!
		filter.inputImage = CIImage(image: image)
		let output = filter.outputImage!

		self.image.image = UIImage(ciImage: output)
	}


}

