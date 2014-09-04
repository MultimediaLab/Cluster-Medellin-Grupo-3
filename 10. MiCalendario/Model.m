//
//  Model.m
//  MiCalendario
//
//  Created by Profesor on 30/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "Model.h"
#import "CalendarioViewController.h"

@interface Model()

@property (readonly,strong, nonatomic)NSArray * pagedata;

@end

@implementation Model

-(id) init{
    self = [super init];
    if (self) {
        NSDateFormatter * dateF = [[NSDateFormatter alloc] init];
        _pagedata = [[dateF monthSymbols] copy];
        NSLog(@"%@", _pagedata);
    }
    return self;
}
//Metodos Propios del Model
-(CalendarioViewController*)viewControllerAtIndex: (NSInteger)index storyboard: (UIStoryboard*)storyboard{
    if ((index >= [_pagedata count]) || ([_pagedata count]==0)) {
        return nil;
    }

    CalendarioViewController * calendar = [storyboard instantiateViewControllerWithIdentifier:@"CalendarioViewController"];
    calendar.dataObject = [_pagedata objectAtIndex:index];
    return calendar;
}
-(NSUInteger)indexOfViewController: (CalendarioViewController*) viewController{
    return [_pagedata indexOfObject:viewController.dataObject];
}

//Metodos del Protocolo UIPageViewControllerDataSource

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{

    NSUInteger index = [self indexOfViewController:(CalendarioViewController*)viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];

}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = [self indexOfViewController:(CalendarioViewController*)viewController];
    if (index == [_pagedata count]-1) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];



}
@end
