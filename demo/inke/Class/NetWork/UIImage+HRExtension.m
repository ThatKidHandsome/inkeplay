//
//  UIImage+HRExtension.m
//  inke
//
//  Created by 众力金融 on 16/11/10.
//  Copyright © 2016年 众力金融. All rights reserved.
//

#import "UIImage+HRExtension.h"

@implementation UIImage (HRExtension)

- (UIImage *)circleImage
{
   /***************************/
    
    //得到size跟image开始绘制
    int w = self.size.width;
    int h = self.size.height;
    int radius = self.size.width/2;
    
    UIImage *img = self;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, radius, radius);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    img = [UIImage imageWithCGImage:imageMasked];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageMasked);
    return img;
    
    /***********/
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    //    UIGraphicsBeginImageContext(self.bounds.size);
    
//    
//    UIGraphicsBeginImageContextWithOptions(self.size, false, [UIScreen mainScreen].scale);
//    // Add a clip before drawing anything, in the shape of an rounded rect
//     CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
//    [[UIBezierPath bezierPathWithRoundedRect:rect
//                                cornerRadius:self.size.height/2] addClip];
//    // Draw your image
//    [self drawInRect:rect];
//    
//    // Get the image, here setting the UIImageView image
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    // Lets forget about that we were drawing
//    UIGraphicsEndImageContext();
//    return image;

    
}
static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw, fh;
    
    if (ovalWidth == 0 || ovalHeight == 0)
    {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}


@end
