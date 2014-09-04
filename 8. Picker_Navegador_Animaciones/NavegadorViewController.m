//
//  NavegadorViewController.m
//  Picker_Navegador_Animaciones
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "NavegadorViewController.h"

@interface NavegadorViewController ()

@end

@implementation NavegadorViewController

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
    
    _navegador.delegate = self;
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

- (IBAction)htmlButton:(id)sender {
    NSString * html = @"<h2>Hola desde Html</h2><p style='color:red;'>Cuerpo del mensaje html</p>";
    
    [_navegador loadHTMLString:html baseURL:nil];
}

- (IBAction)jsButton:(id)sender {
    NSString * js = @"alert('Hola desde JS');";
    [_navegador stringByEvaluatingJavaScriptFromString:js];
}

- (IBAction)webButton:(id)sender {
    [_navegador setScalesPageToFit:NO];
    
    NSURL * url = [[NSURL alloc] initWithString:@"http://eltiempo.com"];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    [_navegador loadRequest:request];
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_cargando startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_cargando stopAnimating];
}
- (IBAction)pdfButton:(id)sender {
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"Documento_Conclusivo_Medellin" ofType:@"pdf"];
    NSData * datosPDF = [[NSData alloc] initWithContentsOfFile:ruta];
    
    [_navegador setScalesPageToFit:YES];
    [_navegador loadData:datosPDF MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
}
@end
