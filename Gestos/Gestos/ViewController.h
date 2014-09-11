//
//  ViewController.h
//  Gestos
//
//  Created by Profesor on 11/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *mico;

@property AVAudioPlayer * jeje;
@property AVAudioPlayer * mordisco;

@end

