//
//  main.swift
//  ciff_generator
//
//  Copyright © 2024 Darren Ford. All rights reserved.
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
