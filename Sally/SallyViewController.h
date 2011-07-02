//
//  SallyViewController.h
//  Sally
//
//  Created by Sven A. Schmidt on 02.07.11.
//  Copyright 2011 abstracture GmbH & Co. KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SallyViewController : UIViewController {
  UITextField *ek;
  UITextField *vk;
  UITextField *auf;
  UITextField *ab;
}


@property (nonatomic, strong) IBOutlet UITextField *ek;
@property (nonatomic, strong) IBOutlet UITextField *vk;
@property (nonatomic, strong) IBOutlet UITextField *auf;
@property (nonatomic, strong) IBOutlet UITextField *ab;

@end
