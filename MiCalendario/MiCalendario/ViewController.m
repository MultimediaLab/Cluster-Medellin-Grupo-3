//
//  ViewController.m
//  MiCalendario
//
//  Created by Profesor on 30/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "CalendarioViewController.h"

@interface ViewController ()
@property Model * model;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _model = [[Model alloc] init];
	
    _page = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _page.delegate = self;
    _page.dataSource = _model;
    
    CalendarioViewController * startVC = [_model viewControllerAtIndex:0 storyboard:self.storyboard];
    
    NSArray * arrayVCs = [NSArray arrayWithObject:startVC];
   
    [_page setViewControllers:arrayVCs direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    [self addChildViewController:_page];
    [self.view addSubview:_page.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
