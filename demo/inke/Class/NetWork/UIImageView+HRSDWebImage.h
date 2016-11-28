//
//  UIImageView+HRSDWebImage.h
//  inke
//
//  Created by 众力金融 on 2016/11/10.
//  Copyright © 2016年 众力金融. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HRSDWebImage)
/**
 异步加载

 @param url       图片的URl
 @param imageName 默认的图
 */
- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName;


/**
 设置图片圆角

 @param url       图片的URl
 */
- (void)setHeader:(NSString *)url;
@end
