//
//  Vendedores.h
//  Vendedores
//
//  Created by Profesor on 2/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Vendedores : NSObject
{
    sqlite3 * vendedoresdb;
}

@property NSString * databasePath;

@property NSString * sellerID;
@property NSString * sellerName;
@property NSString * sellerCedula;
@property NSString * sellerClave;
@property NSString * sellerAge;
@property NSString * sellerAdress;
@property NSString * status;

-(void) findDatabasePath;
-(void) createDatabaseforSellers;
-(void) searchSellerInDatabase;
-(void) saveSellerInDatabase;

@end
