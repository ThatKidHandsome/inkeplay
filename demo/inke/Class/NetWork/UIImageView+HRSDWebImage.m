//
//  UIImageView+HRSDWebImage.m
//  inke
//
//  Created by 众力金融 on 2016/11/10.
//  Copyright © 2016年 众力金融. All rights reserved.
//

#import "UIImageView+HRSDWebImage.h"
#import "UIImageView+WebCache.h"
#import "UIImage+HRExtension.h"
@implementation UIImageView (HRSDWebImage)

- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName
{
     UIImage *placeholder = [UIImage imageNamed:@"zhibo_head_xiao"];
    
   [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder options:SDWebImageRetryFailed|SDWebImageLowPriority];
}

- (void)setHeader:(NSString *)url
{
    UIImage *placeholder = [[UIImage imageNamed:@"zhibo_head_xiao"] circleImage];
    
  [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image circleImage] : placeholder;
    }];
}

@end
