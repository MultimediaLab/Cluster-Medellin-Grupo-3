//
//  ViewController.h
//  ProtocolosDelegados
//
//  Created by Developer Cymetria on 21/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileDataAccess.h"

@interface ViewController : UIViewController <FileDataAccessDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userURL;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UIProgressView *progressUser;
@property (strong, nonatomic) IBOutlet UIImageView *imageUser;
@property (strong, nonatomic) IBOutlet UILabel *responseUser;
- (IBAction)downloadButton:(id)sender;
- (IBAction)deleteButton:(id)sender;

@end
