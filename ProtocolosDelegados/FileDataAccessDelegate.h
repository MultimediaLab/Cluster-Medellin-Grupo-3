//
//  FileDataAccessDelegate.h
//  ProtocolosDelegados
//
//  Created by Developer Cymetria on 21/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FileDataAccessDelegate <NSObject>


@required
//Metodo cuando crear el archivo de descarga. Parametros: ruta y nombre del archivo
-(void)downloadFinishLoading:(NSString*)filepath andName:(NSString*)name;

//Metodo cuando finaliza la descarga en memoria
-(void)downloadFinishLoading:(NSString*)name;

//Metodo que inicia la descarga
-(void)downloadInitLoading:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response;


@optional

//Metodo cuando encuentra error en la conexion.
-(void)downloadFinishLoading:(NSURLConnection*)connection didFailWithError:(NSError*)error andName:(NSString*)name;

//Metodo cuando esta descargando en memoria
-(void)downloadChangeLoading:(NSURLConnection*)connection didReceiveData:(NSData*)data andProgress:(float)progress;

@end
