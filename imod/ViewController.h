//iMod Installer Application
//Copyright © 2012 Modtech (written by phyrrus9 <phyrrus9@gmail.com>)
//this is free software, and can be used however it needs or wants to be 
//(yes, it has a mind of its own). good luck, dont ask me for help im too lazy.
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