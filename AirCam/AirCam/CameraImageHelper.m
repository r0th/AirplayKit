//
//  CameraImageHelper.m
//  HelloWorld
//
//  Created by Erica Sadun on 7/21/10.
//  Copyright 2010 Up To No Good, Inc. All rights reserved.
//

#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>
#import "CameraImageHelper.h"

@implementation CameraImageHelper
@synthesize session,  image;
static CameraImageHelper *sharedInstance = nil;

// Autorelease pool added thanks to suggestion by Josh Snyder
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer); 
    CVPixelBufferLockBaseAddress(imageBuffer,0); 
    uint8_t *baseAddress = (uint8_t *)CVPixelBufferGetBaseAddress(imageBuffer); 
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer); 
    size_t width = CVPixelBufferGetWidth(imageBuffer); 
    size_t height = CVPixelBufferGetHeight(imageBuffer); 
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB(); 
    CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst); 
    CGImageRef newImage = CGBitmapContextCreateImage(context); 
	CVPixelBufferUnlockBaseAddress(imageBuffer,0);
	
	self.image = [UIImage imageWithCGImage:newImage scale:1.0 orientation:UIImageOrientationRight];
	
    CGContextRelease(context); 
    CGColorSpaceRelease(colorSpace);
	CGImageRelease(newImage);
	[pool drain];
}

- (void) initialize
{
	NSError *error;
	AVCaptureDeviceInput *captureInput = [AVCaptureDeviceInput deviceInputWithDevice:[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo] error:&error];
	if (!captureInput)
	{
		NSLog(@"Error: %@", error);
		return;
	}
	
	// Update thanks to Jake Marsh who points out not to use the main queue
	dispatch_queue_t queue = dispatch_queue_create("com.myapp.tasks.grabcameraframes", NULL);
	AVCaptureVideoDataOutput *captureOutput = [[[AVCaptureVideoDataOutput alloc] init] autorelease];
	captureOutput.alwaysDiscardsLateVideoFrames = YES; 
	[captureOutput setSampleBufferDelegate:self queue:queue];
	// dispatch_release(queue); // Will not work when uncommented -- apparently reference count is altered by setSampleBufferDelegate:queue:
	
	NSDictionary *settings = [NSDictionary dictionaryWithObject:[NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA] forKey:(NSString *)kCVPixelBufferPixelFormatTypeKey];
	[captureOutput setVideoSettings:settings];
	
	self.session = [[[AVCaptureSession alloc] init] autorelease];
	[self.session addInput:captureInput];
	[self.session addOutput:captureOutput];
}

- (id) init
{
	if ((self = [super init])) [self initialize];
	return self;
}

- (UIView *) previewWithBounds: (CGRect) bounds
{
	UIView *view = [[[UIView alloc] initWithFrame:bounds] autorelease];
	
	AVCaptureVideoPreviewLayer *preview = [AVCaptureVideoPreviewLayer layerWithSession: self.session];
	preview.frame = bounds;
	preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
	[view.layer addSublayer: preview];
	
	return view;
}

- (void) dealloc
{
	self.session = nil;
	self.image = nil;
	[super dealloc];
}

#pragma mark Class Interface

+ (id) sharedInstance // private
{
	if(!sharedInstance) sharedInstance = [[self alloc] init];
    return sharedInstance;
}

+ (void) startRunning
{
	[[[self sharedInstance] session] startRunning];	
}

+ (void) stopRunning
{
	[[[self sharedInstance] session] stopRunning];
}

+ (UIImage *) image
{
	return [[self sharedInstance] image];
}

+ (UIView *) previewWithBounds: (CGRect) bounds
{
	return [[self sharedInstance] previewWithBounds: (CGRect) bounds];
}

@end
