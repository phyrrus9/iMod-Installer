//iMod Installer Application
//Copyright © 2012 Modtech (written by phyrrus9 <phyrrus9@gmail.com>)
//this is free software, and can be used however it needs or wants to be 
//(yes, it has a mind of its own). good luck, dont ask me for help im too lazy.
#import <UIKit/UIKit.h>

#include <fstream>
#include <string.h>
#include <iostream>
@class Reachability;
@interface ViewController : UIViewController
int checkforupdate(void);
@property (retain, nonatomic) IBOutlet UISwitch *safetyswitch;
@property (retain, nonatomic) IBOutlet UILabel *status;
- (IBAction)install:(id)sender;
- (IBAction)statuschange:(id)sender;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
- (IBAction)longpressinstall:(id)sender;
- (IBAction)pinch:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *devicelabel;
@property (retain, nonatomic) IBOutlet UIButton *optionsbutton;
@property (retain, nonatomic) IBOutlet UILabel *optionslabel;
@property (retain, nonatomic) IBOutlet UIButton *installbuttonoutlet;

@end

@interface view2 : UIViewController
- (IBAction)respring:(id)sender;
- (IBAction)reboot:(id)sender;
- (IBAction)respringprep:(id)sender;
- (IBAction)rebootprep:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *status2;

@end
