//
//  Model.h
//  MiCalendario
//
//  Created by Profesor on 30/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CalendarioViewController;

@interface Model : NSObject <UIPageViewControllerDataSource>



//Metodo que retorne el viewController de cada mes
-(CalendarioViewController*)viewControllerAtIndex: (NSInteger)index storyboard: (UIStoryboard*)storyboard;

//Metodo que me calcule el indice del mes
-(NSUInteger)indexOfViewController: (CalendarioViewController*) viewController;
@end
