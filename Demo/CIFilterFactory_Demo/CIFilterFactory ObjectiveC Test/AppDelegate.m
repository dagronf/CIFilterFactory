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
		CIFilterFactory_CIQRCodeGenerator *filter = [[CIFilterFactory_CIQRCodeGenerator alloc] init];
		[filter setInputCorrectionLevel:@"H"];
		[filter setInputMessage: [@"Hello" dataUsingEncoding:NSUTF8StringEncoding]];
		id output = [filter outputImage];
		struct CGImage* out = [[CIContext context] createCGImage:output fromRect:[output extent]];
		NSImage *im = [[NSImage alloc] initWithCGImage:out size:NSZeroSize];
		assert(im != nil);
	}

	id appimage = [NSImage imageNamed:NSImageNameApplicationIcon];
	id bir = [[NSBitmapImageRep alloc] initWithData:[appimage TIFFRepresentation]];
	id image = [[CIImage alloc] initWithBitmapImageRep:bir];
	assert(image);

	id sepiaFilter = [[CIFilterFactory_CISepiaTone alloc] init];
	assert(sepiaFilter);
	[sepiaFilter setInputImage:image];
	[sepiaFilter setInputIntensity: @(1.0)];

	id crystalize = [[CIFilterFactory_CICrystallize alloc] init];
	assert(crystalize);
	[crystalize setInputImage:[sepiaFilter outputImage]];
	[crystalize setInputRadius:@(20)];

	CIFilterFactoryPoint* pt = [[CIFilterFactoryPoint alloc] initWithX:150 y:200];
	[crystalize setInputCenter:pt];

	CIImage* output = [crystalize outputImage];
	struct CGImage* out = [[CIContext context] createCGImage:output fromRect:[output extent]];

	id outputImage = [[NSImage alloc] initWithCGImage:out size:[output extent].size];
	[[self imageView] setImage:outputImage];

	id c = [crystalize inputCenter];
	assert([c point].x == 150);
	assert([c point].y == 200);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}


@end
