//
//  UIColor+Random.m
//  iPintor
//
//  Created by Profesor on 30/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)

+(UIColor *) randomColor{
    CGFloat red = (arc4random() % 255)/ 255.0f;
    CGFloat green = (arc4random() % 255)/ 255.0f;
    CGFloat blue = (arc4random() % 255)/ 255.0f;
    CGFloat alpha = 1.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
@end
