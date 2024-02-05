//
//  AppDelegate.m
//  CIFilterFactory ObjectiveC Test
//
//  Created by Darren Ford on 9/7/20.
//  Copyright © 2024 Darren Ford. All rights reserved.
//

#import "AppDelegate.h"

@import CIFilterFactory;
@import CoreImage;

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSImageView *imageView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application

	[self basicTesting];


	id appimage = [NSImage imageNamed:NSImageNameApplicationIcon];
	id bir = [[NSBitmapImageRep alloc] initWithData:[appimage TIFFRepresentation]];
	id image = [[CIImage alloc] initWithBitmapImageRep:bir];
	assert(image);

	// Sepia filter
	CIFFSepiaTone* sepiaFilter = [[CIFFSepiaTone alloc] initWithInputImage:nil
																					 intensity:1.0];
	assert(sepiaFilter);

	CIFFCrystallize* crystalize = [[CIFFCrystallize alloc] initWithInputImage:nil
																							 radius:20
																							 center:CGPointMake(150, 200)];
	assert(crystalize);

	// Create the output image by chaining the filters
	CIImage* output = [image applying:@[sepiaFilter, crystalize]];

//	CIImage* output = [crystalize outputImage];
	struct CGImage* out = [[CIContext context] createCGImage:output fromRect:[output extent]];

	id outputImage = [[NSImage alloc] initWithCGImage:out size:[output extent].size];
	[[self imageView] setImage:outputImage];

	CGPoint c = [crystalize center];
	assert(c.x == 150);
	assert(c.y == 200);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

// Some basic tests

- (void)basicTesting {

	id appimage = [NSImage imageNamed:NSImageNameApplicationIcon];
	id bir = [[NSBitmapImageRep alloc] initWithData:[appimage TIFFRepresentation]];
	id image = [[CIImage alloc] initWithBitmapImageRep:bir];
	assert(image);

	{
		// Simple QR Code generator example using native NSString and NSData
		CIFFQRCodeGenerator *filter = [[CIFFQRCodeGenerator alloc] init];
		[filter setCorrectionLevel:@"H"];
		[filter setMessage: [@"Hello" dataUsingEncoding:NSUTF8StringEncoding]];
		CIImage* output = [filter outputImage];
		struct CGImage* out = [[CIContext context] createCGImage:output fromRect:[output extent]];
		NSImage *im = [[NSImage alloc] initWithCGImage:out size:NSZeroSize];
		assert(im != nil);

		CGImageRef r = [filter outputCGImage];
		assert(r != nil);
	}

	{
		CIFFBokehBlur* bb = [[CIFFBokehBlur alloc] init];
		bb.ringAmount = 14.4;
		assert([bb ringAmount] == 1); // clamped

		bb.ringAmount = 0.5;
		assert([bb ringAmount] == 0.5);
	}

	{
		CIFFBloom* filter = [[CIFFBloom alloc] init];
		[filter setInputImage:image];
		[filter setRadius:10];
		[filter setIntensity:4.45];
		CIImage* output = [filter outputImage];
		assert(output != nil);

		if (@available(macOS 10.15, *)) {
			CIFFKMeans* f = [[CIFFKMeans alloc] init];
			[f setPerceptual: YES];
			assert([f perceptual] == YES);
			[f setPerceptual: NO];
			assert([f perceptual] == NO);
		}
	}

	if (@available(macOS 10.15, *)) {
		CIFFKeystoneCorrectionHorizontal *filter = [[CIFFKeystoneCorrectionHorizontal alloc] init];

		filter.inputImage = image;
		CIImage* out = filter.outputImage;
		assert(out != nil);
	}

	{
		CIFFGloom* f = [[CIFFGloom alloc] initWithInputImage:image radius:5 intensity:1];
		assert([f radius] == 5);
		assert([f intensity] == 1);

		// This should clamp to 0
		f.intensity = -10;
		assert([f intensity] == 0);
	}

	{
		CIFFTextImageGenerator* filter = [[CIFFTextImageGenerator alloc] init];
		[filter setText:@"Noodle"];
		CIImage* output = [filter outputImage];
		assert(output);
		struct CGImage* out = [[CIContext context] createCGImage:output fromRect:[output extent]];
		id outputImage = [[NSImage alloc] initWithCGImage:out size:[output extent].size];
		assert(outputImage);

		NSString* storedValue = [filter text];
		assert([storedValue isEqual:@"Noodle"]);
	}


}


@end
