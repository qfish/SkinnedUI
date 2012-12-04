//
//  UINavigationBar+DropShadow.m
//  
//
//  Created by QFish on 8/22/12.
//
//

// http://www.travisboudreaux.com/adding-a-drop-shadow-to-a-uinavigationbar

#import "UINavigationBar+DropShadow.h"

@implementation UINavigationBar (DropShadow)

-(void)willMoveToWindow:(UIWindow *)newWindow{
	[super willMoveToWindow:newWindow];
	[self dropShadow];
}

- (void)dropShadow {
	// add the drop shadow
	self.layer.shadowColor = [[UIColor blackColor] CGColor];
	self.layer.shadowOffset = CGSizeMake(0.0, 3.0);
	self.layer.shadowOpacity = 0.25;
}


@end
