//
//  ViewController.h
//  Edad
//
//  Created by Developer Cymetria on 14/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *userNameText;
@property (strong, nonatomic) IBOutlet UITextField * userAgeText;
@property (strong, nonatomic) IBOutlet UILabel *responseUser;

- (IBAction)validateUserAge:(id)sender;

@end
