//
//  ThirdViewController.m
//  ConvertidorTemperatura
//
//  Created by Developer Cymetria on 16/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    temp = [[Temperature alloc] init];
}
- (IBAction)convertCtoKButton:(id)sender {
    _userResult.text= [temp convertCtoK:[_userValue.text floatValue]];
    [self.view endEditing:YES];
}

- (IBAction)convertKtoCButton:(id)sender {
    _userResult.text= [temp convertKtoC:[_userValue.text floatValue]];
    [self.view endEditing:YES];
    
}

@end
