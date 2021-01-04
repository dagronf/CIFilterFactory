# CIFilterFactory

A Swift/Objective-C factory class (with generator) to provide type-safe and compiler friendly CIFilter classes

Supports macOS, tvOS, iOS and mac Catalyst

<p align="center">
    <img src="https://img.shields.io/badge/macOS-10.10+-red" />
    <img src="https://img.shields.io/badge/iOS-9+-blue" />
    <img src="https://img.shields.io/badge/tvOS-11+-orange" />
    <img src="https://img.shields.io/badge/mac Catalyst-supported-green" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" />
    <img src="https://img.shields.io/badge/License-MIT-lightgrey" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
</p>

## Why

CIFilters are incredibly powerful and performant image processing tools that are quite difficult to use and bug-prone due to the String-based interface.

I've always found the `CIFilter` interfaces to be 

1. Hard to use due to the opaque interface (no code completion!), and 
2. Easy to make basic mistakes such as type mismatches etc. which would be very difficult to identify in a review (for example).  Given that the parameters to filters are Any? values, there is no type checking around the api.

This library is an attempt to automatically generate a typesafe, discoverable wrapper interface to CIFilter.

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
let filter = CIFilterFactory.CIBloom()!

// code completion support, type safe
filter.inputRadius = 11.8

// compile fails, invalid type
filter.inputRadius = vector
filter.inputNoodles = 12.0
```

### Documentation

`CIFilterFactory` defines all available documentation inline within the code itself, allowing Xcode to provide useful Quick Help for all available filters and parameters.

For example :-

####

```swift
///
/// Accordion Fold Transition
///
/// Transitions from one image to another of a differing dimensions by unfolding.
///
/// **Links**
///
/// [CIAccordionFoldTransition Online Documentation](http://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAccordionFoldTransition)
///
/// [CIFilter.io documentation](https://cifilter.io/CIAccordionFoldTransition/)
///
@objc(CIFilterFactory_CIAccordionFoldTransition) class CIAccordionFoldTransition: Core {
   ...
```

#### Api parameter definition

```swift
///
/// The duration of the effect.
///
///   minValue: 0.0
///   maxValue: 1.0
///
let inputTime_Range: ClosedRange<Float> = 0.0 ... 1.0
@objc public var inputTime: NSNumber? {
   ...
```

### Value ranges

A lot of the APIs define minimum and/or maximum values for input values.  Unfortunately, these values are only publicly visible from Apple's documentation or via the programmatic interface.  The generated code embeds the min/max definitions into the code comments, as well as defining clamping ranges for input values to ensure correct behaviour. Range definitions for each range-appropriate parameter are also automatically generated and made available for your code to validate against if needed.

### OS Dependent types

Some of the supported types (like an affine transform) use different class types depending on the platform (`NSAffineTransform` on macOS, `CGAffineTransform` wrapped in `NSValue` on everything else). This library defines a common AffineTransform class which wraps the os-dependent type meaning that you don't have to your code.

## How

`CIFilter` provides quite an amazing *programmatic* discovery interface, where you can ask it what filters are registered, the parameters that are accepted for a specific filter and all sorts of useful information like localized argument descriptions etc.  Very cool, but also kinda useless when you're just wanting to create a sepia filter.

`CIFilterFactory` is automatically generated using a swift script file, which enumerates the available filters on the system and builds up a type-safe class structure for each of the filters.  It also uses the discovery apis to document the generated code, meaning that Xcode has the ability to fully document each of the created classes.  Not only that, but CIFilter also defines which operating systems it supports (macOS, tvOS, iOS) and when the filter became available, and the generated code takes advantage of this by wrapping generated classes in `#available` calls.

Using `CIFilterFactory`, Xcode can now code-complete and type check classes and filter parameters.

## Example

### Swift example

#### Before

```swift
guard let bloomFilter = CIFilter(name: "CIBloom") else { fatalError() }
bloomFilter.setValue(inputImage, forKey: kCIInputImageKey)
bloomFilter.setValue(0.3, forKey: kCIInputIntensityKey)
bloomFilter.setValue(5, forKey: kCIInputRadiusKey)
let outputImage = bloomFilter.outputImage
```

#### After

```swift
guard let bloomFilter = CIFilterFactory.CIBloom() else { fatalError() }
bloomFilter.inputImage = inputImage
bloomFilter.inputIntensity = 0.3
bloomFilter.inputRadius = 5
let outputImage = bloomFilter.outputImage
```

Using the generated interface provides :-

1. Avoid mistakes from incorrect parameter string identifiers
2. Code completion
3. Type checking
4. Automatic range validation

### Objective-C example

```objc 
id appimage = [NSImage imageNamed:NSImageNameApplicationIcon];
id bir = [[NSBitmapImageRep alloc] initWithData:[appimage TIFFRepresentation]];
id image = [[CIImage alloc] initWithBitmapImageRep:bir];

id filter = [[CIFilterFactory_CIBloom alloc] init];
[filter setInputImage:image];
[filter setInputRadius:@(10)];
[filter setInputIntensity:@(4)];

CIImage *im = [filter outputImage];
assert(im != nil);
```

## Usage

Use Swift Package Manager

You can find some really simple examples for both Swift and Objective-C in the `Demo` subfolder.

## Regenerating CIFilterFactory

1. Open a terminal and navigate to the CIFilterFactory/Tools folder
2. run `sh regenerate.sh`

## What else?

* Clean up the generator script
* Better type support

## History

`11.1.0`

* Regenerated on macOS 11.1 to update for the latest filters
* (convenience) Generate convenience initializer with default parameters for each filter
* (convenience) Generate static filter creator on `CIFilter` so you can use

	```swift
	var filter = CIFilter.Sepia()
	```

## License

```
MIT License

Copyright (c) 2020 Darren Ford

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

