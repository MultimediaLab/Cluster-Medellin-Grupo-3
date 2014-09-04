//
//  AdicionarViewController.m
//  Vendedores
//
//  Created by Profesor on 2/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "AdicionarViewController.h"

@interface AdicionarViewController ()

@end

@implementation AdicionarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    newVendedor = [[Vendedores alloc] init];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UIView * view in self.view.subviews) {
        [view resignFirstResponder];
    }
}

- (IBAction)saveData:(id)sender {
    newVendedor.sellerName = _empNombreTxt.text;
    newVendedor.sellerCedula = _empCedulaTxt.text;
    newVendedor.sellerClave = _empClaveTxt.text;
    newVendedor.sellerAge = _empEdadTxt.text;
    newVendedor.sellerAdress = _empDireccionTxt.text;
    
    [newVendedor saveSellerInDatabase];
    
    _statusTxt.text = newVendedor.status;
}
@end
