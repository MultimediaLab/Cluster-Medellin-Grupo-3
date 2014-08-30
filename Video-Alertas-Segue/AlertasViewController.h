//
//  AlertasViewController.h
//  Video-Alertas-Segue
//
//  Created by Developer Cymetria on 23/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertasViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>
{
    UIAlertView * alerta;

}

- (IBAction)alertaSimple:(id)sender;
- (IBAction)alertaCampos:(id)sender;
- (IBAction)actionSheetButton:(id)sender;

- (IBAction)volverButton:(id)sender;
@end
