//
//  ViewController.m
//  13. Anotaciones & Distancias
//
//  Created by Profesor on 6/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) MKPolyline * linea;

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
    
    //Distacia entre Bogota y Medellin
    CLLocation * punto1 = [[CLLocation alloc] initWithLatitude:bgt.latitude longitude:bgt.longitude];
    CLLocation * punto2 = [[CLLocation alloc] initWithLatitude: 6.235925 longitude:-75.57513];
    CLLocationDistance distance = [punto1 distanceFromLocation:punto2];
    NSLog(@"Distancia en kilometros de Bogota a Medellin: %.f Km", distance/1000);
    
    //Linea entre Bogota y Medellin
    MKMapPoint * pointsArray = malloc(sizeof(CLLocationCoordinate2D)*2);
    pointsArray[0]= MKMapPointForCoordinate(bgt);
    pointsArray[1]= MKMapPointForCoordinate(CLLocationCoordinate2DMake(6.235925, -75.57513));
    _linea = [MKPolyline polylineWithPoints:pointsArray count:2];
    [_mapView addOverlay:_linea];
    
}
// iOS > 7
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKPolyline * ruta = overlay;
    MKPolylineRenderer * rutaRender = [[MKPolylineRenderer alloc] initWithPolyline:ruta];
    rutaRender.strokeColor = [UIColor redColor];
    return rutaRender;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    MKCoordinateRegion region;
    region.center.latitude=4.60971;
    region.center.longitude=-74.08175;
    region.span.latitudeDelta = 5;
    region.span.longitudeDelta = 5;
    [_mapView setRegion:region];

}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    IconAnnotationView * icon = [[[NSBundle mainBundle] loadNibNamed:@"IconView" owner:self options:nil] objectAtIndex:0];
    icon.centerOffset = CGPointMake(icon.frame.size.width/2, -icon.frame.size.height/2);
    return icon;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
