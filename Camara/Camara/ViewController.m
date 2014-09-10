//
//  ViewController.m
//  Camara
//
//  Created by Profesor on 9/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Su dispositivo no tiene camara" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles : nil];
        [alerta show];
        _fotoBoton.enabled=NO;
    }
}
- (IBAction)obtenerFoto:(id)sender {
    UIImagePickerController * libreria = [[UIImagePickerController alloc] init];
    libreria.delegate = self;
    libreria.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:libreria animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage * imagenCapturada = info[UIImagePickerControllerOriginalImage];
    _imageView.image = imagenCapturada;
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(imagenCapturada, nil, nil, nil);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)tomatFoto:(id)sender {
    UIImagePickerController * camara = [[UIImagePickerController alloc] init];
    camara.delegate = self;
    camara.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [camara setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    
    [self presentViewController:camara animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
