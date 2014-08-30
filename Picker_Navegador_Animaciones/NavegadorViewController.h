//
//  NavegadorViewController.h
//  Picker_Navegador_Animaciones
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavegadorViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *navegador;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *cargando;

- (IBAction)htmlButton:(id)sender;
- (IBAction)jsButton:(id)sender;
- (IBAction)webButton:(id)sender;
- (IBAction)pdfButton:(id)sender;
@end
