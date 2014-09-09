//
//  ViewController.m
//  Direcciones y Rutas
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
    _activityIndicator.hidden= YES;
    _mapView.delegate = self;
    [_mapView setShowsUserLocation:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handeRoute:(id)sender {
    _activityIndicator.hidden = NO;
    _routeButton.enabled=NO;
    [_activityIndicator startAnimating];
    
    //Crear una solicitud de direcciones
    MKDirectionsRequest * directionRequest = [MKDirectionsRequest new];
    
    //Punto Inicial - Posicion Actual
    MKMapItem * source = [MKMapItem mapItemForCurrentLocation];
    [directionRequest setSource:source];
    
    //Punto Final o Destino - USA - CASA BLANCA
    CLLocationCoordinate2D casaBlanca = CLLocationCoordinate2DMake(38.8977, -77.0365);
    MKPlacemark * casaPlace = [[MKPlacemark alloc] initWithCoordinate:casaBlanca addressDictionary:nil];
    MKMapItem * destination = [[MKMapItem alloc] initWithPlacemark:casaPlace];
    [directionRequest setDestination:destination];
    
    MKDirections * directions = [[MKDirections alloc] initWithRequest:directionRequest];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        [_activityIndicator stopAnimating];
        _activityIndicator.hidden=YES;
        _routeButton.enabled = YES;
        
        if (error) {
            NSLog(@"Error: %@", error.description);
            return ;
        }
        
        currentRoute = [response.routes firstObject];
        [self pintarRutaMapa:currentRoute];
    }];
}
-(void)pintarRutaMapa: (MKRoute*)ruta{
    if (linea) {
        [_mapView removeOverlay:linea];
    }
    
    linea = ruta.polyline;
    [_mapView addOverlay:linea];
}
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKPolylineRenderer * lineaRender = [[MKPolylineRenderer alloc] initWithPolyline: overlay];
    lineaRender.strokeColor = [UIColor blueColor];
    lineaRender.lineWidth = 3;
    return lineaRender;

}

@end
