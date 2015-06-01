//
//  ViewController.m
//  CoreImageMask
//
//  Created by YouXianMing on 15/5/29.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+FaceDetect.h"
#import "CIFilter+Utility.h"
#import "UIImage+Crop.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"demo.png"];
    
    
    // 加载ImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center       = self.view.center;
    [self.view addSubview:imageView];
    
    
    NSArray *faceRectArray = [imageView faceRects];
    for (int i = 0; i < faceRectArray.count; i++) {
    
        // 获取脸部的rect
        NSValue *value  = faceRectArray[i];
        CGRect faceRect = value.CGRectValue;
        
        // 截取脸部的图片
        UIImage *faceImage = [image cropAtRect:faceRect];
        
        
        // 添加脸部的图片
        UIImageView *faceImageView = [[UIImageView alloc] initWithImage:[self CIPixellateImage:faceImage]];
        faceImageView.frame        = faceRect;
        [imageView addSubview:faceImageView];
    }
}

- (UIImage *)CIPixellateImage:(UIImage *)image {
    
    CIImage *ciImage  = [[CIImage alloc] initWithImage:image];
    CIFilter *filter  = [CIFilter filterWithName:@"CIPixellate"];
    filter.inputImage = ciImage;
    filter.inputScale = @(5.f);
    
    return [filter outputUIImage];
}


@end
