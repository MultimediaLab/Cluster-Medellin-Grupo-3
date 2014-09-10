//
//  ViewController.m
//  Brujula
//
//  Created by Profesor on 9/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager startUpdatingHeading];
    
}
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    
    float puntoIni = -manager.heading.trueHeading*M_PI/180.0f;
    float puntoFin = -newHeading.trueHeading*M_PI/180.0f;
    
    CABasicAnimation * rotationAnimate;
    
    rotationAnimate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimate.fromValue= [NSNumber numberWithFloat:puntoIni];
    rotationAnimate.toValue = [NSNumber numberWithFloat:puntoFin];
    
    rotationAnimate.duration = 0.5f;
    
    [_compassImage.layer addAnimation:rotationAnimate forKey:@"animacion"];
    _compassImage.transform = CGAffineTransformMakeRotation(puntoFin);

    
    
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
