//
//  Temperature.m
//  ConvertidorTemperatura
//
//  Created by Developer Cymetria on 16/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "Temperature.h"

@implementation Temperature

-(NSString*)convertCtoF:(float)value{
    farenheit = value*9/5+32;
    return [NSString stringWithFormat:@"%.02f ºF", farenheit];
}
-(NSString*)convertFtoC:(float)value{
    celsius = (value-32)*5/9;
    return [NSString stringWithFormat:@"%.02f ºC", celsius];
}
//Celsius to Kelvin
-(NSString*)convertCtoK:(float)value{
    kelvin = value+273;
    return [NSString stringWithFormat:@"%.02f ºK", kelvin];
}
-(NSString*)convertKtoC:(float)value{
    celsius = value-273;
    return [NSString stringWithFormat:@"%.02f ºC", celsius];
}
//Kelvin to Farenheit
-(NSString*)convertKtoF:(float)value{
    farenheit =(value - 273.15)* 1.8000 + 32.00;
    return [NSString stringWithFormat:@"%.02f ºF", farenheit];
}
-(NSString*)convertFtoK:(float)value{
    kelvin =(value - 32.00)/1.8000 + 273.15;
    return [NSString stringWithFormat:@"%.02f ºK", kelvin];
}

@end
