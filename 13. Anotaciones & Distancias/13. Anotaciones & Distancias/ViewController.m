//
//  ViewController.m
//  13. Anotaciones & Distancias
//
//  Created by Profesor on 6/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_mapView.delegate = self;
    
    //Bogota
    CLLocationCoordinate2D bgt;
    bgt.latitude = 4.60971;
    bgt.longitude = -74.08175;
    MiPunto * bgtPoint = [[MiPunto alloc] initWithCoordinate:bgt andTitle:@"Bogotá"];
    
    //Medellin
    MiPunto * mdePoint = [[MiPunto alloc] init];
    
    //Manizales
    MiPunto * mzePoint = [[MiPunto alloc] initWithCoordinate:CLLocationCoordinate2DMake(5.07, -75.52056) andTitle:@"Manizales"];
    
    
    [_mapView addAnnotations:[NSArray arrayWithObjects:bgtPoint, mdePoint, mzePoint, nil]];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
