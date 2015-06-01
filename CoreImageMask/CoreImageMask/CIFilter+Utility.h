//
//  CIFilter+Utility.h
//  CoreImageMask
//
//  Created by YouXianMing on 15/5/29.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <CoreImage/CoreImage.h>
#import <UIKit/UIKit.h>

@interface CIFilter (Utility)

// InputImage
- (void)setInputImage:(CIImage *)image;
- (CIImage *)inputImage;

// InputScale
- (void)setInputScale:(NSNumber *)scale;
- (NSNumber *)inputScale;


- (UIImage *)outputUIImage;

@end
