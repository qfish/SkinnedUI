//
//  FisrtViewControlle.m
//  SkinnedUI
//
//  Created by QFish on 12/2/12.
//  Copyright (c) 2012 http://QFish.Net All rights reserved.
//

#import "FisrtViewController.h"

@interface FisrtViewController ()
@property (strong, nonatomic) UILabel *label;
@end

@implementation FisrtViewController

- (void)dealloc
{
    [_label release]; _label = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Great Bee~";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:_label];
}

- (void)initViews
{
    [super initViews];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 240, 300)];
    _label.text = @"换肤Demo\n\
    \n1. Setting页面有3个按钮, 点击可更换导航条背景及字体颜色.\n\
    \n2. 声明:所用素材均来自网络,与本人无关~\n\
    \n3. 感谢郭大提供思路~";
    _label.font = [UIFont boldSystemFontOfSize:20];
    _label.numberOfLines = 0;
    _label.backgroundColor = [UIColor clearColor];
    _label.shadowColor = [UIColor whiteColor];
    _label.shadowOffset = CGSizeMake(0, 1);
    _label.textAlignment = UITextAlignmentCenter;
}

- (void)configureViews
{
    [super configureViews];    

    // apply the theme 
    if ( [[ThemeManager sharedInstance] theme] == kThemeBlue )
    {
        _label.textColor = [UIColor blueColor];
    }
    else if( [[ThemeManager sharedInstance] theme] == kThemeRed )
    {
        _label.textColor = [UIColor redColor];
    }
    else if( [[ThemeManager sharedInstance] theme] == kThemeBlack )
    {
        _label.textColor = [UIColor blackColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
