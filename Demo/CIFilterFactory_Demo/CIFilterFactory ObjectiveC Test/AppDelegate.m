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

	CIVector* vec = [[CIVector alloc] initWithX:150 Y:200];
	[crystalize setInputCenter:vec];

	CIImage* output = [crystalize outputImage];
	struct CGImage* out = [[CIContext context] createCGImage:output fromRect:[output extent]];

	id outputImage = [[NSImage alloc] initWithCGImage:out size:[output extent].size];
	[[self imageView] setImage:outputImage];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}


@end
