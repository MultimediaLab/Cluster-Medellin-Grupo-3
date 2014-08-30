//
//  FileDataAccess.h
//  ProtocolosDelegados
//
//  Created by Developer Cymetria on 21/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileDataAccessDelegate.h"

@interface FileDataAccess : NSObject <NSURLConnectionDataDelegate>

@property id <FileDataAccessDelegate> delegate;

-(void) downloadFile:(NSString*)url andName:(NSString*)name;
+(NSString *)deleteFile:(NSString*)name;

@end
