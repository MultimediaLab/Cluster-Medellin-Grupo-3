//
//  iPaint.h
//  iPintor
//
//  Created by Profesor on 30/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface iPaint : UIView

@property CGPoint firstTouch;
@property CGPoint lastTouch;

@property (nonatomic) CGRect currentRect;
@property CGRect redrawRect;

@property UIColor * currentColor;
@property ShapeType shapeType;
@property ColorOption colorOption;

@property BOOL useRandomColor;
@property UIImage * drawImage;


@end
