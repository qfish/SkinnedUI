//
//  ThemeManager.m
//  SkinnedUI
//
//  Created by QFish on 12/3/12.
//  Copyright (c) 2012 QFish.Net. All rights reserved.
//

#import "ThemeManager.h"

NSString * const ThemeDidChangeNotification = @"me.ilvu.theme.change";

@implementation ThemeManager

@synthesize theme = _theme;

+ (ThemeManager *)sharedInstance
{
    static dispatch_once_t once;
    static ThemeManager *instance = nil;
    dispatch_once( &once, ^{ instance = [[ThemeManager alloc] init]; } );
    return instance;
}

- (void)setTheme:(NSString *)theme
{
    if (_theme) {
        [_theme release];
    }
    _theme = [theme copy];

    // post notification to notify the observers that the theme has changed
    ThemeStatus status = ThemeStatusDidChange;

    [[NSNotificationCenter defaultCenter]
     postNotificationName:ThemeDidChangeNotification
     object:[NSNumber numberWithInt:status]];
    
//    [[NSUserDefaults standardUserDefaults] setObject:theme forKey:@"setting.theme"];
}

- (UIImage *)imageWithImageName:(NSString *)imageName
{
    NSString *directory = [NSString stringWithFormat:@"%@/%@", @"resource", [self theme]];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName
                                                          ofType:@"png"
                                                     inDirectory:directory];
    
    return [UIImage imageWithContentsOfFile:imagePath];
}

- (NSString *)theme
{
//    _theme = [[NSUserDefaults standardUserDefaults] objectForKey:@"setting.theme"];
    
    if ( _theme == nil )
    {
        return @"blue";
    }
    return _theme;
}

@end
