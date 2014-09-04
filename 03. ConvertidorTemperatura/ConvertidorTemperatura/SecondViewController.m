//
//  SecondViewController.m
//  ConvertidorTemperatura
//
//  Created by Developer Cymetria on 16/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    temp = [[Temperature alloc] init];
}
- (IBAction)convertCtoFButton:(id)sender {
    _userResult.text= [temp convertCtoF:[_userValue.text floatValue]];
    [self.view endEditing:YES];
}

- (IBAction)convertFtoCButton:(id)sender {
    _userResult.text= [temp convertFtoC:[_userValue.text floatValue]];
    [self.view endEditing:YES];
    
}
@end
