//
//  main.swift
//  ciff_generator
//
//  Created by Darren Ford on 9/4/2022.
//

import Foundation
import CoreImage

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let outURL = URL(string: CommandLine.arguments[1], relativeTo: currentDirectoryURL)!

let generatedBase = outURL.appendingPathComponent("generated")
try! FileManager.default.createDirectory(at: generatedBase, withIntermediateDirectories: true, attributes: nil)

print("Generating CIFilter definitions into \(generatedBase.absoluteURL)")

Main.generateAll(outURL: generatedBase)

print("Generating CIFilter complete!")
