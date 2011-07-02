//
//  SallyViewController.h
//  Sally
//
//  Created by Sven A. Schmidt on 02.07.11.
//  Copyright 2011 abstracture GmbH & Co. KG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SallyViewController : UIViewController {
  UITextField *_ek;
  UITextField *_vk;
  UITextField *_auf;
  UITextField *_ab;
  UISlider *_aufSlider;
  UISlider *_abSlider;
  UIButton *_ekLock;
  UIButton *_vkLock;

  CGFloat animatedDistance;
}


@property (nonatomic, strong) IBOutlet UITextField *ek;
@property (nonatomic, strong) IBOutlet UITextField *vk;
@property (nonatomic, strong) IBOutlet UITextField *auf;
@property (nonatomic, strong) IBOutlet UITextField *ab;
@property (nonatomic, strong) IBOutlet UISlider *aufSlider;
@property (nonatomic, strong) IBOutlet UISlider *abSlider;

@property (nonatomic, strong) IBOutlet UIButton *ekLock;
@property (nonatomic, strong) IBOutlet UIButton *vkLock;

- (IBAction)aufschlagChanged:(id)sender;
- (IBAction)abschlagChanged:(id)sender;
- (IBAction)ekChanged:(id)sender;
- (IBAction)vkChanged:(id)sender;

- (IBAction)ekLockTapped:(id)sender;
- (IBAction)vkLockTapped:(id)sender;

@end
