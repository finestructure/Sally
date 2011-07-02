//
//  SallyViewController.m
//  Sally
//
//  Created by Sven A. Schmidt on 02.07.11.
//  Copyright 2011 abstracture GmbH & Co. KG. All rights reserved.
//

#import "SallyViewController.h"

@implementation SallyViewController
@synthesize ek;
@synthesize vk;
@synthesize auf;
@synthesize ab;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.ek.text = @"1000";
}

- (void)viewDidUnload
{
  [self setEk:nil];
  [self setVk:nil];
  [self setAuf:nil];
  [self setAb:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
  UISlider *slider = (UISlider *)sender;
  self.auf.text = [NSString stringWithFormat:@"%.0f", slider.value*100];
}

- (IBAction)abschlagChanged:(id)sender {
  UISlider *slider = (UISlider *)sender;
  self.ab.text = [NSString stringWithFormat:@"%.0f", slider.value*100];
}

@end
