//
//  CIFilter+Utility.m
//  CoreImageMask
//
//  Created by YouXianMing on 15/5/29.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "CIFilter+Utility.h"

@implementation CIFilter (Utility)

#pragma mark -
- (void)setInputImage:(CIImage *)image {
    [self setValue:image forKey:kCIInputImageKey];
}

- (CIImage *)inputImage {
    return [self valueForKey:kCIInputImageKey];
}

#pragma mark -
- (void)setInputScale:(NSNumber *)scale {
    [self setValue:scale forKey:kCIInputScaleKey];
}

- (NSNumber *)inputScale {
    return [self valueForKey:kCIInputScaleKey];
}

#pragma mark - 
- (UIImage *)outputUIImage {
    
    CIImage *image = self.inputImage;
    if (image == nil) {
        return nil;
    }
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:self.outputImage
                                       fromRect:image.extent];
    UIImage *retImage  = [[UIImage alloc] initWithCGImage:cgImage];
    CGImageRelease(cgImage);
    
    return retImage;
}

@end
