//
//  MiPunto.h
//  Mapas
//
//  Created by Profesor on 6/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MiPunto : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString * title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coor andTitle:(NSString*)titulo;


@end
