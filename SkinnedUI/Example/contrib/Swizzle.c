//
//  Swizzle.c
//  youpinapp2-ios
//
//  Created by QFish on 5/9/12.
//  Copyright (c) 2012 QFish.Me. All rights reserved.
//

#include "Swizzle.h"


void 
Swizzle(Class c, SEL origSEL, SEL newSEL)
{
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method newMethod = class_getInstanceMethod(c, newSEL);
    
    if(class_addMethod(c, origSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(c, newSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    else
        method_exchangeImplementations(origMethod, newMethod);    
}
