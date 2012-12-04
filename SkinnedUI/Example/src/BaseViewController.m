//
//  BaseViewController.m
//  SkinnedUI
//
//  Created by QFish on 12/2/12.
//  Copyright (c) 2012 http://QFish.Net All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (assign, nonatomic) BOOL didAppear;

@end

@implementation BaseViewController

- (void)dealloc
{
    // unregister as observer for theme status
    [self unregisterAsObserver];
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {

        self.didAppear = NO;
        
        // register as observer for theme status
        [self regitserAsObserver];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self initViews];
    [self configureViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Theme Methods

#warning                                                      \
You'd better alloc the views, associated with theme changing, \
in 'initViews' first, then set them in 'configureViews'.

- (void)initViews
{
    // may do nothing, implement by the subclass
}

- (void)configureViews
{
    // set the background of navigationbar
    [self.navigationController.navigationBar
     setBackgroundImage:ThemeImage(@"header_bg")
     forBarMetrics:UIBarMetricsDefault];
}

- (void)regitserAsObserver
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(configureViews)
                   name:ThemeDidChangeNotification
                 object:nil];
}

- (void)unregisterAsObserver
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

@end
