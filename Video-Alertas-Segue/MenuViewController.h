//
//  MenuViewController.h
//  Video-Alertas-Segue
//
//  Created by Developer Cymetria on 23/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *nameUser;

@property NSString * userNewName;

- (IBAction)volverButton:(id)sender;
@end
