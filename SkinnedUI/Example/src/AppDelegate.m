//
//  AppDelegate.m
//  SkinnedUI
//
//  Created by QFish on 12/2/12.
//  Copyright (c) 2012 http://QFish.Net All rights reserved.
//

#import "AppDelegate.h"

#import "FisrtViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "SettingViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    MARK;
    // set the customize navigationController background
    if (![UINavigationBar instancesRespondToSelector:
          @selector(setBackgroundImage:forBarMetrics:)]) {
		Swizzle([UINavigationBar class],
				@selector(setBackgroundImage:forBarMetrics:),
				@selector(setCustomizeImage:forBarMetrics:));
	}
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    NSMutableArray *viewContrllers = [NSMutableArray array];
    
    NSArray *viewControllerClasses = [NSArray arrayWithObjects:
                                    [FisrtViewController class],
                                    [SecondViewController class],
                                    [ThirdViewController class],
                                    [SettingViewController class], nil];
    
    for ( Class class in viewControllerClasses )
    {
        // make sure that the class is subclass of UIViewController
        if (![class isSubclassOfClass:[UIViewController class]])
            continue;
        
        // setup the controller with NavigationController
        id vc = [[class alloc] init];
        UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:vc];
        [viewContrllers addObject:navc];

        [vc release]; vc = nil;
        [navc release]; navc = nil;
    }
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithArray:viewContrllers];

	[self.window setRootViewController:self.tabBarController];
    [self.window addSubview:self.tabBarController.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}

#if 0

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

#endif

@end
