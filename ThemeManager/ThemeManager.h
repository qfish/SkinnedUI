//
//  ThemeManager.h
//  SkinnedUI
//
//  Created by QFish on 12/3/12.
//  Copyright (c) 2012 http://QFish.Net All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef _SYSTEMCONFIGURATION_H
#error  You should include the `SystemConfiguration` framework and \
        add `#import <SystemConfiguration/SystemConfiguration.h>`\
        to the header prefix.
#endif

#ifdef _SYSTEMCONFIGURATION_H
extern NSString * const ThemeDidChangeNotification;
#endif

#define kThemeRed       @"red"
#define kThemeBlue      @"blue"
#define kThemeBlack     @"black"

#define IMAGE(imagePath) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(imagePath) ofType:@"png"]]

#define ThemeImage(imageName) [[ThemeManager sharedInstance] imageWithImageName:(imageName)]

typedef enum {
    ThemeStatusWillChange = 0, // todo
    ThemeStatusDidChange,
} ThemeStatus;

@interface ThemeManager : NSObject

@property (strong, nonatomic) NSString *theme;

+ (ThemeManager *)sharedInstance;

- (UIImage *)imageWithImageName:(NSString *)imageName;

@end
