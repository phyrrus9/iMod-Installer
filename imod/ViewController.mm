//
//  ViewController.m
//  imod
//
//  Created by Ethan Laur on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
using namespace std;
@interface ViewController ()

@end

@implementation ViewController
@synthesize devicelabel;
@synthesize ipt3g511;
@synthesize otherdevice;
@synthesize spinner;
@synthesize safetyswitch;
@synthesize status;

enum device { IPT3G, OTHER };
//hello
device d = IPT3G;

- (void)displayDevice
{
    NSString *s;
    if (d == IPT3G)
        s = @"iPod Touch 3G";
    else 
        s = @"Unknown Device";
    [devicelabel setText:s];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayDevice];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setSafetyswitch:nil];
    [self setStatus:nil];
    [self setProgress:nil];
    [self setSpinner:nil];
    [self setIpt3g511:nil];
    [self setOtherdevice:nil];
    [self setDevicelabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return false;
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)dealloc {
    [safetyswitch release];
    [status release];
    [spinner release];
    [ipt3g511 release];
    [otherdevice release];
    [devicelabel release];
    [super dealloc];
}
- (IBAction)install:(id)sender {
    if (safetyswitch.on)
    {
        //[NSThread detachNewThreadSelector:@selector(lol) toTarget:self withObject:nil];
        //system("dpkg -i /Applications/imod.app/imod.deb");
        sleep(3);
        status.text = @"Finished!";
        spinner.stopAnimating;
        safetyswitch.on = false;
    }
}
- (void)reload {
    
}

- (IBAction)statuschange:(id)sender {
    if (safetyswitch.on)
    {
        UILocalNotification *nc = [[UILocalNotification alloc] init];
        [nc setFireDate:[NSDate date]];
        [nc setAlertBody:@"Hello"];
        [[UIApplication sharedApplication] scheduleLocalNotification:nc];
        [nc release];
        status.text = @"Installing...";
        spinner.startAnimating;
    }
}
- (IBAction)longpressinstall:(id)sender {
    [status setText:@"Long pressed!"];
    [ipt3g511 setHidden:false];
    [otherdevice setHidden:false];
}
- (IBAction)ipt3gpush:(id)sender {
    d = IPT3G;
    [self displayDevice];
}

- (IBAction)otherdevicepush:(id)sender {
    d = OTHER;
    [self displayDevice];
}
@end
