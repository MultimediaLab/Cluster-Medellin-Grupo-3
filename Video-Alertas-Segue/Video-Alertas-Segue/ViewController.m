//
//  ViewController.m
//  Video-Alertas-Segue
//
//  Created by Developer Cymetria on 23/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MenuViewController * segunda = [segue destinationViewController];
    segunda.userNewName = _userField.text;
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([_userField.text isEqual:@"pepe"]) {
        return YES;
    }
    return NO;
}


@end
