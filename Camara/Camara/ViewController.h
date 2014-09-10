//
//  ViewController.h
//  Camara
//
//  Created by Profesor on 9/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *fotoBoton;

- (IBAction)tomatFoto:(id)sender;
- (IBAction)obtenerFoto:(id)sender;
@end
