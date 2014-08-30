//
//  Temperature.h
//  ConvertidorTemperatura
//
//  Created by Developer Cymetria on 16/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Temperature : NSObject
{
    float celsius;
    float farenheit;
    float kelvin;
}

//Celsius to Farenheit
-(NSString*)convertCtoF:(float)value;
-(NSString*)convertFtoC:(float)value;

//Celsius to Kelvin
-(NSString*)convertCtoK:(float)value;
-(NSString*)convertKtoC:(float)value;

//Kelvin to Farenheit
-(NSString*)convertKtoF:(float)value;
-(NSString*)convertFtoK:(float)value;

@end
