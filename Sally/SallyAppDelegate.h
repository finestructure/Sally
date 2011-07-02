//
//  SallyAppDelegate.h
//  Sally
//
//  Created by Sven A. Schmidt on 02.07.11.
//  Copyright 2011 abstracture GmbH & Co. KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SallyViewController;

@interface SallyAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SallyViewController *viewController;

@end
