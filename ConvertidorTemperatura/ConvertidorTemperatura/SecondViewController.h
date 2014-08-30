//
//  SecondViewController.h
//  ConvertidorTemperatura
//
//  Created by Developer Cymetria on 16/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Temperature.h"

@interface SecondViewController : UIViewController
{
    Temperature * temp;
}

@property (strong, nonatomic) IBOutlet UITextField *userValue;
@property (strong, nonatomic) IBOutlet UILabel *userResult;

- (IBAction)convertCtoFButton:(id)sender;
- (IBAction)convertFtoCButton:(id)sender;

@end
