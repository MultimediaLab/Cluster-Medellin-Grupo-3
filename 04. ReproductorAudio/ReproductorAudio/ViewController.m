//
//  ViewController.m
//  ReproductorAudio
//
//  Created by Developer Cymetria on 16/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer * progressTimer;

}
@end
@implementation ViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    NSError * error;
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"musica" ofType:@"mp3"];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    _reproductor = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    _reproductor.volume = 1;
    _reproductor.pan=0.5;
    _reproductor.rate= 1;
    _reproductor.enableRate= YES;
    _reproductor.numberOfLoops= -1;
    _reproductor.delegate = self;
    [_reproductor prepareToPlay];
}
-(NSString*)timeConverter:(float)parameter{
    int hours = parameter / 3600;
    int minutes = (int)(parameter/60) % 60;
    int seconds = (int)parameter % 60;
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}
-(void)updateBarrayTiempo{
    _labelTime.text = [NSString stringWithFormat:@"%@", [self timeConverter:_reproductor.currentTime]];
    
    _progressBar.progress = _reproductor.currentTime/_reproductor.duration;
}
- (IBAction)play:(id)sender {
    [_reproductor play];
    progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateBarrayTiempo) userInfo:nil repeats:YES];
}
- (IBAction)stop:(id)sender {
    [_reproductor stop];
    _reproductor.currentTime = 0;
    [progressTimer invalidate];
    _progressBar.progress= 0;
}

- (IBAction)pause:(id)sender {
    [_reproductor pause];
}

- (IBAction)changeVolume:(id)sender {
    UISlider * control = sender;
    _reproductor.volume = control.value;
}
- (IBAction)changeSpeed:(id)sender {
    _reproductor.rate = ((UISlider *) sender).value;
}

- (IBAction)changeOptions:(id)sender {
    UISwitch * control = sender;
    if (control.on) {
        _optionsContainer.hidden = NO;
    }else{
        _optionsContainer.hidden= YES;
    }
}

@end
