

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
    [self.view addSubview:banaView];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
