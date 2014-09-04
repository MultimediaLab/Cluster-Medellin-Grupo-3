//
//  ViewController.m
//  Vendedores
//
//  Created by Profesor on 2/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"
#import "Vendedores.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	Vendedores * vendedor = [[Vendedores alloc] init];
    [vendedor createDatabaseforSellers];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
