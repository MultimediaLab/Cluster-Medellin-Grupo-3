//
//  Vendedores.m
//  Vendedores
//
//  Created by Profesor on 2/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.

#import "Vendedores.h"

@interface Vendedores ()
{

    NSInteger sell_id;
    const char * dbpath;
}

@end

@implementation Vendedores
-(void) createDatabaseforSellers{
    
    [self findDatabasePath];
    NSFileManager * fm = [[NSFileManager alloc] init];
    
    if ([fm fileExistsAtPath:_databasePath]==NO) {
        if (sqlite3_open(dbpath, &vendedoresdb)==SQLITE_OK) {
            NSLog(@"Base de datos Creada con Exito");
            char * errMsg;
            const char * sql_stmt = "CREATE TABLE IF NOT EXISTS SELLERS (ID INTEGER PRIMARY KEY AUTOINCREMENT, SELLER_NAME TEXT, SELLER_CEDULA TEXT,SELLER_CLAVE TEXT, SELLER_AGE TEXT, SELLER_ADRESS TEXT)";
            if (sqlite3_exec(vendedoresdb, sql_stmt, NULL, NULL, &errMsg)==SQLITE_OK) {
                NSLog(@"Tabla Creada con exito!!");
            }else{
                NSLog(@"Error: %s", errMsg);
            }
            sqlite3_close(vendedoresdb);
        }else{
            NSLog(@"La base de datos no se pudo crear");
        }
    }else{
        NSLog(@"El archivo ya existe");
    }
}

-(void) findDatabasePath{
    NSString * docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    _databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"sellers.db"]];
    dbpath = [_databasePath UTF8String];
    NSLog(@"%s", dbpath);
}
-(void)saveSellerInDatabase{
   
    [self findDatabasePath];
    sqlite3_stmt * statement;
    if (sqlite3_open(dbpath, &vendedoresdb)==SQLITE_OK) {
        NSString * insertSQL = [NSString stringWithFormat:@"INSERT INTO SELLERS (SELLER_NAME, SELLER_CEDULA, SELLER_CLAVE, SELLER_AGE, SELLER_ADRESS) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", _sellerName, _sellerCedula, _sellerClave,_sellerAge, _sellerAdress];
        const char * insert_sql = [insertSQL UTF8String];
        sqlite3_prepare_v2(vendedoresdb, insert_sql, -1, &statement, NULL);
        if (sqlite3_step(statement)==SQLITE_DONE) {
            _status = @"Registro Almacenado con exito";
        }
        else{
            _status = @"Fallo al almacenar el registro";
        }
        sqlite3_finalize(statement);
        sqlite3_close(vendedoresdb);
    }else{
        _status = @"Fallo al acceder a la base de datos";
    }
}
-(void) searchSellerInDatabase{
    [self findDatabasePath];
    sqlite3_stmt * query;
    if (sqlite3_open(dbpath, &vendedoresdb)==SQLITE_OK) {
        NSString * select = [NSString stringWithFormat:@"SELECT * FROM SELLERS WHERE SELLER_CEDULA = \"%@\"", _sellerCedula];
        const char * select_sql = [select UTF8String];
        if (sqlite3_prepare_v2(vendedoresdb, select_sql, -1, &query, NULL)==SQLITE_OK) {
            if (sqlite3_step(query)==SQLITE_ROW) {
                _status = @"Registro Encontrado";
                _sellerID = [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 0)];
                _sellerName = [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 1)];
                _sellerCedula = [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 2)];
                
                _sellerClave = [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 3)];
                _sellerAge = [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 4)];
                _sellerAdress = [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 5)];
            }else{
                _status = @"Registro no encontrado";
            }
            sqlite3_finalize(query);
        }else{
            _status = @"Error en crear Query";
        }
        sqlite3_close(vendedoresdb);
    }else{
        _status = @"Fallo al acceder a la base de datos";
    }
}
@end
