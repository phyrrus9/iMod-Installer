//iMod Installer Application
//Copyright © 2012 Modtech (written by phyrrus9 <phyrrus9@gmail.com>)
//this is free software, and can be used however it needs or wants to be 
//(yes, it has a mind of its own). good luck, dont ask me for help im too lazy.
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
        system("dpkg -i /Applications/imod.app/imod.deb");
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
