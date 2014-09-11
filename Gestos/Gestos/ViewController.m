

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(AVAudioPlayer*)loadAudio:(NSString*)ruta{
    NSURL * url = [[NSBundle mainBundle] URLForResource:ruta withExtension:@"wav"];
    NSError * error;
    AVAudioPlayer * player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!player) {
        NSLog(@"Error %@", error);
    }else{
        [player prepareToPlay];
    }
    return player;
}


-(void)handleTap: (UITapGestureRecognizer*) sender{
    [_jeje play];
    UIImage * banana = [UIImage imageNamed:@"object_bananabunch.png"];
    UIImageView * banaView = [[UIImageView alloc] initWithImage:banana];
    banaView.center = CGPointMake(100, 100);
    banaView.userInteractionEnabled = YES;
    [banaView addGestureRecognizer:_panGesture];
    [banaView addGestureRecognizer:_pinchGesture];
    [banaView addGestureRecognizer:_rotationGesture];
    [self.view addSubview:banaView];

}
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)sender {
    sender.view.transform = CGAffineTransformScale(sender.view.transform, sender.scale, sender.scale);
    sender.scale = 1;
}
- (IBAction)handleRotation:(UIRotationGestureRecognizer *)sender {
    sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
    sender.rotation = 0;
}
- (IBAction)handlePan:(UIPanGestureRecognizer *)sender {
    CGPoint translacion = [sender translationInView:self.view];
    sender.view.center = CGPointMake(sender.view.center.x + translacion.x, sender.view.center.y + translacion.y);
    [sender setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (sender.view.center.x > _mico.frame.origin.x && sender.view.center.y > _mico.frame.origin.y ) {
        [_mordisco play];
        sender.view.hidden = YES;
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _jeje = [self loadAudio:@"hehehe1"];
    _mordisco = [self loadAudio:@"chomp"];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    [self.view removeGestureRecognizer:_pinchGesture];
    [self.view removeGestureRecognizer:_rotationGesture];
    [self.view removeGestureRecognizer:_panGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
