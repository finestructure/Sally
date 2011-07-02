//
//  SallyViewController.m
//  Sally
//
//  Created by Sven A. Schmidt on 02.07.11.
//  Copyright 2011 abstracture GmbH & Co. KG. All rights reserved.
//

#import "SallyViewController.h"

@implementation SallyViewController
@synthesize ek = _ek;
@synthesize vk = _vk;
@synthesize auf = _auf;
@synthesize ab = _ab;
@synthesize aufSlider = _aufSlider;
@synthesize abSlider = _abSlider;

static NSNumberFormatter *formatter = nil;

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
  if (formatter == nil) {
    formatter = [[NSNumberFormatter alloc] init];
    [formatter setAlwaysShowsDecimalSeparator:YES];
    [formatter setMinimumFractionDigits:2];
    [formatter setMaximumFractionDigits:2];
  }

  [super viewDidLoad];
  self.ek.text = [formatter stringFromNumber:[NSNumber numberWithFloat:1000]];;
  self.vk.text = [formatter stringFromNumber:[NSNumber numberWithFloat:2000]];
  self.auf.text = [formatter stringFromNumber:[NSNumber numberWithFloat:2]];
  self.aufSlider.value = 2;
  self.ab.text = [formatter stringFromNumber:[NSNumber numberWithFloat:0.5]];
  self.abSlider.value = 0.5;
}

- (void)viewDidUnload
{
  [self setEk:nil];
  [self setVk:nil];
  [self setAuf:nil];
  [self setAb:nil];
  [self setAufSlider:nil];
  [self setAbSlider:nil];
  [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)aufschlagChanged:(id)sender {
  float auf = self.aufSlider.value;
  self.auf.text = [formatter stringFromNumber:[NSNumber numberWithFloat:auf]];
  float ek = [self.ek.text floatValue];
  float vk = ek * auf;
  float ab = 1 - ek/vk;
  self.vk.text = [formatter stringFromNumber:[NSNumber numberWithFloat:vk]];
  self.ab.text = [formatter stringFromNumber:[NSNumber numberWithFloat:ab]];
}

- (IBAction)abschlagChanged:(id)sender {
  float ab = self.abSlider.value;
  self.ab.text = [formatter stringFromNumber:[NSNumber numberWithFloat:ab]];
  float vk = [self.vk.text floatValue];
  float auf = 1/(1 - ab);
  float ek = vk / auf;
  self.ek.text = [formatter stringFromNumber:[NSNumber numberWithFloat:ek]];
  self.auf.text = [formatter stringFromNumber:[NSNumber numberWithFloat:auf]];
}

- (IBAction)ekChanged:(id)sender {
  float ek = [self.ek.text floatValue];
  float auf = [self.auf.text floatValue];
  float vk = ek * auf;
  self.vk.text = [formatter stringFromNumber:[NSNumber numberWithFloat:vk]];
}

- (IBAction)vkChanged:(id)sender {
  float auf = [self.auf.text floatValue];
  float vk = [self.vk.text floatValue];
  float ek = vk / auf;
  self.ek.text = [formatter stringFromNumber:[NSNumber numberWithFloat:ek]];
}

#pragma mark TextField delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
  CGRect textFieldRect =
  [self.view.window convertRect:textField.bounds fromView:textField];
  CGRect viewRect =
  [self.view.window convertRect:self.view.bounds fromView:self.view];
  
  CGRect viewFrame = self.view.frame;

  UIInterfaceOrientation orientation =
  [[UIApplication sharedApplication] statusBarOrientation];
  if (orientation == UIInterfaceOrientationPortrait ||
      orientation == UIInterfaceOrientationPortraitUpsideDown) {
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0) {
      heightFraction = 0.0;
    } else if (heightFraction > 1.0) {
      heightFraction = 1.0;
    }
    
    animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    viewFrame.origin.y -= animatedDistance;
  } else {
    CGFloat midline = textFieldRect.origin.x + 0.5 * textFieldRect.size.width;
    CGFloat numerator = midline - viewRect.origin.x - MINIMUM_SCROLL_FRACTION * viewRect.size.width;
    CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.width;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0) {
      heightFraction = 0.0;
    } else if (heightFraction > 1.0) {
      heightFraction = 1.0;
    }

    animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    viewFrame.origin.x -= animatedDistance;
  }
  
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationBeginsFromCurrentState:YES];
  [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
  
  [self.view setFrame:viewFrame];
  
  [UIView commitAnimations];
}
 

- (void)textFieldDidEndEditing:(UITextField *)textField {
  CGRect viewFrame = self.view.frame;

  UIInterfaceOrientation orientation =
  [[UIApplication sharedApplication] statusBarOrientation];
  if (orientation == UIInterfaceOrientationPortrait ||
      orientation == UIInterfaceOrientationPortraitUpsideDown) {
    viewFrame.origin.y += animatedDistance;
  } else {
    viewFrame.origin.x += animatedDistance;
  }
  
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationBeginsFromCurrentState:YES];
  [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
  
  [self.view setFrame:viewFrame];
  
  [UIView commitAnimations];
  
  if (textField == self.ek) {
    [self ekChanged:textField];
  } else if (textField == self.vk) {
    [self vkChanged:textField];
  } else if (textField == self.auf) {
    self.aufSlider.value = [[formatter numberFromString:textField.text] floatValue];
    [self aufschlagChanged:textField];
  } else if (textField == self.ab) {
    self.abSlider.value = [[formatter numberFromString:textField.text] floatValue];
    [self abschlagChanged:textField];
  }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

@end
