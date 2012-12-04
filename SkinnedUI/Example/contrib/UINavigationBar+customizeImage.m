//
//  UINavigationBar+customizeImage.m
//  edaijia
//
//  Created by QFish on 8/14/12.
//
//

#import "UINavigationBar+customizeImage.h"

@implementation UINavigationBar (customizeImage)

- (void)setCustomizeImage:(UIImage *)image
			forBarMetrics:(UIBarMetrics)metrices
{
	UIImageView *imageView = (UIImageView *)[self viewWithTag:8899];
	if (imageView == nil) {
		imageView = [[UIImageView alloc] initWithImage:image];
		[imageView setTag:0xABCDEF];
		[self insertSubview:imageView atIndex:0];
		[imageView release];
	}
}

@end
