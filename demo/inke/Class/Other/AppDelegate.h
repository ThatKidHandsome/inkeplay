//
//  AppDelegate.h
//  inke
//
//  Created by 众力金融 on 16/11/1.
//  Copyright © 2016年 众力金融. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

