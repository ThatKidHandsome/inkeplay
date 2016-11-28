//
//  HttpTool.h
//  inke
//
//  Created by 众力金融 on 16/11/2.
//  Copyright © 2016年 众力金融. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HttpScusseedBlock)(id json);
typedef void (^HttpErrorBlock)(NSError *error);
typedef void (^httpDownloadProgressBlock)(CGFloat progress);
typedef void (^httpUploadProgressBlock)(CGFloat progress);

@interface HttpTool : NSObject


/**
  get网络请求

 @param path    url地址
 @param params  url参数 NSDictionary字典类型
 @param succees 请求成功 返回NSDictionary或NSArray
 @param failure 请求失败 返回NSError
 */
+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpScusseedBlock)succees failure:(HttpErrorBlock)failure;


/**
  post网络请求
 
 @param path    url地址
 @param params  url参数 NSDictionary字典类型
 @param succees 请求成功 返回NSDictionary或NSArray
 @param failure 请求失败 返回NSError
 */
+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpScusseedBlock)succees failure:(HttpErrorBlock)failure;


/**
 下载文件

 @param path     url路径
 @param success  下载成功
 @param failure  下载失败
 @param progress 下载进度
 */
+ (void)downLoadWithPath:(NSString *)path succees:(HttpErrorBlock)success failure:(HttpErrorBlock)failure progress:(httpDownloadProgressBlock)progress;


/**
 上传图片

 @param path     url地址
 @param params   上传参数
 @param imagekey imagekey
 @param image    UIImage对象
 @param success  上传成功
 @param failure  上传失败
 @param progress 上传进度
 */
+ (void)uploadImageWithPath:(NSString *)path params:(NSDictionary *)params thumbName:(NSString *)imagekey image:(UIImage *)image success:(HttpScusseedBlock)success failure:(HttpErrorBlock)failure progress:(httpDownloadProgressBlock)progress;
@end
