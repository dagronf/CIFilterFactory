# CIFilterFactory

Swift and Objective-C generated classes for built-in CIFilter types. Type safe, auto-complete friendly and (mostly) documented.

Supports macOS, tvOS, iOS and mac Catalyst

<p align="center">
    <img src="https://img.shields.io/github/v/tag/dagronf/CIFilterFactory" />
    <img src="https://img.shields.io/badge/macOS-10.11+-red" />
    <img src="https://img.shields.io/badge/iOS-10+-blue" />
    <img src="https://img.shields.io/badge/tvOS-11+-orange" />
    <img src="https://img.shields.io/badge/mac Catalyst-supported-green" />
    <img src="https://github.com/dagronf/CIFilterFactory/actions/workflows/build.yml/badge.svg" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.4-orange.svg" />
    <img src="https://img.shields.io/badge/License-MIT-lightgrey" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
</p>

## Why

I like CIFilters a lot. I've always found the `CIFilter` interfaces to be 

1. Hard to use due to the opaque interface (no code completion!), and 
2. Easy to make basic mistakes such as type mismatches etc. which would be very difficult to identify in a review (for example).  Given that the parameters to filters are Any? values, there is no type checking around the api.
3. Xcode's documentation for each filter is lacking for the most part.
4. Information about the OS version in which the CIFilter appeared is buried within the opaque interface. 

## What is `CIFilterFactory`?

This package contains automatically generated type-safe and documented class wrappers for all of the built-in `CIFilter` types. 

It also includes the scripts used to generate the classes, so that as new built-in `CIFilters` are added the classes can be easily (re)generated to include the new filters.

|   |   |
|---|---|
| **Type safety** | All filter attributes are exposed via class properties using type-safe Swift/Objective-C classes and types where possible. |
| **Range clamping** | Filters which define valid ranges for attributes have undefined behaviour when the assigned value is outside range. These classes automatically clamp assigned values to the valid range to avoid potential crashes for invalid values. |
| **Auto-completion** | As the filter attributes are exposed as properties, Xcode can provide autocomplete information while you code. |
| **Version information** | The generated classes are wrapped in `@available()` to make sure that only the filters your deployment target defines are available. |
| **Documention** | All classes and attributes are documented such that Xcode can provide <br/>• meaningful inline documentation. <br/>• meaningful documentation in the Xcode quick-help inspector. <br/>• With Xcode 13, you can compile a docarchive and have the full documentation for all filters available within the Xcode documentation viewer |

## TL;DR Show me something!

### Before

```swift
let filter = CIFilter(name: "CICheckerboardGenerator")!
filter.setValue(CIVector(x: 150.0, y: 150.0), forKey: "inputCenter")
filter.setValue(CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), forKey: "inputColor0")
filter.setValue(CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), forKey: "inputColor1")
filter.setValue(80.0, forKey: "inputWidth")
filter.setValue(1.0, forKey: "inputSharpness")
let output = filter.outputImagelet output = filter.outputImage
```

### After

```swift
let filter = CIFF.CheckerboardGenerator()!
filter.center = CGPoint(x: 150.0, y: 150.0)
filter.color0 = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
filter.color1 = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
filter.width = 80.0
filter.sharpness = 1.0
let output = filter.outputImage
```

## Features

### Type safety and discovery

`CIFilter` use string constants to define the argument parameters.  Incredibly powerful and extensible but not overly discoverable without having to resort to online documentation like [CIFilter.io](https://cifilter.io).  And forget Xcode code completion. As the parameter values are defined as `String: Any?`, you can spend a long time debugging an issue because you put in the wrong key string or an incorrect value type.

This library pulls out the 'soft' string-based parameters eg :-

```swift
// compiles, but filter is nil as there's a typo in CIBloom
let filter = CIFilter("CIBLoom")!

// no code completion, no type safety
filter.setValue(11.8, forKey: "inputRadius")

// These compile fine, but result in undefined behaviour during runtime.
filter.setValue(vector, forKey: "inputRadius")
filter.setValue(12.0, forKey: "inputNoodles")
```

and creates type-safe parameters like :-

```swift
// No chance of a poorly named filter
guard let filter = CIFF.Bloom() else { fatalError() }

// code completion support, type safe, range safe. Read documentation directly in Xcode
filter.inputRadius = 11.8

// compile time error, invalid type
filter.inputRadius = vector
filter.inputTitle = 12.0
```

### Documentation

CIFilterFactory defines all available documentation inline within the code itself, allowing Xcode to provide useful 
Quick Help for all available filters and parameters.

For example :-

#### Filter definition

```swift
/// Accordion Fold Transition
///
/// Transitions from one image to another of a differing dimensions by unfolding.
///
/// **CIFilter Name**
/// - CIAccordionFoldTransition
///
/// **Availability**
/// - macOS 10.10, iOS 8, tvOS 8
///
/// **Categories**
/// - CICategoryBuiltIn
/// - CICategoryHighDynamicRange
/// - CICategoryStillImage
/// - CICategoryTransition
/// - CICategoryVideo
///
/// **Documentation Links**
/// - [CIAccordionFoldTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAccordionFoldTransition)
/// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciaccordionfoldtransition?language=objc)
/// - [CIFilter.io documentation](https://cifilter.io/CIAccordionFoldTransition/)
///
@available(macOS 10.10, iOS 8, tvOS 8, *)
@objc(CIFFAccordionFoldTransition) class AccordionFoldTransition: Core {
```

#### Api parameter definition

```swift
/// The width of each bar.
///
/// CIFilter attribute information
/// - Attribute key: `inputWidth`
/// - Internal class: `NSNumber`
/// - Type: `CIAttributeTypeDistance`
/// - Minimum Value: `2.0`
/// - Default Value: `30.0`
@objc public var width: Double {
   ...
}

/// `width` range definition
public static let widthRange = PartialRangeFrom<Double>(2.0)
```

### Value ranges

A lot of the APIs define minimum and/or maximum values for input values.  Unfortunately, these values are only publicly 
visible from Apple's documentation or via the programmatic interface.  The generated code embeds the min/max definitions
into the code comments, as well as defining clamping ranges for input values to ensure correct behaviour.
Range definitions for each range-appropriate parameter are also automatically generated and made available for your code
to validate against if needed.

### OS Dependent types

Some of the supported types (like an affine transform) use different class types depending on the
platform (`NSAffineTransform` on macOS, `CGAffineTransform` wrapped in `NSValue` on everything else). This library 
defines a common AffineTransform class which wraps the os-dependent type meaning that you don't have to your code.

## Functional CIImage interface

### Chainable filters

Each filter that supports an `inputImage` generates an extension on `CIImage` for the filter to allow for
simple chaining of filters onto a `CIImage`.  Each call returns either the original image, or a new `CIImage`
with the filter applied.

Each functional call also has an `isActive` parameter to allow you to easily enable/disable the filter within the chain.

For example, the CIBokehBlur filter generates :-

```swift
public extension CIImage {
   /// Apply the 'Bokeh Blur' filter to this image and return a new filtered image
   ///
   /// - Parameters:
   ///   - radius: The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result. (0.0...500.0)
   ///   - ringAmount: The amount of extra emphasis at the ring of the bokeh. (0.0...1.0)
   ///   - ringSize: The size of extra emphasis at the ring of the bokeh. (0.0...0.2)
   ///   - softness: No Description (0.0...10.0)
   ///   - isActive: If true applies the filter and returns a new image, else returns this image
   /// - Returns: The filtered image, or this image if the filter is not active
   ///
   /// Smooths an image using a disc-shaped convolution kernel.
   ///
   /// **Categories**: Blur, BuiltIn, HighDynamicRange, StillImage, Video
   ///
   /// **Documentation Links**
   /// - [CIBokehBlur Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBokehBlur)
   /// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
   /// - [CIFilter.io documentation](https://cifilter.io/CIBokehBlur/)
   @inlinable func applyingBokehBlur(
      radius: Double = CIFF.BokehBlur.radiusDefault,
      ringAmount: Double = CIFF.BokehBlur.ringAmountDefault,
      ringSize: Double = CIFF.BokehBlur.ringSizeDefault,
      softness: Double = CIFF.BokehBlur.softnessDefault,
      isActive: Bool = true
   ) -> CIImage {
      ...
   }
}
```

And then, you can simply chain these filters

```swift
let myImage = CIImage(...)
let filtered = myImage
   .applyingBokehBlur(radius: 100)
   .applyingSepiaTone()
```

### Generation filters

For generation filters like `CIQRCodeGenerator` (these filters don't have an explicit `inputImage`), a static creator function is generated

```swift
extension CIImage {
   /// Create a new CIImage using the 'QR Code Generator' filter
   ///
   /// - Parameters:
   ///   - message: The message to encode in the QR Code
   ///   - correctionLevel: QR Code correction level L, M, Q, or H.
   /// - Returns: A new image by running the filter, or nil if the image could not be created
   ///
   /// Generate a QR Code image for message data.
   ///
   /// **Categories**: BuiltIn, Generator, StillImage
   ///
   /// **Documentation Links**
   /// - [CIQRCodeGenerator Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIQRCodeGenerator)
   /// - [CoreImage.CIFilterBuiltins Xcode documentation](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator?language=objc)
   /// - [CIFilter.io documentation](https://cifilter.io/CIQRCodeGenerator/)
   @inlinable static func createUsingQRCodeGenerator(
      message: Data,
      correctionLevel: String
   ) -> CIImage? {
      return CIFF.QRCodeGenerator(
         message: message,
         correctionLevel: correctionLevel
      )?.outputImage
   }
}
```

## How

`CIFilter` provides quite an amazing *programmatic* discovery interface, where you can ask it what filters are registered, the parameters that are accepted for a specific filter and all sorts of useful information like localized argument descriptions etc.  Very cool, but also kinda useless when you're just wanting to create a sepia filter.

`CIFilterFactory` is automatically generated using a swift script file, which enumerates the available filters on the system and builds up a type-safe class structure for each of the filters.  It also uses the discovery apis to document the generated code, meaning that Xcode has the ability to fully document each of the created classes.  Not only that, but CIFilter also defines which operating systems it supports (macOS, tvOS, iOS) and when the filter became available, and the generated code takes advantage of this by wrapping generated classes in `#available` calls.

Using `CIFilterFactory`, Xcode can now :-

* Check available filters for platform/os version at compile time
* code-complete
* type check methods and generate error(s) at compile-time
* clamp input values to defined ranges.

Cool!

## Example

### Swift example

#### Using CIFilter methods

```swift
guard let bloomFilter = CIFilter(name: "CIBloom") else { fatalError() }
bloomFilter.setValue(inputImage, forKey: kCIInputImageKey)
bloomFilter.setValue(0.3, forKey: kCIInputIntensityKey)
bloomFilter.setValue(5, forKey: kCIInputRadiusKey)
let outputImage = bloomFilter.outputImage
```

#### Using CIFilterFactory

```swift
guard let bloomFilter = CIFF.Bloom() else { fatalError() }
bloomFilter.inputImage = image
bloomFilter.intensity = 0.3
bloomFilter.radius = 5
let outputImage = bloomFilter.outputImage
```

Using the generated interface provides :-

1. Avoid mistakes from incorrect parameter string identifiers
2. Code completion
3. Type checking
4. Automatic range validation
5. Automatically generate expressive Xcode documentation within the 

### Objective-C example

```objc 
id appimage = [NSImage imageNamed:NSImageNameApplicationIcon];
id bir = [[NSBitmapImageRep alloc] initWithData:[appimage TIFFRepresentation]];
id image = [[CIImage alloc] initWithBitmapImageRep:bir];

CIFFBloom* filter = [[CIFFBloom alloc] init];
[filter setInputImage: image];
[filter setRadius: 10];
[filter setIntensity: 4];
CIImage* output = [filter outputImage];
assert(output != nil);
```

## What about `import CoreImage.CIFilterBuiltins`?

In more recent versions of Xcode, the SDK now comes with a pre-generated set of CIFilter classes (like `CIFilter.pixellate()`). This library was written before `CIFilterBuiltins` was available, and was also required to support Objective-C (admittedly, becoming less and less of a problem as time goes on).

* only available for newer versions of Xcode.
* No objective-c support.
* Some filters are not available (eg. `CICrop`)
* Basically undocumented. `CIFilterFactory` embeds ALL the documentation within the generated code so it's directly available when you need it.

## Usage

Use Swift Package Manager. 

You can find some really simple examples for both Swift and Objective-C in the `Demo` subfolder.

## Regenerating CIFilterFactory

NOTE: This is only available for Xcode 13 and later

There is a project in the `tools/generator` folder, called `ciff_generator`. Open this in XCode 13 and build/run
the project.

Additionally, there is a script in the tools directory which will rebuild the filters and update the XCode documentation.

1. Open a terminal and navigate to the CIFilterFactory/tools folder
2. run `sh regenerate.sh`

## Generating a docarchive file

NOTE: This is only available for Xcode 13 and later

1. Open a terminal and navigate to the CIFilterFactory/tools folder
2. run `sh make-docs.sh`

## History

### `16.0.0`

* Regenerated with support for new filters in macOS 13, iOS 16 and tvOS 16
* Slightly nicer support for filter additional output types
* Minor updates to code comments with more information

### `15.0.4`

* **BREAKING** : I've changed 'image' in the generated files to 'inputImage' in order to make the code more readable.
You will need to update your code to change any calls to `<filter>.image = …` -> `<filter>.inputImage = …` 


### `15.0.0`

* Rebuilt the generator to be somewhat cleaner, but as a result cannot be run as a script. It has to be compiled and run.
This fixes a number of glitches relating to ranges and naming.

### `14.0.1`

* Changed API to use standard types (eg. Double, Bool, Int, UInt) instead of `NSNumber?`

### `14.0.0`

* Renamed generated classes from the verbose `CIFilterFactory.Bloom` to `CIFF.Bloom`.

```swift
let filter = CIFilterFactory.AztecCodeGenerator()
...becomes
let filter = CIFF.AztecCodeGenerator()
```

### `13.0.1`

* Restructured generated source to better support Xcode documentation
* Added script for generating docarchive file

### `13.0.0`

* Changed names to remove 'CI' prefix to class names.

```swift
// @objc(CIFilterFactory_CIAztecCodeGenerator) class CIAztecCodeGenerator
let filter = CIFilterFactory.CIAztecCodeGenerator()
```

becomes

```swift
// @objc(CIFilterFactory_AztecCodeGenerator) class AztecCodeGenerator
let filter = CIFilterFactory.AztecCodeGenerator()
```

* Removed `input` from the start of filter attributes where appropriate. Any attributes not starting with `input` are not changed

```swift
@objc public dynamic var inputCorrectionLevel: NSNumber?
```

becomes

```swift
@objc public var correctionLevel: NSNumber?
```

* Removed static filter creator function. The change to the class names to remove the `CI` prefix reduces the need. Also declutters the `CIFilter` namespace.
* Changed `CIFilterFactory.AffineTransform` -> `CIAffineTransform` to declutter code.
* Removed `CIFilterFactory.Rectangle` and `CIFilterFactory.Point` (not needed)

### `12.1.0`

* Directly support native Data and String types for Swift.

### `12.0.0`

* Regenerated for macOS Monterey

### `11.1.0`

* Regenerated on macOS 11.1 to update for the latest filters
* (convenience) Generate convenience initializer with default parameters for each filter
* (convenience) Generate static filter creator on `CIFilter` so you can use

	```swift
	var filter = CIFilter.Sepia()
	```

## License

```
MIT License

Copyright (c) 2022 Darren Ford

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
