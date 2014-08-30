//
//  ViewController.m
//  iPintor
//
//  Created by Profesor on 30/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeColor:(id)sender {
    [(iPaint *)self.view setColorOption:[sender selectedSegmentIndex]];
}

- (IBAction)changeShape:(id)sender {
    [(iPaint *)self.view setShapeType:[sender selectedSegmentIndex]];
}
@end
