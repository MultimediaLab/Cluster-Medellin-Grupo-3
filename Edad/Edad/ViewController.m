//
//  ViewController.m
//  Edad
//
//  Created by Developer Cymetria on 14/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

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

- (IBAction)validateUserAge:(id)sender {
    
    Person * user = [[Person alloc] init];
    [user setName:@"James Rodriguez"];
    [user setAge:14];
    
    if ([user isUserAdult]) {
        NSLog(@"%@ es adulto y tiene %i años", [user name], [user age]);
    }else{
        NSLog(@"%@ es menor de edad y tiene %i años", [user name], [user age]);
    }
    
    _responseUser.text = [NSString stringWithFormat:@"El usuario es: %@", _userNameText.text];

    NSLog(@"La edad es: %i", [_userAgeText.text intValue]);
}
@end
