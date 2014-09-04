//
//  iPaint.m
//  iPintor
//
//  Created by Profesor on 30/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "iPaint.h"
#import "UIColor+Random.h"

@implementation iPaint

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    switch (_colorOption) {
        case kRedOption:
            _currentColor = [UIColor redColor];
            _useRandomColor = NO;
            break;
        case kYellowOption:
            _currentColor = [UIColor yellowColor];
            _useRandomColor = NO;
            break;
        case kBlueOption:
            _currentColor = [UIColor blueColor];
            _useRandomColor = NO;
            break;
        case kGreenOption:
            _currentColor = [UIColor greenColor];
            _useRandomColor = NO;
            break;
        case kRandomOption:
            _useRandomColor = YES;
            break;
    }
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contexto, 1.0f);
    CGContextSetStrokeColorWithColor(contexto, _currentColor.CGColor);
    
    CGContextSetFillColorWithColor(contexto, _currentColor.CGColor);
    
    switch (_shapeType) {
        case kLineShape:
            CGContextMoveToPoint(contexto, _firstTouch.x, _firstTouch.y);
            CGContextAddLineToPoint(contexto, _lastTouch.x, _lastTouch.y);
            CGContextStrokePath(contexto);
            break;
        case kRectShape:
            CGContextAddRect(contexto, self.currentRect);
            CGContextDrawPath(contexto, kCGPathFillStroke);
            break;
        case kEllipseShape:
            CGContextAddEllipseInRect(contexto, self.currentRect);
            CGContextDrawPath(contexto, kCGPathFillStroke);
            break;
        case kImageShape:
        {
            CGFloat horizontalOffset = _drawImage.size.width/2;
            CGFloat verticalOffset = _drawImage.size.height/2;
            CGPoint puntoDibujo = CGPointMake(_lastTouch.x-horizontalOffset, _lastTouch.y-verticalOffset);
            
            [_drawImage drawAtPoint:puntoDibujo];
        }
    }
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _currentColor = [UIColor redColor];
        _drawImage = [UIImage imageNamed:@"apple_icon.png"];
    }
    return self;
}

-(CGRect)currentRect{
    return CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x-_firstTouch.x, _lastTouch.y-_firstTouch.y);

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (_useRandomColor) {
        _currentColor = [UIColor randomColor];
    }
    UITouch * touch = [touches anyObject];
    
    _firstTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    NSLog(@"FirstTouch x:%.f y:%.f", _firstTouch.x, _firstTouch.y);
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    
    [self setNeedsDisplayInRect:_redrawRect];
    NSLog(@"LastTouch Moved x:%.f y:%.f", _lastTouch.x, _lastTouch.y);
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    [self setNeedsDisplayInRect:_redrawRect];
    NSLog(@"LastTouch End x:%.f y:%.f", _lastTouch.x, _lastTouch.y);
}

@end
