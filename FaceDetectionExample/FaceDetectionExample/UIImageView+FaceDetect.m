//
//  UIImageView+FaceDetect.m
//  FaceDetectionExample
//
//  Created by YouXianMing on 15/5/29.
//  Copyright (c) 2015年 JID Marketing. All rights reserved.
//

#import "UIImageView+FaceDetect.h"

@implementation UIImageView (FaceDetect)

- (NSArray *)faceRects {
    
    if (self.image == nil) {
        return nil;
    }
    
    // 初始化数组
    NSMutableArray *faceRectsArray = [NSMutableArray array];
    
    // 获取CIImage
    CIImage* image                 = [CIImage imageWithCGImage:self.image.CGImage];
    
    // 创建脸部识别器
    CIDetector* detector           = [CIDetector detectorOfType:CIDetectorTypeFace
                                                        context:nil
                                                        options:[NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh
                                                                                            forKey:CIDetectorAccuracy]];
    
    // 获取侦测到的数据
    NSArray* features              = [detector featuresInImage:image];
    
    
    // CoreImage坐标转换为UIKit坐标
    CGAffineTransform transform    = CGAffineTransformMakeScale(1, -1);
    transform                      = CGAffineTransformTranslate(transform, 0, -self.bounds.size.height);
    
    // 处理
    for(CIFaceFeature* faceFeature in features)
    {
        // 转换坐标系统
        const CGRect faceRect = CGRectApplyAffineTransform(faceFeature.bounds, transform);
        
        // 添加rect
        [faceRectsArray addObject:[NSValue valueWithCGRect:faceRect]];
    }
    
    return faceRectsArray;
}

@end
