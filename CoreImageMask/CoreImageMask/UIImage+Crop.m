//
//  UIImage+Crop.m
//  CoreImageMask
//
//  Created by YouXianMing on 15/5/29.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)

- (UIImage *)cropAtRect:(CGRect)rect {
    
    if (self == nil) {
        return nil;
    }
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image      = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return image;
}

@end
