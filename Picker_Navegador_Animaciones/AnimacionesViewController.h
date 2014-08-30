//
//  AnimacionesViewController.h
//  Picker_Navegador_Animaciones
//
//  Created by Profesor on 30/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimacionesViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;

- (IBAction)animacionSimple:(id)sender;
- (IBAction)animacionCallback:(id)sender;
- (IBAction)animacionOpciones:(id)sender;

@end
