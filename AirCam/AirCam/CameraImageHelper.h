//
//  CameraImageHelper.h
//  HelloWorld
//
//  Created by Erica Sadun on 7/21/10.
//  Copyright 2010 Up To No Good, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CameraImageHelper : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate>
{
	AVCaptureSession *session;
	UIImage *image;
}
@property (retain) AVCaptureSession *session;
@property (retain) UIImage *image;

+ (void) startRunning;
+ (void) stopRunning;
+ (UIImage *) image;

+ (UIView *) previewWithBounds: (CGRect) bounds;
@end
