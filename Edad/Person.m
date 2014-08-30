//
//  Person.m
//  Edad
//
//  Created by Developer Cymetria on 14/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)setAge:(int)value{
    age=value;
}
-(int)age{
    return age;
}

-(void)setName: (NSString*)value{
    name=value;
}
-(NSString*)name{
    return name;
}
-(BOOL)isUserAdult{
    if (age>=18) {
        return YES;
    }
    return NO;
}
@end
