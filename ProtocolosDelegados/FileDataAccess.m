//
//  FileDataAccess.m
//  ProtocolosDelegados
//
//  Created by Developer Cymetria on 21/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "FileDataAccess.h"
@interface FileDataAccess()

@property long long expectedLength;
@property NSMutableData * fileData;
@property NSString * fileName;
@end
@implementation FileDataAccess
float progress = 0.0f;
//Metodos del NSURLConnectionDataDelegate
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    progress = 0;
    _expectedLength = [response expectedContentLength];
    [self.delegate downloadInitLoading:connection didReceiveResponse:response];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    progress += [data length];
    [_fileData appendData:data];
    
    [self.delegate downloadChangeLoading:connection didReceiveData:data andProgress:(progress/(float)_expectedLength)];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [self.delegate downloadFinishLoading:connection didFailWithError:error andName:_fileName];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [self.delegate downloadFinishLoading:_fileName];
    
    //Metodo para guardar en Documents
    [self saveDocuments:_fileData andName:_fileName];
}
//Metodos Propios de la Clase FileDataAccess
-(void)saveDocuments:(NSData*)imageData andName:(NSString*)name{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * folderPath = [[paths lastObject] stringByAppendingPathComponent:@"/imagenes"];
    BOOL isDir = NO;
    NSFileManager * file = [[NSFileManager alloc] init];
    if (![file fileExistsAtPath:folderPath isDirectory:&isDir] && isDir == NO) {
        [file createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSString * imagePath = [folderPath stringByAppendingPathComponent:name];
    NSError * error = nil;
    
    [imageData writeToFile:imagePath options:NSDataWritingAtomic error:&error];
    
    if (error) {
        NSLog(@"Error en crear archivo: %@", error);
    }else{
        [self.delegate downloadFinishLoading:imagePath andName:_fileName];
    }
}

//Metodos declaros en el .h
-(void) downloadFile:(NSString*)url andName:(NSString*)name{
    _fileName=name;
    _fileData = [[NSMutableData alloc] init];
    NSURL * urlData = [NSURL URLWithString:url];
    NSURLRequest * request = [NSURLRequest requestWithURL:urlData];
    
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];

}
+(NSString *)deleteFile:(NSString*)name{
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * folderPath = [[paths lastObject] stringByAppendingPathComponent:@"/imagenes"];
    
    NSString * pathDelete = [folderPath stringByAppendingPathComponent:name];
    NSFileManager * fn = [[NSFileManager alloc] init];
    
    NSError * error = nil;
    [fn removeItemAtPath:pathDelete error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        return [NSString stringWithFormat:@"Error!!!"];
    }
    else{
        return [NSString stringWithFormat:@"Borrado exitoso!!!"];
    
    }
    

}

@end









