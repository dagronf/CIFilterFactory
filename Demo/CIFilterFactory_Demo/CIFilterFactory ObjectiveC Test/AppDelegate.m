//
//  AppDelegate.m
//  CIFilterFactory ObjectiveC Test
//
//  Created by Darren Ford on 9/7/20.
//  Copyright © 2020 Darren Ford. All rights reserved.
//

#import "AppDelegate.h"

@import CIFilterFactory;
@import CoreImage.CIContext;

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSImageView *imageView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application

	{
		// Simple QR Code generator example using native NSString and NSData
		CIFFQRCodeGenerator *filter = [[CIFFQRCodeGenerator alloc] init];
		[filter setCorrectionLevel:@"H"];
		[filter setMessage: [@"Hello" dataUsingEncoding:NSUTF8StringEncoding]];
		CIImage* output = [filter outputImage];
		struct CGImage* out = [[CIContext context] createCGImage:output fromRect:[output extent]];
		NSImage *im = [[NSImage alloc] initWithCGImage:out size:NSZeroSize];
		assert(im != nil);
	}

	id appimage = [NSImage imageNamed:NSImageNameApplicationIcon];
	id bir = [[NSBitmapImageRep alloc] initWithData:[appimage TIFFRepresentation]];
	id image = [[CIImage alloc] initWithBitmapImageRep:bir];
	assert(image);

	{
		CIFFBloom* filter = [[CIFFBloom alloc] init];
		[filter setImage:image];
		[filter setRadius:@(10)];
		[filter setIntensity:@(4)];
		CIImage* output = [filter outputImage];
		assert(output != nil);
	}

	id sepiaFilter = [[CIFFSepiaTone alloc] init];
	assert(sepiaFilter);
	[sepiaFilter setImage:image];
	[sepiaFilter setIntensity: @(1.0)];

	CIFFCrystallize* crystalize = [[CIFFCrystallize alloc] init];
	assert(crystalize);
	[crystalize setImage:[sepiaFilter outputImage]];
	[crystalize setRadius:@(20)];
	[crystalize setCenter:CGPointMake(150, 200)];

	CIImage* output = [crystalize outputImage];
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


@end
