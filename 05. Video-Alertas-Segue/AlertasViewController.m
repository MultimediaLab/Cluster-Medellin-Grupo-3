//
//  AlertasViewController.m
//  Video-Alertas-Segue
//
//  Created by Developer Cymetria on 23/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "AlertasViewController.h"

@interface AlertasViewController ()

@end

@implementation AlertasViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)alertaSimple:(id)sender {
    alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Este es un mensaje de error" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles: @"Aceptar", @"Omitir", nil];
    alerta.tag = 1;
    [alerta show];
}

- (IBAction)alertaCampos:(id)sender {
    alerta = [[UIAlertView alloc] initWithTitle:@"Ingreso" message:@"Ingrese su usuario y contraseña" delegate:self cancelButtonTitle:@"Cerrar" otherButtonTitles: @"Ingresar", nil];
    alerta.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    alerta.tag = 2;
    [alerta show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
        switch (buttonIndex) {
            case 0:
                NSLog(@"Touch en Cancelar");
                break;
            case 1:
                NSLog(@"Touch en Aceptar");
                break;
        }
    }else if(alertView.tag == 2){
        switch (buttonIndex) {
            case 0:
                NSLog(@"Touch en Cerrar");
                break;
            case 1:
                NSLog(@"Nombre %@", [alertView textFieldAtIndex:0].text);
                NSLog(@"Clave %@", [alertView textFieldAtIndex:1].text);
                break;
        }
    }
}

- (IBAction)actionSheetButton:(id)sender {
    UIActionSheet * menu = [[UIActionSheet alloc] initWithTitle:@"Opciones" delegate:self cancelButtonTitle:@"Cerrar" destructiveButtonTitle:@"Eliminar" otherButtonTitles:@"Aceptar", @"Enviar", nil];
    [menu showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

}

- (IBAction)volverButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
