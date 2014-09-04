//
//  ConsultarViewController.m
//  Vendedores
//
//  Created by Profesor on 4/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ConsultarViewController.h"
#import "Vendedores.h"

@interface ConsultarViewController ()
{
    Vendedores * vendedorBuscar;
}

@end

@implementation ConsultarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    vendedorBuscar = [[Vendedores alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buscarVendedor:(id)sender {
    vendedorBuscar.sellerCedula = _cedulaBuscar.text;
    [vendedorBuscar searchSellerInDatabase];
    
    _sellerNoTxt.text = vendedorBuscar.sellerID;
    _sellerNameTxt.text = vendedorBuscar.sellerName;
    _sellerAgeTxt.text = vendedorBuscar.sellerAge;
    _sellerAddressTxt.text = vendedorBuscar.sellerAdress;
    _sellerPassTxt.text = vendedorBuscar.sellerClave;
    _sellerCedulaTxt.text = vendedorBuscar.sellerCedula;
    
    _sellerStatus.text = vendedorBuscar.status;
    
    [self.view endEditing:YES];
}
@end
