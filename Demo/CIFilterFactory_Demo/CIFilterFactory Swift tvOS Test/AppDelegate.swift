//
//  AppDelegate.swift
//  CIFilterFactory Swift tvOS Test
//
//  Created by Darren Ford on 9/7/20.
//  Copyright © 2024 Darren Ford. All rights reserved.
//

import UIKit
import CIFilterFactory

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		basicTests()
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func basicTests() {

		let appimage = UIImage(named: "AppIcon")!
		let image = CIImage(cgImage: appimage.cgImage!)

		do {
			let filter = CIFF.QRCodeGenerator()!
			filter.message = "Hello".data(using: .utf8)!
			filter.correction = .H
			let output = filter.outputImage!
			let uiImage = UIImage(ciImage: output)
			Swift.print(uiImage)

			let cgImage = filter.outputCGImage
			let c = cgImage!.takeUnretainedValue()
			Swift.print(c)
			let uiImage2 = UIImage(cgImage: c)
			Swift.print(uiImage2)

			let origString = String(data: filter.message!, encoding: .utf8)
			assert(origString == "Hello")
		}

		do {
			guard let bloomFilter = CIFF.Bloom() else { fatalError() }
			bloomFilter.inputImage = image
			bloomFilter.intensity = 0.3
			bloomFilter.radius = 5
			let outputImage = bloomFilter.outputImage
			assert(outputImage != nil)
		}

		do {
			guard let textFilter = CIFF.TextImageGenerator() else { fatalError() }
			textFilter.text = "Noodle"
			assert(textFilter.text == "Noodle")

			let output = textFilter.outputImage!
			let uiImage = UIImage(ciImage: output)
			Swift.print(uiImage)
		}
	}

}

