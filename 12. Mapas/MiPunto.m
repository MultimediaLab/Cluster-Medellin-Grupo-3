//
//  MiPunto.m
//  Mapas
//
//  Created by Profesor on 6/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "MiPunto.h"

@implementation MiPunto

-(id)initWithCoordinate:(CLLocationCoordinate2D)coor andTitle:(NSString *)titulo{
    self= [super init];
    if (self) {
        _coordinate = coor;
        _title = titulo;
    }
    return self;
}
-(id)init{
    //Medellin: Latitud: 6.235925 Longitud: -75.57513
    
    return [self initWithCoordinate:CLLocationCoordinate2DMake(6.235925, -75.57513) andTitle:@"Medellin"];

}
@end
