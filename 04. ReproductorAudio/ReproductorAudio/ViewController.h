//
//  ViewController.h
//  ReproductorAudio
//
//  Created by Developer Cymetria on 16/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController <AVAudioPlayerDelegate>

- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)pause:(id)sender;

- (IBAction)changeVolume:(id)sender;
- (IBAction)changeSpeed:(id)sender;
//////////////
- (IBAction)changeOptions:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *optionsContainer;
/////////////
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) IBOutlet UILabel *labelTime;

@property (strong, nonatomic) AVAudioPlayer * reproductor;

@end
