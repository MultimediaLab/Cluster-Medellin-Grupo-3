//
//  FourthViewController.m
//  ConvertidorTemperatura
//
//  Created by Developer Cymetria on 16/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    temp = [[Temperature alloc] init];
}
- (IBAction)convertKtoFButton:(id)sender {
    _userResult.text= [temp convertKtoF:[_userValue.text floatValue]];
    [self.view endEditing:YES];
}

- (IBAction)convertFtoKButton:(id)sender {
    _userResult.text= [temp convertFtoK:[_userValue.text floatValue]];
    [self.view endEditing:YES];
    
}

@end
