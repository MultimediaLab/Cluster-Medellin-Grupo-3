//
//  AdicionarViewController.h
//  Vendedores
//
//  Created by Profesor on 2/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vendedores.h"
#import "ViewController.h"

@interface AdicionarViewController : UIViewController <UITextFieldDelegate >
{
    Vendedores * newVendedor;
}
@property (strong, nonatomic) IBOutlet UITextField *empCedulaTxt;
@property (strong, nonatomic) IBOutlet UITextField *empClaveTxt;
@property (strong, nonatomic) IBOutlet UITextField *empNombreTxt;
@property (strong, nonatomic) IBOutlet UITextField *empEdadTxt;
@property (strong, nonatomic) IBOutlet UITextField *empDireccionTxt;
@property (strong, nonatomic) IBOutlet UILabel *statusTxt;
- (IBAction)saveData:(id)sender;

@end
