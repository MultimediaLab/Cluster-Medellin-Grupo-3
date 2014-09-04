//
//  ConsultarViewController.h
//  Vendedores
//
//  Created by Profesor on 4/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultarViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *cedulaBuscar;

- (IBAction)buscarVendedor:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *sellerNoTxt;
@property (strong, nonatomic) IBOutlet UILabel *sellerNameTxt;
@property (strong, nonatomic) IBOutlet UILabel *sellerCedulaTxt;
@property (strong, nonatomic) IBOutlet UILabel *sellerAgeTxt;
@property (strong, nonatomic) IBOutlet UILabel *sellerAddressTxt;
@property (strong, nonatomic) IBOutlet UILabel *sellerPassTxt;

@property (strong, nonatomic) IBOutlet UILabel *sellerStatus;
@end
