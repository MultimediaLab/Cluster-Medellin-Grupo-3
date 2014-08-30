//
//  ViewController.m
//  ProtocolosDelegados
//
//  Created by Developer Cymetria on 21/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _responseUser.hidden= YES;
    
}
-(void)downloadInitLoading:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _responseUser.hidden= NO;
    _responseUser.text=@"Inicio Descarga";
}
-(void)downloadFinishLoading:(NSString *)filepath andName:(NSString *)name{
    _responseUser.hidden= YES;
    NSData * infoImage = [NSData dataWithContentsOfFile:filepath];
    _imageUser.image = [UIImage imageWithData:infoImage];
}


-(void)downloadFinishLoading:(NSString *)name{
    _responseUser.hidden= NO;
    _responseUser.text=@"Termino Descarga en Memoria";
}
-(void)downloadChangeLoading:(NSURLConnection *)connection didReceiveData:(NSData *)data andProgress:(float)progress{
    _responseUser.hidden= NO;
    _responseUser.text=@"Descargando...";
    _progressUser.progress = progress;
    NSLog(@"%f", progress*100);
}
-(void)downloadFinishLoading:(NSURLConnection *)connection didFailWithError:(NSError *)error andName:(NSString *)name{
    NSLog(@"%@",error);}


- (IBAction)downloadButton:(id)sender {
    FileDataAccess * file = [[FileDataAccess alloc] init];
    [file downloadFile:_userURL.text andName:_userName.text];

    file.delegate= self;
    [self.view endEditing:YES];
    
}

- (IBAction)deleteButton:(id)sender {
    _imageUser.image=nil;
    _responseUser.hidden= NO;
    _responseUser.text=[FileDataAccess deleteFile:_userName.text];

}
@end
