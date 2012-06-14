//
//  ViewController.h
//  imod
//
//  Created by Ethan Laur on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <fstream>
@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UISwitch *safetyswitch;
@property (retain, nonatomic) IBOutlet UILabel *status;
- (IBAction)install:(id)sender;
- (IBAction)statuschange:(id)sender;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
- (IBAction)longpressinstall:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *ipt3g511;
@property (retain, nonatomic) IBOutlet UIButton *otherdevice;
- (IBAction)ipt3gpush:(id)sender;
- (IBAction)otherdevicepush:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *devicelabel;

@end
